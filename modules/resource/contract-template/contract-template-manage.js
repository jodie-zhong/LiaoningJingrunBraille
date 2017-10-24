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
            var btnModify = $("#btnModify"), btnView = $("#btnView"), btnDelete = $("#btnDelete");
            btnModify.attr('disabled', 'disabled');
            btnView.attr('disabled', 'disabled');
            btnDelete.attr('disabled', 'disabled');
            // 将全选状态取消
            $('#dataTable').find('.fa-check-square-o').removeClass('fa-check-square-o').addClass('fa-square-o');
            // 请求数据
            var params = {
                page: currentPage,
                pageLimit: 10,
                searchTemplateName: $("#searchTemplateName").val(),
                searchContractTemplateType: $("#searchTemplateType").val()
            };
            // 全部不传类型
            if (params.searchContractTemplateType === '0') {
                params.searchContractTemplateType = undefined;
            }
            util.showLoading();
            util.sendRequest({
                type: 'POST',
                data: params,
                action: 'template/searchTemplateList.action',
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        that.$('#dataTBody').html(util.template(listTpl, {
                            list: resp.data.records
                        }));
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
            var btnModify = $("#btnModify"), btnView = $("#btnView"), btnDelete = $("#btnDelete");
            btnModify.attr('disabled', 'disabled');
            btnView.attr('disabled', 'disabled');
            btnDelete.attr('disabled', 'disabled');
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
                btnModify.removeAttr('disabled');
                btnView.removeAttr('disabled');
            }
            btnDelete.removeAttr('disabled');
        }

        /**
         * 删除选中行
         */
        function deleteCheckedRows() {
            util.showConfirm('确定要删除吗？', function () {
                // 请求数据
                util.showLoading();
                util.sendRequest({
                    type: 'POST',
                    data: {contractTemplateIds: checkedIds},
                    action: 'template/removeTemplate.action',
                    success: function (resp) {
                        util.hideLoading();
                        if (resp.code === 0) {
                            util.showAlert("删除成功！");
                            fillListData();
                        } else {
                            util.showAlert(resp.message || '操作出错，请稍后重试！');
                        }
                    },
                    error: function (xhr) {
                        // XHR错误
                        util.hideLoading();
                        console.log(xhr);
                        util.showAlert('操作出错，请稍后重试！');
                    }
                });
            });
        }

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            // 新增、修改、查看
            that.$container.on('click', '#btnAdd, #btnModify, #btnView', function () {
                var $btn = $(this);
                var btnId = $btn.attr("id");
                that.openPage('resource/contract-template/contract-template-dialog', {
                    id: checkedIds,
                    isEdit: btnId !== "btnView",
                    isAdd: btnId === "btnAdd",
                    title: $btn.text()
                });
            });
            // 删除
            that.$container.on('click', '#btnDelete', deleteCheckedRows);
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