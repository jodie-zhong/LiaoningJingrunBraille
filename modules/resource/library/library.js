define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var PageBase = require('../../../common/base-page');

    // 日志列表模板
    var listTpl = require('./library-list.tpl');

    var Module = PageBase.extend(new function () {
        var that;
        var currentPage = 1;
        var searchParams = {};
        var action='';
        // 选中图书id和状态
        var currentBookId = '';
        var currentBookState = '';
        /**
         *  查询图书列表
         */
        function searchBook() {
            that.$('#btnBookFlow').attr('disabled', 'disabled');
            that.$('#btnBookHistory').attr('disabled', 'disabled');
            that.$('#btnBookFinished').attr('disabled', 'disabled');
            that.$('#btnBookProcess').attr('disabled', 'disabled');
            currentBookId = '';
            currentBookState = '';
            var params = $.extend({}, searchParams);
            params.page = currentPage;
            util.showLoading();
            util.sendRequest({
                data: params,
                action: 'bookLibrary/searchBookLibraryList.action',
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        that.$('#bookListTable').html(util.template(listTpl, {list: resp.data.records}));
                        // 分页数据
                        that.$('#bookManagePaging').html(that.buildPagination(resp.data.pageNow, resp.data.pageCount));
                    } else {
                        util.showAlert(resp.message);
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('查询图书列表出错，请稍后重试！');
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
                searchBook();
            }
        }

        /**
         * 选中事件
         */
        function makeCheckTable(tableId, checkCallback) {
            that.$container.on('click', tableId + ' tbody td', function () {
                var $el = $(this);
                if ($el.attr('data-check')) {
                    // 单选
                    // 去掉所有选择状态
                    $el.parents('tbody').find('i[data-action="check"]').removeClass('fa-dot-circle-o').addClass('fa-circle-o');
                    $el.parents('tbody').find('tr').removeAttr('checked');
                    // 增加当前行选择状态
                    $el.find('i[data-action="check"]').removeClass('fa-circle-o').addClass('fa-dot-circle-o');
                    $el.parent().attr('checked', 'checked');
                }
                if (checkCallback) {
                    checkCallback();
                }
            });
        }

        /**
         * 成品与过程文件查看
         */
        function searchFinishBook() {
            var params = {
                bookId: currentBookId
            };
            util.showLoading();
            util.sendRequest({
                data: params,
                action: action,
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        var info = resp.data;
                        if(action==='bookLibrary/searchFinishedBookDetail.action'){
                            info.bookFile='成品文件';
                        }else{
                            info.bookFile='过程文件';
                        }
                        that.openPage('resource/library/library-finished', info);
                    } else {
                        util.showAlert(resp.message || '查询出错，请稍后重试！');
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('查询出错，请稍后重试！');
                }
            });
        }
        /**
         * 流程详情
         */
        function searchFlowBook() {
            var params = {
                bookId: currentBookId
            };
            util.showLoading();
            util.sendRequest({
                data: params,
                action:'bookLibrary/searchBookLibraryFlowList.action',
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        var info = resp.data;
                        that.openPage('resource/library/library-details', info);
                    } else {
                        util.showAlert(resp.message || '查询出错，请稍后重试！');
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('查询出错，请稍后重试！');
                }
            });
        }
        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            // 查询
            that.$container.on('click', '#btnSearchBook', function () {
                searchParams = that.buildSearchParams(that.$('#formSearchBook input[data-search],select[data-search]'));
                currentPage = 1;
                searchBook();
            });

            // 分页
            that.$container.on('click', '#bookManagePaging a', jumpPage);

            // 选中事件
            makeCheckTable("#bookTable", function () {
                that.$('#bookListTable').find('tr[checked]').each(function () {
                    var id = $(this).attr('data-bookId');
                    var state=$(this).attr('data-bookState');
                    if (id) {
                        currentBookId = id;
                        currentBookState= state;
                        if(currentBookState==='2'){
                            that.$('#btnBookHistory').removeAttr('disabled');
                            that.$('#btnBookFinished').removeAttr('disabled');
                            that.$('#btnBookProcess').removeAttr('disabled');
                        }else{
                            that.$('#btnBookHistory').attr('disabled', 'disabled');
                            that.$('#btnBookFinished').attr('disabled', 'disabled');
                            that.$('#btnBookProcess').attr('disabled', 'disabled');
                        }
                        that.$('#btnBookFlow').removeAttr('disabled');
                    }
                });
            });

            // 查看流程详情
            that.$container.on('click', '#btnBookFlow', function () {
                searchFlowBook();
            });

            // 查看历史文件
            that.$container.on('click', '#btnBookHistory', function () {
                that.openPage('resource/library/library-workflow-dialog', {
                    flowInfoAction: 'common/searchBookFlowList.action',
                    bookId: currentBookId,
                    taskId: '',
                    deployId: '',
                    isView: true
                });
            });
            // 查看成品文件
            that.$container.on('click', '#btnBookFinished', function () {
                action='bookLibrary/searchFinishedBookDetail.action';
                searchFinishBook();
            });
            // 查看过程文件
            that.$container.on('click', '#btnBookProcess', function () {
                action='bookLibrary/searchProcessBookDetail.action';
                searchFinishBook();
            });
        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
            searchBook();
        }

        /**
         * 初始化时被调用
         */
        this.onInit = function ($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);
            that = this;
            that.initTemplate(tpl, {});
            // 重新初始化数据
            currentPage = 1;
            searchParams = {};
            action='';
            currentBookId = '';
            currentBookState = '';
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
            this._super();

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