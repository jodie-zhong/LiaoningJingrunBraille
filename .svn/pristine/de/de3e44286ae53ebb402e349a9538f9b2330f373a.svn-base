define(function (require, exports, module) {
    "use strict";

    var util = require('./util.js');
    var config = require('./global-config');
    var Base = require('./base.js');

    /**
     * Dialog页面基类
     * 具体模块页面，由Index进行加载管理
     */
    var PageBase = Base.extend({

        /**
         * 对话框类页面
         */
        isDialog: true,

        /**
         * 子类中需要在onInit中通过this._super()调用该方法
         * @param $container
         * @param tpl
         * @param data
         * @param indexRef
         */
        onInit: function ($container, tpl, data, indexRef) {
            this._super($container, tpl, data, indexRef);

            // if (!data) {
            //     this.close();
            //     return;
            // }

            this.$container.on('click', '.btn-close', function () {
                this.close();
            }.bind(this));
        },

        /**
         * 关闭当前页面
         */
        close: function (data) {
            this.index.closeDialog(this.id, data);
        }
    });


    module.exports = PageBase;

});