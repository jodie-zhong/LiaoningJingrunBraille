define(function (require, exports, module) {
    "use strict";

    var WedigetBase = require('../widgetBase.js');
    require('./jquery.qrcode');

    /**
     * QRCodeWidget
     */
    var Widget = WedigetBase.extend({

        widgetName: 'qrCode',

        prop: {
            source: '0',
            text: '二维码',
            color: '#000000',
            background: '#ffffff'
        },

        /**
         * 初始化控件
         * @param $container
         * @param data
         * @param page
         */
        onInit: function ($container, data, page) {
            this._super($container, data, page);

            this.$dom = $('<div data-container="qrcode"></div>');
            this.$dom.css({
                'height': '100%',
                'display': 'block'
            });
            this.$element.append('<style>' +
                '  div[data-container="qrcode"] canvas { ' +
                '    display: block; ' +
                '    margin: 0 auto; ' +
                '    height: 100%; ' +
                '  }' +
                '</style>');
            this.$element.append(this.$dom);
            // 设计模式特殊处理一下
            if (this.getRuntime() === 'design') {
                this.$element.height(150);
            }
            // 生成二维码
            this.initQRCode();
        },

        /**
         * 生成二维码
         */
        initQRCode: function () {
            this.$dom.empty();
            // 确定数据内容
            var data = location.href;
            if (this.prop.source === '0') {
                data = this.prop.text;
            }
            this.$dom.qrcode({
                text: data,
                correctLevel: QRErrorCorrectLevel.H,
                foreground: this.prop.color,
                background: this.prop.background
            });
        },

        /**
         * 设置属性
         * @param prop
         */
        setProperty: function (prop) {
            // 这个组件会自动识别并交换前景、背景色-_-!
            $.extend(this.prop, prop);
            this.initQRCode();
        }

    });

    module.exports = Widget;

});