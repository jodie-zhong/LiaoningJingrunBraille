define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var Base = require('../../../common/base-dialog');

    // 流程映射关系
    // var flowMapping = require('./workflow-mapping');

    var Module = Base.extend({
        // 图书或选题ID
        // 如果未批量审批模式，bookId可能为一个逗号分隔的数组
        bookId: null,
        topicId: null,
        // 流程类型ID
        flowId: null,
        // 流程类型名称
        flowName: null,
        // 任务ID
        taskId: null,
        // 流程数据
        flowData: null,
        // 任务大类
        deployId: null,
        // 正在展开的Workflow Item
        loadingFlowItem: null,
        // 可编辑的Workflow Item（每个流程最多只有一个可编辑）
        editFlowItem: null,

        // 查看模式
        isView: false,

        /**
         * 第一步查询流程信息
         */
        searchFlowInfo: function () {
            // bookId可能是一个数组，只取第一个
            var id = this.bookId ? this.bookId.split(',')[0] : '';
            var topicId = this.topicId ? this.topicId.split(',')[0] : '';
            util.showLoading();
            util.sendRequest({
                action: this.flowInfoAction,
                data: {
                    bookId: id,
                    topicId: topicId,
                    searchFlowId: this.searchFlowId,
                    bookDeploymentKey: this.deployId,
                    isView: this.isView || '',
                },
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        // 判断是否有bookName和dutyEditor字段，批量处理是不显示图书名称和责任编辑
                        if (typeof resp.data.bookName !== 'undefined' ) {
                            // 渲染头部图书名称和责任编辑字段
                            if (resp.data.bookName) {
                                var tBName = resp.data.bookName.length < 21 ? resp.data.bookName : resp.data.bookName.substring(0, 20) + "...";
                                this.$('.titleBookName').text('图书名称：' + tBName);
                                this.$('.titleBookName').attr('title', resp.data.bookName);
                            }
                            if (resp.data.dutyEditor) {
                                var tBEditor = resp.data.dutyEditor.length < 21 ? resp.data.dutyEditor : resp.data.dutyEditor.substring(0, 20) + "...";
                                this.$('.titleDutyEditor').text('责任编辑：' + tBEditor);
                                this.$('.titleDutyEditor').attr('title', resp.data.dutyEditor);
                            }
                        } else {
                            this.$('.titleBookName').text('');
                            this.$('.titleDutyEditor').text('');
                        }
                        // 批量操作(但需要排除有的页面传多个id,同时显示全部的列表的情况)
                        if ((this.bookId && this.bookId.indexOf(',') >= 0) || (this.topicId && this.topicId.indexOf(',') >= 0)) {
                            if(this.showAllList){
                                this.flowData = resp.data.listFlow;
                            }else{
                                // 如果是批量操作只保留最后一个工作流
                                this.flowData = resp.data.listFlow.slice(-1);
                            }
                            this.$('.titleBookName').text('');
                            this.$('.titleDutyEditor').text('');
                        } else {
                            this.flowData = resp.data.listFlow;
                        }
                        this.flowId = resp.data.currentFlow;
                        this.flowName = resp.data.currentFlowName;
                        // TODO: 暂时注掉
                        // 加载右侧工作流提示
                        // this.renderWorkflowTip();
                        // 同步生成界面
                        this.renderWorkflowPanel();
                    } else {
                        console.log(resp);
                        util.showAlert(resp.message || '查询任务流程信息失败！');
                    }
                }.bind(this),
                error: function (xhr) {
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('查询任务流程信息失败！');
                }
            });
        },

        /**
         * 生成工作流面板
         */
        renderWorkflowPanel: function () {
            var flowPanelTpl = '' +
                '<% for(var i = 0; i < list.length;i++) { %>' +
                '<% if(list[i].flowId !== "abandoned") { %>' +
                '<div class="flow-panel">' +
                '  <div class="flow-panel-header"' +
                '    <span class="c-primary"><i class="fa fa-caret-right"></i> <%- list[i].flowName %></span>' +
                '  </div>' +
                '  <div class="flow-panel-body" data-taskId="<%- list[i].taskId %>" data-flowId="<%- list[i].flowId %>" data-instance="<%- list[i].processInstanceId %>" data-index="<%- i %>">' +
                '  </div>' +
                '</div>' +
                '<% } %>' +
                '<% } %>';

            var $flowPanel = this.$('#panelWorkflow');
            $flowPanel.html(util.template(flowPanelTpl, {list: this.flowData, isView: this.isView}));

            // 查看模式
            if (this.isView){
                // 第一个为当前工作流
                this.$('.flow-panel').first().find('.fa-caret-right').removeClass('fa-caret-right').addClass('fa-caret-down');
                this.loadingFlowItem = this.$('.flow-panel').first().find('.flow-panel-body');
                // 默认渲染第一个
                this.renderWorkflowItem(this.loadingFlowItem.attr('data-flowId'), this.loadingFlowItem.attr('data-taskId'), this.loadingFlowItem.attr('data-index'), this.loadingFlowItem.attr('data-instance'), false);
            }
        },

        /**
         * 生成每个WorkFlow项目
         * @param flowId
         * @param taskId
         * @param current
         */
        renderWorkflowItem: function (flowId, taskId, itemIndex, instance, current) {
                // 匹配到开始渲染
                util.showLoading();
                var that = this;
                // 加载模板
                seajs.use(['./modules/resource/library/library-histroy.js', './modules/resource/library/library-histroy.tpl'], function (Item, tpl) {
                    // 避免加载异常
                    if (!Item || !tpl) {
                        util.hideLoading();
                        util.showAlert('加载数据出错');
                        return;
                    }

                    // 初始化Flow Item
                    var flowItem = new Item(that.loadingFlowItem, tpl);
                    flowItem.workflowDialog = that;
                    // 查询流程详情
                    util.sendRequest({
                        action: flowItem.detailAction,
                        data: {
                            taskId: taskId,
                            flowId: flowId,
                            processInstanceId: instance,
                            bookId: that.bookId,
                            topicId: that.topicId
                        },
                        success: function (resp) {
                            util.hideLoading();
                            if (resp.code === 0) {
                                // 设置Flow Item的数据
                                flowItem.setData({
                                    isEdit: current,
                                    info: resp.data
                                });

                            } else {
                                console.log(resp);
                                util.showAlert(resp.message || '查询流程详情出错，请稍后重试！');
                            }
                        },
                        error: function (xhr) {
                            util.hideLoading();
                            console.log(xhr);
                            util.showAlert('查询流程详情出错，请稍后重试！');
                        }
                    });
                });
        },

        /**
         * 计算当前元素相对于#panelWorkflow的偏移
         * @param el
         * @returns {number}
         */
        getOffsetTop: function (el) {
            var yPos = 0;
            // 网上找到的一段方法
            while (el) {
                if (el.id === 'panelWorkflow') {
                    yPos += (el.offsetTop + el.clientTop);
                    break;
                } else {
                    yPos += (el.offsetTop + el.clientTop);
                }
                el = el.offsetParent;
            }
            return yPos - 120;
        },


        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
            // 展开面板
            this.$container.on('click', '.flow-panel-header', function () {
                var $el = $(this);
                if ($el.hasClass('frozen')) {
                    return;
                }
                var $pBody = $el.parent().find('.flow-panel-body');
                if ($pBody.find('.form-group').length === 0) {
                    // 修改图标样式
                    $el.find('.fa-caret-right').removeClass('fa-caret-right').addClass('fa-caret-down');
                    // 加载当前面板
                    that.loadingFlowItem = $pBody;
                    // 默认渲染最后一个编辑状态
                    that.renderWorkflowItem(that.loadingFlowItem.attr('data-flowId'), that.loadingFlowItem.attr('data-taskId'), that.loadingFlowItem.attr('data-index'), that.loadingFlowItem.attr('data-instance'), false);
                } else {
                    // 有内容，判断需要展开还是收起
                    if ($pBody.find('.form-horizontal:visible').length > 0) {
                        $el.find('.fa-caret-down').removeClass('fa-caret-down').addClass('fa-caret-right');
                        $pBody.find('.form-horizontal').hide();
                    } else {
                        $el.find('.fa-caret-right').removeClass('fa-caret-right').addClass('fa-caret-down');
                        $pBody.find('.form-horizontal').show();
                    }
                }
            });

        },


        /**
         * 初始化页面数据
         */
        initPageData: function (data) {
            // 第一步查询流程信息
            this.searchFlowInfo();
        },

        /**
         * 初始化时被调用
         */
        onInit: function ($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);

            // 允许自定义流程信息集合接口
            this.flowInfoAction = data.flowInfoAction || this.flowInfoAction;
            this.bookId = data.bookId;
            this.showAllList=data.showAllList;
            this.topicId = data.topicId;
            this.taskId = data.taskId;
            this.deployId = data.deployId;
            // 查看模式
            this.isView = data.isView;
            // 具体模式
            this.btnText = data.btnText;
            // 自定义参数
            var obj={
                btnText:this.btnText,
                isView: this.isView
            }
            this.initTemplate(tpl, {isView: obj});

            // TODO: 调试流程样式用
            if (!data.debug) {
                // 初始化页面事件
                this.initPageEvent();

                // 初始化页面数据
                this.initPageData(data);
            }
        },

        /**
         * 页面返回事件
         * @param data
         */
        onBack: function (data) {
            this._super(data);

            if (this.editFlowItem && this.editFlowItem.back) {
                this.editFlowItem.back(data);
            }
        },

        /**
         * 窗口缩放事件
         */
        onResize: function () {
            this._super();
        },

        /**
         * 页面销毁
         */
        onDestroy: function () {
            this._super();
        }


    });

    module.exports = Module;
});