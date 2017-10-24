define(function (require, exports, module) {
    "use strict";

    var global = require('../js/global');
    var PropertyBase = require('./propertyBase');

    var tpl = '<label class="col-sm-4 control-label"><%- label %></label>' +
        '<div class="col-sm-2">' +
        '  <input type="number" class="form-control" name="<%- name %>-top" value="0" max="65536" min="-65536" data-type="top"/>' +
        '</div>' +
        '<div class="col-sm-2">' +
        '  <input type="number" class="form-control" name="<%- name %>-right" value="0" max="65536" min="-65536" data-type="right"/>' +
        '</div>' +
        '<div class="col-sm-2">' +
        '  <input type="number" class="form-control" name="<%- name %>-bottom" value="0" max="65536" min="-65536" data-type="bottom"/>' +
        '</div>' +
        '<div class="col-sm-2">' +
        '  <input type="number" class="form-control" name="<%- name %>-left" value="0" max="65536" min="-65536" data-type="left"/>' +
        '</div>' +
        '</div>';

    /**
     * 边距属性
     */
    var Property = PropertyBase.extend({
        max: 65536,
        min: -65536,

        value: '',

        /**
         * 属性初始化，注意必须调用父类方法
         * @param $container
         * @param option
         */
        onInit: function ($container, option) {
            this._super($container, option);

            // 生成页面模板
            this.$container.html(global.template(tpl, this.option));
            // 初始化变量
            this.$inputTop = this.$container.find('input[data-type="top"]');
            this.$inputRight = this.$container.find('input[data-type="right"]');
            this.$inputBottom = this.$container.find('input[data-type="bottom"]');
            this.$inputLeft = this.$container.find('input[data-type="left"]');

            // 默认值
            this.setValue(option.default ? option.default : '0 0 0 0');

            // 绑定事件
            this.bindEvent();
        },

        /**
         * 绑定页面变化事件
         */
        bindEvent: function () {
            this.$inputTop.on('change', this.onValueChange.bind(this));
            this.$inputRight.on('change', this.onValueChange.bind(this));
            this.$inputBottom.on('change', this.onValueChange.bind(this));
            this.$inputLeft.on('change', this.onValueChange.bind(this));
        },

        /**
         * 值变化
         */
        onValueChange: function () {
            var top = (this.$inputTop.val() / 100) + 'rem';
            var right = (this.$inputRight.val() / 100) + 'rem';
            var bottom = (this.$inputBottom.val() / 100) + 'rem';
            var left = (this.$inputLeft.val() / 100) + 'rem';
            // 边距都是上、右、下、左
            this.value = top + ' ' + right + ' ' + bottom + ' ' + left;
            var data = {};
            data[this.option.name] = this.value;
            this.dispatchEvent(global.EVENT.WIDGET_PROPERTY_CHANGE, data);
        },

        /**
         * 设置值
         * @param val
         */
        setValue: function (val) {
            if (typeof val === 'string') {
                // 解析值：“0.1rem 0.2rem 0.3rem 0.4rem”
                this.value = val;
                var values = val.split(' ');
                var top, right, bottom, left;
                if (values.length === 4) {
                    top = Math.round(values[0].replace('rem', '') * 100);
                    right = Math.round(values[1].replace('rem', '') * 100);
                    bottom = Math.round(values[2].replace('rem', '') * 100);
                    left = Math.round(values[3].replace('rem', '') * 100);
                } else if (values.length === 2) {
                    top = bottom = Math.round(values[0].replace('rem', '') * 100);
                    right = left = Math.round(values[1].replace('rem', '') * 100);
                }
                // 设置值到控件
                this.$inputTop.val(top);
                this.$inputRight.val(right);
                this.$inputBottom.val(bottom);
                this.$inputLeft.val(left);
            }
        }
    });

    module.exports = Property;

});