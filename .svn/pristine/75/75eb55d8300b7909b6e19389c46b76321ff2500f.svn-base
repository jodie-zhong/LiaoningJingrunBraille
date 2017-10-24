define(function (require, exports, module) {
    "use strict";

    var util = require("../../../common/util");
    var DialogBase = require("../../../common/base-dialog");

    module.exports = DialogBase.extend(new function () {
        var that;
        var inParams;

        /**
         * 保存数据
         */
        function saveData() {
            // 没有错误开始处理
            if (that.validate(that.$("#formDiv"))) {
                var params = {
                    id: inParams.id,
                    rukushuliang: that.$("input[name='rukushuliang']").val(),
                    beizhu: that.$("textarea[name='beizhu']").val()
                };
                util.showLoading("正在提交数据...");
                util.sendRequest({
                    action: "template/modifyTemplate.action",// TODO
                    data: params,
                    success: function (resp) {
                        util.hideLoading();
                        if (resp.code === 0) {
                            // 业务执行成功
                            util.showAlert("保存成功！", function () {
                                that.close({refresh: true});
                            });
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
        }

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            // 保存
            that.$container.on("click", "#btnSave", saveData);
        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
            // that.initValidate(that.$("#formDiv"));
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