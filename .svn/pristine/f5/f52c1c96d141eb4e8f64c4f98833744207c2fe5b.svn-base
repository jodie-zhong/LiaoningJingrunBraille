define(function (require, exports, module) {
    "use strict";

    var util = require("../../../common/util");
    var DialogBase = require("../../../common/base-dialog");
    var listTpl =
        "<% if(list && list.length > 0) { %>" +
        "<% for(var i = 0; i < list.length; i++) { %>" +
        "   <tr>" +
        "       <td><%- (i + 1) %></td>" +
        "       <td><%- list[i].shuliang %></td>" +
        "       <td title='<%- list[i].beizhu %>'><%- list[i].beizhu %></td>" +
        "   </tr>" +
        "<% } %>" +
        "<% } else { %>" +
        "   <tr data-noselect='true'>" +
        "       <td colspan='3'><p class='empty-tips'>没有符合指定条件的数据</p></td>" +
        "   </tr>" +
        "<% } %>";

    module.exports = DialogBase.extend(new function () {
        var that;
        var inParams;

        /**
         * 获取数据
         */
        function getData() {
            util.showLoading("正在查询数据...");
            util.sendRequest({
                action: "template/searchTemplateDetail.action",// TODO
                data: {id: inParams.id, type: that.$("input[name='handleState']:checked").val()},// TODO
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        var form = that.$("#contentDiv");
                        form.html(util.template(listTpl, {list: resp.data}));
                    } else {
                        console.log(resp);
                        util.showAlert(resp.message || "操作失败，请稍后重试！");
                    }
                },
                error: function (xhr) {
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert("操作失败，请稍后重试！");
                }
            });
        }

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
            getData();
        }

        /**
         * 初始化时被调用
         */
        this.onInit = function ($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);
            that = this;
            inParams = data;
            that.initTemplate(tpl, {title: data.title});
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