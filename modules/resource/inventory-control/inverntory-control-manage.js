define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var PageBase = require('../../../common/base-page');
    //列表界面模板
    var listTpl = require('./contract-template-manage-list.tpl');

    module.exports = PageBase.extend(new function () {
        var that;
        // 当前页数
        var currentPage = 1;
        // 弹出框参数
        var checkedIds;

        /**
         *  获取数据列表
         */
        function fillListData() {
            // 按钮状态
            var btnView = $("#btnView"), btnIn = $("#btnInbound"), btnOut = $("#btnOutbound");
            btnView.attr('disabled', 'disabled');
            btnIn.attr('disabled', 'disabled');
            btnOut.attr('disabled', 'disabled');
            // 请求数据
            var params = {
                page: currentPage,
                pageLimit: 10,
                searchBookCode: $("#searchBookCode").val(),
                searchBookName: $("#searchBookName").val()
            };
            util.showLoading();
            util.sendRequest({
                type: 'POST',
                data: params,
                action: 'template/searchTemplateList.action',// TODO
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        that.$('#dataTBody').html(util.template(listTpl, {list: resp.data.records}));
                        // 分页数据
                        that.$('#listPaging').html(that.buildPagination(resp.data.pageNow, resp.data.pageCount));
                    } else {
                        util.showAlert(resp.message || '查询列表出错，请稍后重试！');
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('查询列表出错，请稍后重试！');
                }
            });
        }

        /**
         * 选中事件
         */
        function checkFn() {
            // 按钮状态
            var btnView = $("#btnView"), btnIn = $("#btnInbound"), btnOut = $("#btnOutbound");
            btnView.attr('disabled', 'disabled');
            btnIn.attr('disabled', 'disabled');
            btnOut.attr('disabled', 'disabled');
            // 判断选项
            var ids = [];
            $('#dataTBody').find(".fa-check-square-o").each(function () {
                var $parent = $(this).parent().parent();
                ids.push($parent.attr("data-id"));
            });
            if (ids.length === 0) {
                return;
            }
            // 判断按钮显示
            checkedIds = ids.join(",");
            if (ids.length === 1) {
                btnView.removeAttr('disabled');
                btnIn.removeAttr('disabled');
                btnOut.removeAttr('disabled');
            }
        }

        /**
         * 导入文件
         */
        function importFile(filePath) {
            util.showLoading();
            util.sendRequest({
                type: 'POST',
                data: {filePath: filePath},
                action: 'user/importUserExcel.action',// TODO
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        util.showAlert('导入成功');
                        // 成功之后直接刷新列表
                        currentPage = 1;
                        fillListData();
                    } else {
                        console.log(resp);
                        util.showAlert(resp.message || '导入出错，请稍后重试！');
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    console.log(xhr);
                    util.hideLoading();
                    util.showAlert('导入出错，请稍后重试！');
                }
            });
        }

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            // 批量导入
            that.$container.on("click", "#btnBatchImport", function () {
                that.openPage('public/file/file-upload', {"type": "*.xls;*.xlsx"});
            });
            // 查看
            that.$container.on('click', '#btnView', function () {
                that.openPage('resource/inventory-control/view-dialog', {
                    id: checkedIds
                });
            });
            // 入库
            that.$container.on('click', '#btnInbound', function () {
                that.openPage('resource/inventory-control/inbound-dialog', {
                    id: checkedIds
                });
            });
            // 出库
            that.$container.on('click', '#btnOutbound', function () {
                that.openPage('resource/inventory-control/outbound-dialog', {
                    id: checkedIds
                });
            });
            // 选中事件
            that.makeSelectableTable("#dataTable", null, checkFn);
            // 列表上的搜索按钮
            that.$container.on('click', '#btnSearch', function () {
                currentPage = 1;
                fillListData();
            });
            // 分页
            that.$container.on('click', '#listPaging a', function () {
                var page = $(this).attr('data-page');
                if (page) {
                    // 修改页面后重新刷新页面数据
                    currentPage = page;
                    fillListData();
                }
            });
        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
            // 列表
            fillListData();
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
            if (data && data.refresh === true) {
                currentPage = 1;
                fillListData();
            }
            if (data && data.id) {
                importFile(data.id);
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