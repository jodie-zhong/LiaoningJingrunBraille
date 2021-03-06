define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    // 工作流类窗口继承自工作流Base
    var Base = require('../../other/base/book-base');
    var listTpl = require('./tprt-manage-list.tpl');

    module.exports = Base.extend(new function () {
        var FLOW_LIST_ACTION = 'common/searchBookFlowList.action';
        var TASK_FINISHED = '2';
        var FLOW_TASK_ASSIGNMENT = 'taskAllocation';
        var FLOW_TASK_ACCEPTION = ['translationTaskLead', 'firstProofreaTaskLead', 'secondProofreaTaskLead', 'thirdProofreaTaskLead', 'otherThirdProofreaTaskLead', 'readTaskLead'];
        var BATCH_AVAILABLE_FLOWS = [
            // TODO
        ];
        var AVAILABLE_FLOWS = [
            'taskAllocation', 'translationTaskLead', 'firstProofreaTaskLead', 'secondProofreaTaskLead', 'thirdProofreaTaskLead', 'otherThirdProofreaTaskLead', 'readTaskLead',
            'translationReturnBook', 'firstProofreadReturnBook', 'secondProofreadReturnBook', 'thirdProofreadReturnBook', 'otherThirdProofreadReturnBook', 'readReturnBook',
            'translationAcceptBook', 'firstProofreadAcceptBook', 'secondProofreadAcceptBook', 'thirdProofreadAcceptBook', 'otherThirdProofreadAcceptBook', 'readAcceptBook',
            'translationSendBook', 'firstProofreadSendBook', 'secondProofreadSendBook', 'thirdProofreadSendBook', 'otherThirdProofreadSendBook', 'readSendBook',
            'translationTranslation', 'firstProofread', 'secondProofread', 'thirdProofread', 'otherThirdProofread', 'readRead',
            'firstProofreadRigthWrongConfirm', 'secondProofreadRigthWrongConfirm', 'thirdProofreadRigthWrongConfirm', 'otherThirdProofreadRigthWrongConfirm', 'readRigthWrongConfirm',
            'firstProofreadRigthWrongAudit', 'secondProofreadRigthWrongAudit', 'thirdProofreadRigthWrongAudit', 'otherThirdProofreadRigthWrongAudit', 'readRigthWrongAudit',
            'firstProofreadModify', 'secondProofreadModify', 'thirdProofreadModify', 'otherThirdProofreadModify', 'readModify'
        ];
        var that;

        this.deployKey = 'tpr';
        // 与我相关
        this.searchTaskAbout = '1';
        // 其他搜索选项
        this.searchParams = {};

        this.selectedFlowId = '';

        /**
         * 选择行变更事件回调
         */
        this.onSelectRowChanged = function () {
            // 暂时啥也不做
        };

        this.onCheckRowChanged = function () {
            // 按钮
            var taskAcceptionBtn = this.$('#btnTaskAcception');// 任务接受
            var taskAssignmentBtn = this.$('#btnTaskAssignment');// 任务分配
            var viewBtn = this.$('#btnView');// 查看
            var dealBtn = this.$('#btnDeal');// 处理
            var dealBatchBtn = this.$('#btnDealBatch');// 批量处理
            // 默认全部禁用
            taskAssignmentBtn.attr('disabled', 'disabled');
            taskAcceptionBtn.attr('disabled', 'disabled');
            viewBtn.attr('disabled', 'disabled');
            dealBtn.attr('disabled', 'disabled');
            dealBatchBtn.attr('disabled', 'disabled');
            // 循环检查选中的条目
            var count = 0, lastFlowId = null, users = null, bookIds = [], taskIds = [], flowIds = [];
            var allSameFlow = true, allMe = true, allUnfinished = true, taskAssignment = true, flowAvailable = false, batchAvailable = false, taskAcception = false, taskAcceptable = true,
                viewAvailable = true;
            var userId = util.getUserInfo().userId;
            that.$('#workListTBody').find('tr[checked]').each(function () {
                var flowId = $(this).attr('data-flowId');
                // 没有数据时，没有符合指定条件的数据的提示也当作child了，需要区分一下
                if (flowId !== undefined) {
                    // 判断是否是任务分配
                    if (flowId !== FLOW_TASK_ASSIGNMENT) {
                        taskAssignment = false;
                    }
                    // 判断是否是任务接受
                    for (var i = 0; i < FLOW_TASK_ACCEPTION.length; i++) {
                        if (flowId === FLOW_TASK_ACCEPTION[i]) {
                            taskAcception = true;
                            break;
                        }
                    }
                    // 判断是否是查看的流程
                    if ($(this).attr("data-tprSeeType") !== "1") {
                        viewAvailable = false;
                    }
                    // 众包还是指定
                    if ($(this).attr("data-tprTaskType") !== '1') {
                        taskAcceptable = false;
                    }
                    // 判断是否同一流程
                    if (lastFlowId === null) {
                        lastFlowId = flowId;
                    }
                    if (lastFlowId !== flowId) {
                        allSameFlow = false;
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
                    // 是否是本模块处理的流程
                    for (var m = 0; m < AVAILABLE_FLOWS.length; m++) {
                        if (flowId === AVAILABLE_FLOWS[m]) {
                            flowAvailable = true;
                        }
                    }
                    // 是否是可以批量处理的任务
                    for (var k = 0; k < BATCH_AVAILABLE_FLOWS.length; k++) {
                        if (flowId === BATCH_AVAILABLE_FLOWS[k]) {
                            batchAvailable = true;
                        }
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
            this.selectedFlowId = flowIds.join(',');

            if (count === 1 && viewAvailable) {
                viewBtn.removeAttr('disabled');
            }
            if (!flowAvailable) {
                return;
            }
            // 任务分配、任务接受、查看按钮判断
            if (count === 1) {
                if (taskAssignment && allMe && allUnfinished) {
                    taskAssignmentBtn.removeAttr('disabled');
                }
                if (taskAcception && allMe && allUnfinished && taskAcceptable) {
                    taskAcceptionBtn.removeAttr('disabled');
                }
            }
            // 处理、批量处理按钮判断
            if (allMe && allSameFlow && allUnfinished && !taskAssignment && !taskAcception) {
                if (count === 1) {
                    dealBtn.removeAttr('disabled');
                } else if (count > 1 && batchAvailable) {
                    dealBatchBtn.removeAttr('disabled');
                }
            }
        };

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            // 任务分配
            that.$container.on('click', '#btnTaskAssignment', function () {
                getTaskInfo(true);
            });
            // 任务接受
            that.$container.on('click', '#btnTaskAcception', function () {
                getTaskInfo(false);
            });
            // 查看
            that.$container.on('click', '#btnView', function () {
                that.openPage('public/workflow/workflow-dialog', {
                    flowInfoAction: FLOW_LIST_ACTION,
                    bookId: that.currentBookId,
                    taskId: that.currentTaskId,
                    deployId: "tpr",
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
                    deployId: "tpr",
                    btnText: btnText
                });
            });
            // 批量处理
            that.$container.on('click', '#btnDealBatch', function () {
                var btnText = $(this).text();
                that.openPage('public/workflow/workflow-dialog', {
                    flowInfoAction: FLOW_LIST_ACTION,
                    bookId: that.currentBookId,
                    taskId: that.currentTaskId,
                    deployId: "tpr",
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
         * 获取任务分配和任务接受的详情
         */
        function getTaskInfo(isAssignment) {
            util.showLoading('正在查询信息……');
            util.sendRequest({
                type: 'POST',
                data: {bookId: that.currentBookId, taskId: that.currentTaskId, flowId: that.selectedFlowId},
                action: isAssignment ? 'tpr/searchBookTrpDetail.action' : 'tpr/searchTaskLeadDetail.action',
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        that.openPage(isAssignment ? 'braille/translation-proofreading/task-assignment-dialog' : 'braille/translation-proofreading/task-acception-dialog', resp.data);
                    } else {
                        util.showAlert(resp.message || '信息出错，请稍后重试！');
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('信息出错，请稍后重试！');
                }
            });
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