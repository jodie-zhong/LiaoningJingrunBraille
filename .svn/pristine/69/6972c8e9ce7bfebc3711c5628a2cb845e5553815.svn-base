define(function (require, exports, module) {
    "use strict";

    var util = require("../../../common/util");
    var PageBase = require("../../../common/base-page");
    // 报告列表模板
    var reportListTpl = require("./report-list.tpl");
    // 书列表模板
    var bookListTpl = require("./book-list.tpl");

    module.exports = PageBase.extend(new function () {
        var that;
        // 当前页数
        var reportPage = 1, bookPage = 1;
        // 书列表选中的参数
        var selectedBookId;
        // 报告列表选中的参数
        var selectedReportId, selectedReportNames, selectedRowReportId, selectedBookNames;

        /**
         *  获取报告列表
         */
        function getReportsData() {
            // 先清除选中的报告右侧的书列表
            clearBooks();
            var $modifyBtn = $("#btnModifyReport"), $deleteBtn = $("#btnDeleteReport");
            $modifyBtn.attr("disabled", "disabled");
            $deleteBtn.attr("disabled", "disabled");
            // 请求数据
            util.showLoading();
            util.sendRequest({
                data: {
                    page: reportPage,
                    pageLimit: 10
                },
                action: "statistics/searchStatisticsReportList.action",
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        $("#reportTBody").html(util.template(reportListTpl, {list: resp.data.records}));
                        // 分页数据
                        $("#reportPaging").html(that.buildPagination(resp.data.pageNow, resp.data.pageCount));
                    } else {
                        util.showAlert(resp.message || "查询列表出错，请稍后重试！");
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert("查询列表出错，请稍后重试！");
                }
            });
        }

        /**
         *  获取书列表
         */
        function getBooksData() {
            $("#btnRemoveBook").attr("disabled", "disabled");
            that.$('#bookTable thead').find('i[data-action="check"]').removeClass('fa-check-square-o').addClass('fa-square-o');
            // 请求数据
            util.showLoading();
            util.sendRequest({
                data: {
                    page: bookPage,
                    pageLimit: 10,
                    statisticsReportId: selectedRowReportId
                },
                action: "statistics/searchStatisticsList.action",
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        $("#bookTBody").html(util.template(bookListTpl, {list: resp.data.records}));
                        // 分页数据
                        $("#bookPaging").html(that.buildPagination(resp.data.pageNow, resp.data.pageCount));
                    } else {
                        util.showAlert(resp.message || "查询列表出错，请稍后重试！");
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert("查询列表出错，请稍后重试！");
                }
            });
        }

        /**
         * 清除选中的报告右侧的书列表
         */
        function clearBooks() {
            bookPage = 1;
            $("#bookTBody").html(util.template(bookListTpl, {list: []}));
            $("#btnAddBook").attr("disabled", "disabled");
            $("#btnRemoveBook").attr("disabled", "disabled");
            $("#btnExportBook").attr("disabled", "disabled");
        }

        /**
         * 报告列表行选中
         */
        function checkReportRowSelect() {
            // 查询选中（这是单选，多选不能这样写）
            var $selectedRow = $("#reportTBody").find(".info");
            if ($selectedRow.length > 0) {
                selectedRowReportId = $selectedRow.attr("data-reportId");
                bookPage = 1;
                getBooksData();
                $("#btnAddBook").removeAttr("disabled");
                $("#btnExportBook").removeAttr("disabled");
            }
        }

        /**
         * 报告列表按钮选中
         */
        function checkReportRadioSelect() {
            // 按钮默认设置不可用
            var $modifyBtn = $("#btnModifyReport"), $deleteBtn = $("#btnDeleteReport");
            $modifyBtn.attr("disabled", "disabled");
            $deleteBtn.attr("disabled", "disabled");
            selectedReportId = '';
            selectedReportNames = '';
            // 查询选中
            var names = [], ids = [];
            var zero = true;
            that.$("#reportTBody").find("tr[checked]").each(function () {
                var $el = $(this);
                var $num=$el.find('.bookNum').text();
                if($num!=='0'){
                    zero=false;
                }
                ids.push($el.attr("data-reportId"));
                names.push($el.attr("data-reportName"));
            });

            if (ids.length > 0 && zero ) {
                $deleteBtn.removeAttr('disabled');
                selectedReportId = ids.join(',');
                selectedReportNames = names.join(',');
            }
            if (ids.length === 1) {
                $modifyBtn.removeAttr("disabled");
                selectedReportId = ids.join(',');
                selectedReportNames = names.join(',');
            }
        }

        /**
         * 书列表按钮选中
         */
        function checkBookRadioSelect() {
            // 按钮默认设置不可用
            var $removeBtn = $("#btnRemoveBook");
            $removeBtn.attr("disabled", "disabled");
            // 查询选中
            var names = [], ids = [];
            that.$("#bookTBody").find("tr[checked]").each(function () {
                var $el = $(this);
                ids.push($el.attr("data-bookId"));
                names.push($el.attr("data-bookName"));
            });
            if (ids.length > 0 && ids[0]) {
                $removeBtn.removeAttr('disabled');
                selectedBookId = ids.join(',');
                selectedBookNames = names.join(',');
            } else {
                $removeBtn.attr('disabled', 'disabled');
                selectedBookId = '';
                selectedBookNames = '';
            }
        }

        /**
         * 删除报告
         */
        function deleteReport() {
            util.showConfirm("确认要删除" + selectedReportNames + "报告", function () {
                util.showLoading();
                util.sendRequest({
                    data: {
                        statisticsReportIds: selectedReportId
                    },
                    action: "statistics/removeStatisticsReport.action",
                    success: function (resp) {
                        util.hideLoading();
                        if (resp.code === 0) {
                            util.showAlert("删除成功！", function () {
                                reportPage = 1;
                                getReportsData();
                            });
                        } else {
                            util.showAlert(resp.message || "操作出错，请稍后重试！");
                        }
                    },
                    error: function (xhr) {
                        // XHR错误
                        util.hideLoading();
                        console.log(xhr);
                        util.showAlert("操作出错，请稍后重试！");
                    }
                });
            });
        }

        /**
         * 移除书
         */
        function removeBook() {
            var len = selectedBookId.split(',').length;
            util.showConfirm("确认要移除" + selectedBookNames, function () {
                util.showLoading();
                util.sendRequest({
                    data: {
                        bookIds: selectedBookId,
                        statisticsReportId: selectedRowReportId,
                        reportNum: len
                    },
                    action: "statistics /removeBookForStatistics.action",
                    success: function (resp) {
                        util.hideLoading();
                        if (resp.code === 0) {
                            util.showAlert("移除成功！", function () {
                                bookPage = 1;
                                getBooksData();
                                // 更改左侧列表中报告的数量
                                var num = 0 - parseFloat(selectedBookId.split(',').length);
                                changeReportNum(selectedRowReportId, num);
                            });
                        } else {
                            util.showAlert(resp.message || "操作出错，请稍后重试！");
                        }
                    },
                    error: function (xhr) {
                        // XHR错误
                        util.hideLoading();
                        console.log(xhr);
                        util.showAlert("操作出错，请稍后重试！");
                    }
                });
            });
        }

        /**
         * 修改报告列表里的数量
         */
        function changeReportNum(reportId, diffNum) {
            $("#reportTBody").children().each(function () {
                var $tr = $(this);
                if ($tr.attr("data-reportId") === reportId) {
                    var $td = $tr.children().last();
                    $td.text(parseInt($td.text()) + diffNum);
                    $td.attr("title", $td.text());
                }
            });
        }

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            // 报告选中事件
            that.makeSelectableTable("#reportTable", checkReportRowSelect, checkReportRadioSelect);
            // 书选中事件
            that.makeSelectableTable("#bookTable", null, checkBookRadioSelect);
            // 报告分页
            that.$container.on("click", "#reportPaging a", function () {
                var page = $(this).attr("data-page");
                if (page) {
                    reportPage = page;
                    getReportsData();
                }
            });
            // 书分页
            that.$container.on("click", "#bookPaging a", function () {
                var page = $(this).attr("data-page");
                if (page) {
                    bookPage = page;
                    getBooksData();
                }
            });
            // 新增报告
            that.$container.on("click", "#btnAddReport", function () {
                that.openPage("manage/book-report-forms/add-modify-report-dialog", {isAdd: true});
            });
            // 修改报告
            that.$container.on("click", "#btnModifyReport", function () {
                that.openPage("manage/book-report-forms/add-modify-report-dialog", {
                    isAdd: false,
                    reportId: selectedReportId,
                    reportName: selectedReportNames
                });
            });
            // 删除报告
            that.$container.on("click", "#btnDeleteReport", deleteReport);
            // 添加书
            that.$container.on("click", "#btnAddBook", function () {
                that.openPage("manage/book-report-forms/add-book-dialog", {reportId: selectedRowReportId});
            });
            // 移除书
            that.$container.on("click", "#btnRemoveBook", removeBook);
            // 导出
            that.$container.on("click", "#btnExportBook", function () {
                window.open(util.getServerBase() + "statistics/doDownload.action?statisticsReportId=" + selectedRowReportId, "_blank");
            });
        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
            // 报告列表
            getReportsData();
        }

        /**
         * 初始化时被调用
         */
        this.onInit = function ($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);
            that = this;
            that.initTemplate(tpl, {});
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
            // 刷新报告列表
            if (data && data.refreshReport) {
                reportPage = 1;
                getReportsData();
            }
            // 刷新书列表
            else if (data && data.refreshBook) {
                bookPage = 1;
                getBooksData();
                // 更改左侧列表中报告的数量
                changeReportNum(data.reportId, data.bookCount);
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
});