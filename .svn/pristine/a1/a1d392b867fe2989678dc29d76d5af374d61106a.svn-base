define(function (require, exports, module) {
    "use strict";

    var WedigetBase = require('../widgetBase.js');

    /**
     * 占位组件
     */
    var Widget = WedigetBase.extend({

        widgetName: 'blank',

        /**
         * 初始化控件
         * @param $container
         * @param data
         * @param page
         */
        onInit: function ($container, data, page) {
            this._super($container, data, page);

            this.$element.css('position', 'relative');
            this.prop = {};

            // 如果是设计模式
            if (this.getRuntime() === 'design') {
                this.$dom = $('<div style="height: 100%; background-color: rgba(0, 0, 0, 0.2); background-size: 0.8rem 0.8rem; ' +
                    'background-image: linear-gradient(45deg, rgba(255, 255, 255, .5) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .5) 50%, rgba(255, 255, 255, .5) 75%, transparent 75%, transparent);"></div>');
                this.$element.height('1rem');
            } else {
                this.$dom = $('<div style="min-height: 0.5rem; min-width: 0.5rem; height: 100%;"></div>');
            }

            this.$element.append(this.$dom);
        },

        setProperty: function () {

        }

    });

    module.exports = Widget;

});