define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util.js');
    var listTpl = require('./book-manage-list.tpl');
    var rollTpl = require('./book-manage-roll.tpl');
    var flowListTpl = require('../../other/base/stylebook-base-flowlist.tpl');
    //var Base = require('../../other/base/book-base');
    var Base = require('../../../common/base-page');
    var Module = Base.extend(new function () {
        var that;
        var currentPage = '1';
        var searchParams = {};
        this.deployKey = 'CNStyleBook';
        //查看工作流详情
        var FLOW_LIST_ACTION = 'styleBook/searchFlowInfoList.action';

        var FLOW_RECEIVESTYLEBOOK = 'cn_receiveStyleBook';//  领取样书详情
        var FLOW_DEPERTMENTEXAMINE = 'cn_departmentExamine';//  部门审核详情
        var FLOW_LEADEREXAMINE = 'cn_leaderExamine'; // 领导审核详情
        var FLOW_RECEIVEREMARKS = 'cn_receiveRemarks';//  样书备注详情

        var TASK_FINISHED = '2';
        var bookId = null;
        var taskId = null;
        var flowId = null;

        /**
         * 搜索任务列表的接口(覆盖父级)
         */
        this.taskFlowListAction = 'common/searchTaskList.action';
        /**
         * 样书列表按钮判断
         */
        function onCheckRowChanged() {
            // 按钮
            var applyBookBtn = that.$('#btnApplyBook'); //申请样书
            // 默认全部禁用
            applyBookBtn.attr('disabled', 'disabled');
            var bookNum = that.$('#bookListTable').find('tr[checked]').attr('data-bookNum');
            //样书数量不为0或不为''显示
            if (bookNum !== undefined) {
                if (bookNum !== '0' && bookNum !== '') {
                    applyBookBtn.removeAttr('disabled');
                }
            }
        }

        /**
         * 领取样书列表按钮判断
         */
        function onCheckGetBookRowChanged  () {
            //处理按钮
            var dealBtn = that.$('#btnDeal');// 处理

            // 默认全部禁用
            dealBtn.attr('disabled', 'disabled');

            var userId = util.getUserInfo().userId;
            var users = null;

            that.$('#bookRollTable').find('tr[class="info"]').each(function () {
                // 任务是否由我处理
                users =$(this).attr('data-users') || '';
                users = users ? users.split(',') : [];
                if (users.indexOf(userId) >= 0 && $(this).attr('data-taskState') !== TASK_FINISHED) {
                    dealBtn.removeAttr('disabled');
                }

            });
        }
        /**
         * 查询样书列表
         */
        function searchSampleBooksList() {
            var params = $.extend({}, searchParams);
            params.page = currentPage;
            util.showLoading();
            util.sendRequest({
                type: 'POST',
                data: params,
                action: 'styleBook/searchStyleBookList.action',
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        that.$('#bookListTable').html(util.template(listTpl, {
                            list: resp.data.records,
                            action: true
                        }));
                        if (resp.data.records.length === 0) {
                            util.showAlert('没有符合条件的查询结果。');
                        }
                        // 分页数据
                        that.$('#bookListPaging').html(that.buildPagination(resp.data.pageNow, resp.data.pageCount));
                    } else {
                        util.showAlert(resp.message || '查询样书列表出错，请稍后重试！');
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('查询样书列表出错，请稍后重试！');
                }
            });
        }

        /**
         * 跳转页面
         */
        function jumpPage() {
            var $el = $(this);
            var page = $el.attr('data-page');
            if (page) {
                // 修改页面后重新刷新页面数据
                currentPage = page;
                searchSampleBooksList();
            }
        }

        /**
         *  查询领用记录列表
         */
        function searchBookRoll(id) {
            if (id) {
                var params = {
                    bookId: id
                };
                util.showLoading();
                util.sendRequest({
                    type: 'POST',
                    data: params,
                    action: 'styleBook/searchStyleBookGetList.action',
                    success: function (resp) {
                        util.hideLoading();
                        if (resp.code === 0) {
                            that.$('#bookRollTable').html(util.template(rollTpl, {
                                roll: resp.data
                            }));
                        } else {
                            util.showAlert(resp.message || '查询领用记录出错，请稍后重试！');
                        }
                    },
                    error: function (xhr) {
                        // XHR错误
                        util.hideLoading();
                        console.log(xhr);
                        util.showAlert('查询领用记录出错，请稍后重试！');
                    }
                });
            }
        }

        function selectFn() {
            bookId = that.$('#bookListTable').find('tr.info').attr('data-id');
            searchBookRoll(bookId);
        }

        function checkFn() {
            flowId = that.$('#bookListTable').find('tr[checked]').attr('data-flowId');
            bookId = that.$('#bookListTable').find('tr[checked]').attr('data-id');
            taskId = that.$('#bookListTable').find('tr[checked]').attr('data-taskId');
            onCheckRowChanged();
        }

        /**
         * todo 查询任务列表
         */
        function searchTaskFlowList() {
            var $row = that.$('#bookRollTable tr.info');
            if ($row.length > 0) {
                //var deploymentKey = $row.attr('data-deploy');
                var params = {};
                // 该关键字有两种searchBookId和searchidTopicId，所以需要子类覆盖
                params.stylebookGetId = $row.attr('data-id');
                // 选择了一条
                util.showLoading();
                util.sendRequest({
                    data: params,
                    action: 'styleBook/searchTaskFlowList.action',
                    success: function (resp) {
                        util.hideLoading();
                        if (resp.code === 0) {
                            // 任务列表
                            that.$('#taskWorkflowTable').html(util.template(flowListTpl, {list: resp.data}));
                        } else {
                            console.log(resp);
                            util.showAlert(resp.message || '查询流程列表出错，请稍后重试！');
                        }
                    }.bind(this),
                    error: function (xhr) {
                        // XHR错误
                        util.hideLoading();
                        console.log(xhr);
                        util.showAlert('查询流程列表出错，请稍后重试！');
                    }.bind(this)
                });
            } else {
                // 选择了多条或者没选择，清空流程列表
                this.$('#taskWorkflowTable').empty();
            }

        }

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            //样书列表选中事件
            that.makeSelectableTable("#bookList", selectFn, checkFn);
            // 查询
            that.$container.on('click', '#btnSearchBook', function () {
                searchParams = that.buildSearchParams(that.$('#formSearchBook input[data-search]'));
                currentPage = 1;
                searchSampleBooksList();
            });

            // 分页
            that.$container.on('click', '#bookListPaging a', jumpPage);

            //领用记录列表选中事件
            that.$container.on('click', '#bookRollTable td:not(".viewTd")', function () {
                that.$('#bookRollTable').find('tr').removeClass('info');
                $(this).parent().addClass('info');
                searchTaskFlowList();
                onCheckGetBookRowChanged();
            });

            // 领用申请
            that.$container.on('click', '#btnApplyBook', function () {
                var btnText = $(this).text();
                that.openPage('public/workflow/workflow-dialog', {
                    flowInfoAction: FLOW_LIST_ACTION,
                    bookId: bookId,
                    taskId: taskId,
                    deployId: that.deployKey,
                    btnText: btnText
                });
            });

            // 查看
            that.$container.on('click', '.btnView', function () {
                that.openPage('public/workflow/workflow-dialog', {
                    flowInfoAction: FLOW_LIST_ACTION,
                    bookId: $(this).attr('data-bookId'),
                    taskId: $(this).attr('data-taskId'),
                    stylebookGetId: $(this).attr('data-id'),
                    deployId: that.deployKey,
                    isView: true
                });
            });

            // 处理
            that.$container.on('click', '#btnDeal', function () {
                var btnText = $(this).text();
                that.openPage('public/workflow/workflow-dialog', {
                    flowInfoAction: FLOW_LIST_ACTION,
                    bookId: that.$('#bookRollTable').find('tr[class="info"]').attr('data-bookId'),
                    taskId: that.$('#bookRollTable').find('tr[class="info"]').attr('data-taskId'),
                    stylebookGetId: that.$('#bookRollTable').find('tr[class="info"]').attr('data-id'),
                    deployId: that.deployKey,
                    btnText: btnText
                });
            });

            //流程任务详情
            that.$container.on('click', 'button.task-detail-btn', function () {
                var data = {
                    taskId: $(this).attr('data-taskId'),
                    flowId: $(this).attr('data-flowId'),
                    deployKey: $(this).attr('data-deploy'),
                    bookId: $(this).attr('data-bookId')
                };
                that.openPage('other/base/task-flow-detail', data);
            });

            // 任务详情
            that.$container.on('click', 'button.task-detail-btn', function () {
                var data = {
                    taskId: $(this).attr('data-taskId'),
                    flowId: $(this).attr('data-flowId'),
                    deployKey: $(this).attr('data-deploy'),
                    bookId: $(this).attr('data-bookId'),
                    styleBookGetId:$(this).attr('data-styleBookGetId')
                };
                that.openPage('other/base/task-flow-detail', data);
            });
        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
            searchSampleBooksList();
        }

        /**
         * 初始化时被调用
         */
        this.onInit = function ($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);
            that = this;
            that.initTemplate(tpl, {});
            // 重新初始化数据
            currentPage = '1';
            searchParams = {};
            // 初始化页面事件
            initPageEvent();
            // 初始化页面数据
            initPageData();
            // onCheckRowChanged();

        };

        /**
         * 页面返回事件
         * @param data
         */
        this.onBack = function (data) {
            this._super(data);
            console.log(data);
            if (data && data.refresh) {
                searchBookRoll(bookId);
               // onCheckGetBookRowChanged();
                //处理按钮
                var dealBtn = that.$('#btnDeal');// 处理
                // 默认全部禁用
                dealBtn.attr('disabled', 'disabled');
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