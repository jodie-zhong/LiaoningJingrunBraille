define(function (require, exports, module) {
    "use strict";

    var util = require('../../common/util');
    var PageBase = require('../../common/base-page');

    var Module = PageBase.extend(new function () {
        var that;

        /**
         * 初始化页面事件
         */
        function initPageEvent() {

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
            that.initTemplate(tpl, {});

            // 初始化页面事件
            initPageEvent();

            // 初始化页面数据
            initPageData();
        };

        this.onBack = function (data) {

        };

        /**
         * 页面销毁
         */
        this.onDestroy = function () {
            this._super();
        };


    });

    module.exports = Module;
});