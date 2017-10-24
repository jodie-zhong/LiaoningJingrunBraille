define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util.js');
    // 工作流类窗口继承自工作流Base
    var Base = require('../../other/base/book-base');
    var rewardListTpl = require('./remuneration-apply-list.tpl');

    var Module = Base.extend(new function () {
        var that;

        this.deployKey = 'CNRewardNotEntered';
        // 查询任务树中未完成任务数的接口
        // this.untreatedTaskAction = 'topic/unreadTopicCount.action';

        // 其他搜索选项
        this.searchParams = {};

        // this.flowInfoAction='common/searchBookFlowList.action';

        /**
         * 搜索任务列表的接口(覆盖父级)
         */
        this.taskListAction = 'remuneration/searchRewardList.action';

        this.treeName = '图书';

        /**
         * 选择行变更事件回调
         */
        this.onSelectRowChanged = function () {

        };

        this.onCheckRowChanged = function () {
            // 默认禁用
            this.$('#btnSearch').attr('disabled', 'disabled');        // 稿酬
            var count = 0, bookIds = [], states = [];
            that.$('#workListTBody').find('tr[checked]').each(function () {
                states.push($(this).attr('data-hRewardState'));
                bookIds.push($(this).attr('data-bookId'));
                count++;
            });
            this.currentBookId = bookIds.join(',');
            this.currentState = states.join(',');
            if (count === 1) {
                this.$('#btnSearch').removeAttr('disabled');        // 稿酬
            } else {
                this.$('#btnSearch').attr('disabled', 'disabled');
            }
        };

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            that.$container.on('click', '#btnSearch', function () {
                that.openPage('chinese/remuneration-apply/remuneration-apply-sheet', {
                    bookId: that.currentBookId,
                    state: that.currentState
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
            this.baseTpl = rewardListTpl;

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
            if (data && data.refresh === true) {
                this.$('#btnSearch').attr('disabled', 'disabled');        // 处理
            }
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

    module.exports = Module;
});