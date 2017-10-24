define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var DialogBase = require('../../../common/base-dialog');

    var Module = DialogBase.extend(new function () {
        var that;
        var info = null;

        /**
         * 保存数据
         */
        function saveCrowdSourceInfo() {
            var params = {
                tprTaskId: info.tprTaskIds,
                bookId: info.bookIds
            };
            // 下发请求
            util.showLoading();
            util.sendRequest({
                type: 'POST',
                data: params,
                action: "tpr/saveOrSubmitTaskGet.action",
                success: function (resp) {
                    util.hideLoading();
                    console.log(resp);
                    if (resp.code === 0) {
                        util.showAlert('操作成功!', function () {
                            that.close({refresh: true});
                        });
                    } else {
                        util.showAlert(resp.message || '操作失败，请稍后重试！');
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('操作失败，请稍后重试！');
                }
            });
        }

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            // 保存
            that.$container.on('click', '#btnCrowdSourceSave', saveCrowdSourceInfo);

        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
        }

        /**
         * 初始化时被调用
         */
        this.onInit = function ($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);
            that = this;
            info = data;
            console.dir(info);
            that.initTemplate(tpl, {info: data});
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