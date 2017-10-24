define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var Base = require('../../../common/base-dialog');

    var Module = Base.extend(new function () {
        var that;

        function submitPasswordInfo() {
            var $form = that.$('#formPersonEdit');
            if (that.validate($form)) {
                var params = that.buildFormParams($form.find('.password'));
                util.showLoading('正在提交……');
                util.sendRequest({
                    type: 'POST',
                    data: params,
                    action: 'user/modifyUserPwd.action',
                    success: function (data) {
                        util.hideLoading();
                        console.log(data);
                        if (data && data.code === 0) {
                            // 服务器返回成功
                            util.showAlert(data.message || '修改密码成功！');
                            window.open('index.html', '_self');
                        } else {
                            // 服务器返回失败
                            util.hideLoading();
                            util.showAlert(data.message || '修改密码出错，请稍后重试！');
                        }
                    },
                    error: function (xhr) {
                        // XHR错误
                        util.hideLoading();
                        console.log(xhr);
                        util.showAlert(data.message || '修改密码出错，请稍后重试！');
                    }
                });
            }
            /**
             * 设置错误信息
             * @param msg
             */
        }

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            that.$("#submitForm").on("click", function () {
                submitPasswordInfo();
            });
        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
            that.initValidate(that.$('#formPersonEdit'));
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