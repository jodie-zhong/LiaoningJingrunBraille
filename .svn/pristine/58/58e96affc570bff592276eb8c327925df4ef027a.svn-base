define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    // 工作流类窗口继承自工作流Base
    var Base = require('../../other/base/book-base');
    var listTpl = require('./ts-manage-list.tpl');

    module.exports = Base.extend(new function () {
        var LIST_FLOW_ACTION = 'common/searchBookFlowList.action';
        var FIRST_FLOW = 'cn_layoutNote';
        var TASK_FINISHED = '2';
        var that;
        var selectedBookNames = [];

        this.deployKey = 'CNBookPublishing';
        this.taskListAction = 'composing/searchComposingList.action';
        // 与我相关
        this.searchTaskAbout = '1';
        // 其他搜索选项
        this.searchParams = {};

        this.baseTpl = listTpl;

        /**
         * 选择行变更事件回调
         */
        this.onSelectRowChanged = function () {
            // 暂时啥也不做
        };

        this.onCheckRowChanged = function () {
            // 默认禁用
            this.$('#btnView').attr('disabled', 'disabled');// 查看
            this.$('#btnDeal').attr('disabled', 'disabled');// 处理
            this.$('#btnDealBatch').attr('disabled', 'disabled');// 批量处理
            // 循环检查选中的条目
            var count = 0, lastFlowId = null, users = null, bookIds = [], taskIds = [];
            var allMe = true, allUnfinished = true, allSameFlow = true, viewAvailable = true;
            var userId = util.getUserInfo().userId;
            var flowId = '';
            that.$('#workListTBody').find('tr[checked]').each(function () {
                flowId = $(this).attr('data-flowId');
                // 没有数据时，没有符合指定条件的数据的提示也当作child了，需要区分一下
                if (flowId !== undefined) {
                    // 判断是否同一流程
                    if (lastFlowId === null) {
                        lastFlowId = flowId;
                    }
                    if (lastFlowId !== flowId) {
                        allSameFlow = false;
                    }
                    // 判断是否可查看
                    if (flowId === FIRST_FLOW && $(this).attr("data-isInFirst") === '1') {
                        viewAvailable = false;
                    }
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
                    // 循环处理
                    bookIds.push(that.$(this).attr('data-bookId'));
                    taskIds.push(that.$(this).attr('data-taskId'));
                    selectedBookNames.push($(this).attr("data-bookName"));
                    count++;
                }
            });

            this.currentBookId = bookIds.join(',');
            this.currentTaskId = taskIds.join(',');

            // 查看（第一个流程编辑状态时不能查看）
            if (count === 1 && viewAvailable) {
                this.$('#btnView').removeAttr('disabled');
            }
            // 其他按钮判断
            if (allMe && allSameFlow && allUnfinished && count === 1) {
                this.$('#btnDeal').removeAttr('disabled');
            }
        };

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            // 查看
            that.$container.on('click', '#btnView', function () {
                that.openPage('public/workflow/workflow-dialog', {
                    flowInfoAction: LIST_FLOW_ACTION,
                    bookId: that.currentBookId,
                    taskId: that.currentTaskId,
                    deployId: that.deployKey,
                    isView: true
                });
            });
            // 处理
            that.$container.on('click', '#btnDeal', function () {
                var btnText = $(this).text();
                that.openPage('public/workflow/workflow-dialog', {
                    flowInfoAction: LIST_FLOW_ACTION,
                    bookId: that.currentBookId,
                    taskId: that.currentTaskId,
                    deployId: that.deployKey,
                    btnText: btnText
                });
            });
            // 批量处理
            that.$container.on('click', '#btnDealBatch', function () {
                var btnText = $(this).text();
                that.openPage('public/workflow/workflow-dialog', {
                    flowInfoAction: LIST_FLOW_ACTION,
                    bookId: that.currentBookId,
                    taskId: that.currentTaskId,
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