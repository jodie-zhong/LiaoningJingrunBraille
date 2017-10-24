define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var DialogBase = require('../../../common/base-dialog');
    var SUBMIT_ACTION = 'tpr/saveOrSubmitTaskAllocation.action';

    module.exports = DialogBase.extend(new function () {
        var that;
        var info;

        /**
         * 保存或提交数据
         */
        function saveOrSubmitData(isSave) {
            // 表单验证
            var $form = that.$('#formDiv');
            // 没有错误开始处理
            if (that.validate($form)) {
                var params = {
                    tprTaskType: that.$("input[name='tprTaskType']:checked").val(),
                    tprTaskContent: that.$("textarea[name='tprTaskContent']").val(),
                    tprTaskUseCount: that.$("input[name='tprTaskUseCount']").val(),
                    auditCenterWordOne: that.$("input[name='auditCenterWordOne']").val(),
                    auditCenterWordTwo: that.$("input[name='auditCenterWordTwo']").val(),
                    auditType: that.$("select[name='auditType']").val(),
                    auditWorkway: that.$("select[name='auditWorkway']").val()
                };
                // info.userTaskEntities.length === 1时不能选择，所以直接取userTaskEntities里的值，如果>1buildFormParams会自动取select的值
                if (info.userTaskEntities.length === 1) {
                    params.flowId = info.userTaskEntities[0].flowId;
                    params.flowName = info.userTaskEntities[0].flowName;
                } else {
                    params.flowId = that.$("select[name='flowId']").val();
                    for (var i = 0; i < info.userTaskEntities.length; i++) {
                        if (info.userTaskEntities[i].flowId === params.flowId) {
                            params.flowName = info.userTaskEntities[i].flowName;
                        }
                    }
                }
                params.currentFlowId = info.flowId;
                params.currentFlowName = info.flowName;
                params.taskUsers = params.flowId === 'qualityTestCollect' ? that.$("input[name='taskUsersQc']").attr("data-value") : that.$("input[name='taskUsersTk']").attr("data-value");
                params.operationType = isSave ? '1' : '2';
                params.taskStateName = '无';
                params.bookId = info.bookId;
                params.taskId = info.taskId;
                params.tprTaskId = info.tprTaskId;
                params.tprTaskFlow = params.flowId;
                params.tprTaskFlowName = params.flowName;
                util.showLoading();
                util.sendRequest({
                    type: 'POST',
                    data: params,
                    action: SUBMIT_ACTION,
                    success: function (resp) {
                        // 请求成功（200）
                        util.hideLoading();
                        if (resp.code === 0) {
                            // 业务执行成功
                            util.showAlert('任务' + (isSave ? '保存' : '分配') + '成功!', function () {
                                that.close({refresh: true});
                            });
                        } else {
                            // 业务执行失败
                            util.showAlert(resp.message || '任务' + (isSave ? '保存' : '分配') + '失败!');
                        }
                    },
                    error: function (xhr) {
                        // XHR错误
                        util.hideLoading();
                        console.log(xhr);
                        util.showAlert('任务' + (isSave ? '保存' : '分配') + '出错，请稍后重试!');
                    }
                });
            }
        }

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            // 流程选择切换
            that.$container.on('change', "select[name='flowId']", function () {
                if ($(this).val() === 'qualityTestCollect') {
                    that.$("div[data-area='qcArea']").show();
                    that.$("div[data-area='taskArea']").hide();
                } else {
                    that.$("div[data-area='qcArea']").hide();
                    that.$("div[data-area='taskArea']").show();
                }
            });
            // 指定众包切换
            that.$container.on('change', 'input[name="tprTaskType"]', function () {
                var handle = that.$('input[name="tprTaskType"]:checked').val();
                if (handle === '1') {
                    that.$('div[data-area="selectUsers"]').show();
                    that.$('div[data-area="inputCount"]').hide();
                } else {
                    that.$('div[data-area="selectUsers"]').hide();
                    that.$('div[data-area="inputCount"]').show();
                }
            });
            // 保存
            that.$container.on('click', '#btnSave', function () {
                saveOrSubmitData(true);
            });
            // 提交
            that.$container.on('click', '#btnSubmit', function () {
                util.showConfirm('确定要提交么？', function () {
                    saveOrSubmitData(false);
                });
            });
        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
            that.initValidate(that.$('#formDiv'));
            // 根据单选状态初始化选择任务人和填写任务数量的显示
            if (info.tprTaskType === '2') {
                that.$('div[data-area="inputCount"]').show();
            } else {
                that.$('div[data-area="selectUsers"]').show();
            }
            // 根据选择的流程判断任务人显示方式
            if (info.nextTaskFlowInfoEntity.flowId === 'qualityTestCollect') {
                that.$("div[data-area='qcArea']").show();
            } else {
                that.$("div[data-area='taskArea']").show();
            }
        }

        /**
         * 初始化时被调用
         */
        this.onInit = function ($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);
            that = this;
            info = data;
            that.initTemplate(tpl, {info: data});
            // 初始化页面数据
            initPageData();
            // 初始化页面事件
            initPageEvent();
        };

        /**
         * 页面返回事件
         * @param data
         */
        this.onBack = function (data) {
            this._super(data);
            // 将title值设置为返回的数据
            // this.$("input[name='" + (that.$("input[name='tprTaskType]:checked").val() === 'qualityTestCollect' ? "taskUsersQc" : "taskUsersTk") + "']").attr('title', data.name);
            this.$("input[name='taskUsersQc']").attr('title', data.name);
            this.$("input[name='taskUsersTk']").attr('title', data.name);
        };

        /**
         * 窗口缩放事件
         */
        this.onResize = function () {
            this._super();
        };

        /**
         * 页面销毁
         */
        this.onDestroy = function () {
            this._super();
        };
    }());
});