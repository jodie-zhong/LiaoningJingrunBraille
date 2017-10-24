define(function (require, exports, module) {
    "use strict";

    var WedigetBase = require('../widgetBase.js');

    /**
     * ImageWidget
     */
    var Widget = WedigetBase.extend({

        widgetName: 'richText',

        /**
         * 初始化控件
         * @param $container
         * @param data
         * @param page
         */
        onInit: function ($container, data, page) {
            this._super($container, data, page);

            // 如果是设计模式
            if(this.getRuntime() === 'design'){
                this.prop = {
                    html: '<p style="text-align:center"><span style="color:#d35400"><span style="font-size:0.48rem"><strong>盲人读物出版流程管理系统</strong></span></span></p>'
                };
                this.$container.css('position', 'relative');
            }

            this.$dom = $('<div style="overflow: hidden; width: 100%; height: 100%;"></div>').html(this.prop.html);
            this.$element.append(this.$dom);
        },

        /**
         * 设置属性值
         * @param prop
         */
        setProperty: function(prop){
            if (prop.html) {
                this.prop.html = prop.html;
                this.$dom.html(this.prop.html);
            }
            if (prop.border) {
                this.prop.border = prop.border;
                this.$dom.css('border', prop.border);
            }
            if(prop.radius){
                this.prop.radius = prop.radius;
                this.$dom.css('border-radius', prop.radius);
            }
            if(prop.background){
                this.prop.background = prop.background;
                this.$dom.css('background-color', prop.background);
            }
        }

    });

    module.exports = Widget;

});