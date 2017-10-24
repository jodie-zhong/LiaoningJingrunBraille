define(function (require, exports, module) {
    "use strict";

    var WedigetBase = require('../widgetBase.js');

    /**
     * ImageWidget
     */
    var Widget = WedigetBase.extend({

        widgetName: 'linkButton',

        prop: {
            background: '#7AD80B',
            border: 'none',
            radius: '0.1rem',
            text: '去银联钱包查看',
            fontSize: '0.3rem',
            lineHeight: '0.78rem',
            color: '#FFFFFF',
            link: '#',
            margin: '0.3rem 0.3rem 0.3rem 0.3rem'
        },

        /**
         * 初始化控件
         * @param $container
         * @param data
         * @param page
         */
        onInit: function ($container, data, page) {
            this._super($container, data, page);

            var tpl = '<a style="' +
                'background-color: ' + this.prop.background + ';' +
                'border: ' + this.prop.border + ';' +
                'border-radius: ' + this.prop.radius + ';' +
                'font-size: ' + this.prop.fontSize + ';' +
                'line-height: ' + this.prop.lineHeight + ';' +
                'margin: ' + this.prop.margin + ';' +
                'color: ' + this.prop.color + ';" ' +
                'href="' + this.prop.link + '"' +
                '>' + this.prop.text + '</a>';

            this.$outerDom = $('<div style="overflow: hidden;">' + tpl + '</div>');
            this.$dom = this.$outerDom.find('a');
            this.$dom.css({
                display: 'block',
                padding: 0,
                outline: 'none',
                textAlign: 'center',
                cursor: 'pointer',
                textDecoration: 'none',
                backgroundClip: 'padding-box',
                boxSizing: 'content-box'
            });
            this.$element.append(this.$outerDom);
        },

        /**
         * 设置属性
         * @param prop
         */
        setProperty: function (prop) {
            if (prop.background) {
                this.prop.background = prop.background;
                this.$dom.css('background-color', this.prop.background);
            }
            if (prop.border) {
                this.prop.border = prop.border;
                this.$dom.css('border', prop.border);
            }
            if (prop.radius) {
                this.prop.radius = prop.radius;
                this.$dom.css('border-radius', prop.radius);
            }
            if (prop.fontSize) {
                this.prop.fontSize = prop.fontSize;
                this.$dom.css('font-size', this.prop.fontSize);
            }
            if (prop.lineHeight) {
                this.prop.lineHeight = prop.lineHeight;
                this.$dom.css('line-height', prop.lineHeight);
            }
            if (prop.margin) {
                this.prop.margin = prop.margin;
                this.$dom.css('margin', prop.margin);
            }
            if (prop.color) {
                this.prop.color = prop.color;
                this.$dom.css('color', prop.color);
            }
            if (prop.href) {
                this.prop.href = prop.href;
                this.$dom.attr('href', prop.href);
            }
            if (prop.text) {
                this.prop.text = prop.text;
                this.$dom.text(prop.text);
            }
        }

    });

    module.exports = Widget;

});