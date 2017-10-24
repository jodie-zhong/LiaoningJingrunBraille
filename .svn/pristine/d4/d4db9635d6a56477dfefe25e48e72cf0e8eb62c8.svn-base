define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    // 工作流类窗口继承自工作流Base
    var Base = require('../../other/base/book-base');
    var listTpl = require('./pre-press-qc-manage-list.tpl');

    module.exports = Base.extend(new function () {
        var FLOW_LIST_ACTION = 'common/searchBookFlowList.action';
        var FIRST_FLOW_ID = "cn_qualityTestCollect";
        var TASK_FINISHED = '2';
        var that;
        var selectedFlowIds;

        this.deployKey = 'CNQualityTest';
        // 与我相关
        this.searchTaskAbout = '1';
        // 其他搜索选项
        this.searchParams = {};

        /**
         * 选择行变更事件回调
         */
        this.onSelectRowChanged = function () {
            // 暂时啥也不做
        };

        this.onCheckRowChanged = function () {
            // 按钮
            var viewBtn = this.$('#btnView');// 查看
            var dealBtn = this.$('#btnDeal');// 处理
            // 默认全部禁用
            viewBtn.attr('disabled', 'disabled');
            dealBtn.attr('disabled', 'disabled');
            // 循环检查选中的条目
            var count = 0, users = null, bookIds = [], taskIds = [], flowIds = [];
            var allMe = true, allUnfinished = true, viewAvailable = false;
            var userId = util.getUserInfo().userId;
            that.$('#workListTBody').find('tr[checked]').each(function () {
                var flowId = $(this).attr('data-flowId');
                // 没有数据时，没有符合指定条件的数据的提示也当作child了，需要区分一下
                if (flowId !== undefined) {
                    // 判断是否都是我处理
                    users = that.$(this).attr('data-users') || '';
                    users = users ? users.split(',') : [];
                    if (users.indexOf(userId) < 0) {
                        allMe = false;
                    }
                    // 任务状态未完成
                    if (that.$(this).attr('data-taskState') === TASK_FINISHED) {
                        allUnfinished = false;
                    }
                    // 可查看
                    if ($(this).attr("data-overTaskNum") > 0) {
                        viewAvailable = true;
                    }
                    // 循环处理
                    bookIds.push(that.$(this).attr('data-bookId'));
                    taskIds.push(that.$(this).attr('data-taskId'));
                    flowIds.push(flowId);
                    count++;
                }
            });

            this.currentBookId = bookIds.join(',');
            this.currentTaskId = taskIds.join(',');
            selectedFlowIds = flowIds.join(",");

            if (count !== 1) {
                return;
            }
            // 查看按钮判断
            if (viewAvailable) {
                viewBtn.removeAttr('disabled');
            }
            // 处理按钮判断
            if (allMe && allUnfinished) {
                dealBtn.removeAttr('disabled');
            }
        };

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            // 查看
            that.$container.on('click', '#btnView', function () {
                that.openPage('public/workflow/workflow-dialog', {
                    flowInfoAction: FLOW_LIST_ACTION,
                    bookId: that.currentBookId,
                    taskId: that.currentTaskId,
                    deployId: that.deployKey,
                    searchFlowId: selectedFlowIds,
                    isView: true
                });
            });
            // 处理
            that.$container.on('click', '#btnDeal', function () {
                var btnText = $(this).text();
                that.openPage('public/workflow/workflow-dialog', {
                    flowInfoAction: FLOW_LIST_ACTION,
                    bookId: that.currentBookId,
                    taskId: that.currentTaskId,
                    searchFlowId: selectedFlowIds,
                    deployId: that.deployKey,
                    btnText: btnText
                });
            });
        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
        }

        /**
         * 初始化时被调用
         */
        this.onInit = function ($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);
            that = this;
            // 初始化数据前需要设置列表模板
            this.baseTpl = listTpl;
            // 初始化页面事件
            initPageEvent();
            // 初始化页面数据
            initPageData();
        };

        /**
         * 页面返回事件
         * @param data
         */
        this.onBack = function (data) {
            this._super(data);
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