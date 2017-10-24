define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    // 工作流类窗口继承自工作流Base
    var Base = require('../../other/base/book-base');
    var listTpl = require('./proofread-manage-list.tpl');


    var FLOW_FIRSTTASKSTART = 'cn_firstTaskStart';//一校任务发起
    var FLOW_SECONDTASKSTART = 'cn_secondTaskStart';  //二校任务发起
    var THIRDTASKSTART = 'cn_thirdTaskStart'; //三校任务发起
    var FIRSTTASKENTRUST = 'cn_firstTaskEntrust'; //一校任务委托
    var SECONDTASKENTRUST = 'cn_secondTaskEntrust' //二校任务委托
    var THIRSTASKENTRUST = 'cn_thirdTaskEntrust';//三校任务委托
    var FIRSTTASKCONFIRM = 'cn_firstTaskConfirm';//一校任务确认
    var SECONDTASKCONFIRM = 'cn_secondTaskConfirm';//二校任务确认
    var THIRDTASKCONFIRM = 'cn_thirdTaskConfirm';  //三校任务确认
    var FIRSTCHECK = 'cn_firstCheck';//一校
    var SECONDCHECK = 'cn_secondCheck';//二校
    var THIRDCHECK = 'cn_thirdCheck'; //三校
    var FIRSTCORRIGENDUMCONFIRM = 'cn_firstCorrigendumConfirm';//一校勘误表确认
    var SECONDCORRIGENDUMCONFIRM = 'cn_secondCorrigendumConfirm'; //二校勘误表确认
    var THIRDCORRIGENDUMCONFIRM = 'cn_thirdCorrigendumConfirm';//三校勘误表确认
    var FIRSTPROOFREWRITE = 'cn_firstProofRewrite ';//一校改稿
    var SECONDPROOFREWRITE = 'cn_secondProofRewrite';//二校改稿
    var THIRDPROOFREWRITE = 'cn_thirdProofRewrite';//三校改稿
    var FIRSTCHECKRED = 'cn_firstCheckRed';//一校核红
    var SECONDCHECKRED = 'cn_secondCheckRed'; //二校核红
    var THIRDCHECKRED = 'cn_thirdCheckRed'; //三校核红
    var FIRSTCHECKREDREWRITE = 'cn_firstCheckRedRewrite';//一校核红改稿
    var SECONDCHECKREDREWRITE = 'cn_secondCheckRedRewrite';//二校核红改稿
    var THIRDCHECKREDREWRITE = 'cn_thirdCheckRedRewrite';//三校核红改稿
    module.exports = Base.extend(new function () {
        var FLOW_LIST_ACTION = 'common/searchBookFlowList.action';
        var TASK_FINISHED = '2';
        var that;

        this.deployKey = 'CNTaskAllocation';
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
            var taskAssignmentBtn = this.$('#btnTaskAssignment');// 发起校对
            var viewBtn = this.$('#btnView');// 查看
            var dealBtn = this.$('#btnDeal');// 处理

            // 默认全部禁用
            taskAssignmentBtn.attr('disabled', 'disabled');
            viewBtn.attr('disabled', 'disabled');
            dealBtn.attr('disabled', 'disabled');

            // 循环检查选中的条目
            var count = 0, users = null, bookIds = [], taskIds = [], flowIds = [];
            var dealAvailable = true, viewAvailable = true,startAvailable = false;
            var userId = util.getUserInfo().userId;
            that.$('#workListTBody').find('tr[checked]').each(function () {
                var flowId = $(this).attr('data-flowId');
                // 没有数据时，没有符合指定条件的数据的提示也当作child了，需要区分一下
                if (flowId !== undefined) {
                    // 判断是否是查看的流程
                    if (flowId === FLOW_FIRSTTASKSTART) {
                        viewAvailable = false;
                    }
                    // 判断是否都是我处理
                    users = that.$(this).attr('data-users') || '';
                    users = users ? users.split(',') : [];
                    if (users.indexOf(userId) < 0) {
                        dealAvailable = false;
                    }
                    // 任务状态未完成
                    if (that.$(this).attr('data-taskState') === TASK_FINISHED) {
                        dealAvailable = false;
                    }
                    // 是否是发起阶段
                    if(flowId===FLOW_FIRSTTASKSTART){
                        dealAvailable = false;
                        startAvailable = true;
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

            if (count !== 1) {
                return;
            }
            // 查看按钮判断
            if (viewAvailable) {
                viewBtn.removeAttr('disabled');
            }
            // 发起校对
            if(startAvailable){
                taskAssignmentBtn.removeAttr('disabled');
            }

            // 处理按钮判断
            if (dealAvailable) {
                dealBtn.removeAttr('disabled');
            }
        };

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
           /* that.openPage('public/workflow/workflow-dialog', {
                debug: true,
                flowTemplate: 'cn-proofread/proofread-confirmation',
                isEdit: true
            });*/

            // 发起校对
            that.$container.on('click', '#btnTaskAssignment', function () {
                var btnText = $(this).text();
                that.openPage('public/workflow/workflow-dialog', {
                    flowInfoAction: FLOW_LIST_ACTION,
                    bookId: that.currentBookId,
                    taskId: that.currentTaskId,
                    deployId: that.deployKey,
                    btnText: btnText
                });
            });
            // 查看
            that.$container.on('click', '#btnView', function () {
                that.openPage('public/workflow/workflow-dialog', {
                    flowInfoAction: FLOW_LIST_ACTION,
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
                    flowInfoAction: FLOW_LIST_ACTION,
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