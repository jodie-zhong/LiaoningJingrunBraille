define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var PageBase = require('../../../common/base-dialog');

    var Module = PageBase.extend(new function () {
        var that;
        var info = null;

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
            var data1 = [];
            for(var i = 0; i < data.info.length; i++) {
            	data1.push(
            		util.getServerBase() + data.info[i] 
            	)
            	console.log(data1);
            }
            info = data1;
			console.log(info);
			that.initTemplate(tpl, {
				info: info
			});
            
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

            window.getPringContent = null;
        };


    }());

    module.exports = Module;
});