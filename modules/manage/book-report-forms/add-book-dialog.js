define(function (require, exports, module) {
    "use strict";

    var util = require("../../../common/util");
    var DialogBase = require("../../../common/base-dialog");
    var listTpl = require("./add-book-dialog-list.tpl");

    module.exports = DialogBase.extend(new function () {
        var that;
        var inParams;
        var pageNum;
        var selectedBookIds = [];

        /**
         * 确认添加
         */
        function confirmAdding() {
            if (selectedBookIds.length === 0) {
                util.showAlert("没有选中的数据");
                return;
            }
            util.showConfirm("确定要添加吗？", function () {
                var params = {statisticsReportId: inParams.reportId};
                params.reportNum = selectedBookIds.length;
                params.bookIds = selectedBookIds.join(",");
                util.showLoading();
                util.sendRequest({
                    type: "POST",
                    data: params,
                    action: "statistics/addBookForStatistics.action",
                    success: function (resp) {
                        // 请求成功（200）
                        util.hideLoading();
                        if (resp.code === 0) {
                            // 业务执行成功
                            util.showAlert("添加成功！", function () {
                                that.close({refreshBook: true, bookCount: params.reportNum, reportId: inParams.reportId});
                            });
                        } else {
                            // 业务执行失败
                            util.showAlert(resp.message || "操作失败，请稍后重试!");
                        }
                    },
                    error: function (xhr) {
                        // XHR错误
                        util.hideLoading();
                        console.log(xhr);
                        util.showAlert("操作失败，请稍后重试!");
                    }
                });
            });
        }

        /**
         *  获取书列表
         */
        function getBooksData() {
            // 清掉全选
            $("thead").find("i[data-action='check']").attr("class", "fa fa-square-o");
            // 请求参数
            var params = {
                page: pageNum,
                pageLimit: 10,
                statisticsReportId: inParams.reportId,
                searchPrintCompleteTimeStart: $("#searchTimeStart").val(),
                searchPrintCompleteTimeEnd: $("#searchTimeEnd").val()
            };
            // 发送请求
            util.showLoading();
            util.sendRequest({
                data: params,
                action: "statistics/searchAddBookList.action",
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        // 表数据
                        $("#dataTBody").html(util.template(listTpl, {list: resp.data.records}));
                        // 监测选中
                        checkSelectedData();
                        // 分页数据
                        $("#listPaging").html(that.buildPagination(resp.data.pageNow, resp.data.pageCount));
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
         * 设置选中的数据显示状态
         */
        function checkSelectedData() {
            var checkedCount = 0;
            var $trArray = $('#dataTBody').find("tr");
            $trArray.each(function () {
                var $elm = $(this);
                var bookId = $elm.attr("data-bookId");
                var idx = $.inArray(bookId, selectedBookIds);
                if (idx >= 0) {
                    $elm.attr("checked", "checked");
                    $elm.find("i[data-action='check']").attr("class", "fa fa-check-square-o");
                    checkedCount++;
                }
            });
            // 判断全选
            if (checkedCount === $trArray.length) {
                $("thead").find("i[data-action='check']").attr("class", "fa fa-check-square-o");
            }
        }

        /**
         * 整行选中
         */
        function checkRowSelect() {
            // 查询选中（这是单选）
            var $selectedRow = $("#dataTBody").find("tr[class~='info']");
            if ($selectedRow.length > 0) {
                var checked = $selectedRow.attr("checked");
                var bookId = $selectedRow.attr("data-bookId");
                var idx = $.inArray(bookId, selectedBookIds);
                if (checked) {
                    $selectedRow.removeAttr("checked");
                    $selectedRow.find("i[data-action='check']").attr("class", "fa fa-square-o");
                    if (idx >= 0) {
                        selectedBookIds.splice(idx, 1);
                    }
                } else {
                    $selectedRow.attr("checked", "checked");
                    $selectedRow.find("i[data-action='check']").attr("class", "fa fa-check-square-o");
                    if (idx < 0) {
                        selectedBookIds.push(bookId);
                    }
                }
            }
            console.log(selectedBookIds);
        }

        /**
         * 复选框选中
         */
        function checkSelect() {
            $('#dataTBody').find("tr").each(function () {
                var $elm = $(this);
                var bookId = $elm.attr("data-bookId");
                var idx = $.inArray(bookId, selectedBookIds);
                var checked = $elm.attr("checked");
                if (checked && idx < 0) {
                    selectedBookIds.push(bookId);
                } else if (!checked && idx >= 0) {
                    selectedBookIds.splice(idx, 1);
                }
            });
            console.log(selectedBookIds);
        }

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            // 报告选中事件
            that.makeSelectableTable("#dataTable", checkRowSelect, checkSelect);
            // 查询
            that.$container.on("click", "#btnSearch", function () {
                pageNum = 1;
                getBooksData();
            });
            // 确定
            that.$container.on("click", "#btnConfirm", confirmAdding);
            // 分页
            that.$container.on("click", "#listPaging a", function () {
                var page = $(this).attr("data-page");
                if (page) {
                    pageNum = page;
                    getBooksData();
                }
            });
        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
            $('input[data-time="searchDate"]').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: 'zh-cn',
                sideBySide: true
            });
            selectedBookIds = [];
            // 获取书列表
            pageNum = 1;
            getBooksData();
        }

        /**
         * 初始化时被调用
         */
        this.onInit = function ($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);
            that = this;
            inParams = data;
            that.initTemplate(tpl, {});
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