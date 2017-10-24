define(function (require, exports, module) {
    "use strict";

    var util = require('./util.js');
    var config = require('./global-config');
    var Base = require('./base');

    /**
     * Page页面基类
     * 具体模块页面，由Index进行加载管理
     */
    var PageBase = Base.extend({
        /**
         * 非对话框类页面
         */
        isDialog: false,

        /**
         * 子类中需要在onInit中通过this._super()调用该方法
         * @param $container
         * @param tpl
         * @param data
         * @param indexRef
         */
        onInit: function ($container, tpl, data, indexRef) {
            this._super($container, tpl, data, indexRef);
        }
    });


    module.exports = PageBase;

});