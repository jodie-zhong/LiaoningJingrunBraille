define(function (require, exports, module) {
    "use strict";

    var global = require('../js/global');
    var PropertyBase = require('./propertyBase');

    var tpl = '<label class="col-sm-4 control-label"><%- label %></label>' +
        '<div class="col-sm-4">' +
        '  <div class="input-group">' +
        '    <span class="input-group-addon">X</span>' +
        '    <input type="number" class="form-control" name="<%- name %>-x" value="0" max="65536" min="-65536" data-type="x"/>' +
        '  </div>' +
        '</div>' +
        '<div class="col-sm-4">' +
        '  <div class="input-group">' +
        '    <span class="input-group-addon">Y</span>' +
        '    <input type="number" class="form-control" name="<%- name %>-y" value="0" max="65536" min="-65536" data-type="y"/>' +
        '  </div>' +
        '</div>';

    /**
     * 位置属性
     */
    var Property = PropertyBase.extend({
        $inputX: null,
        $inputY: null,

        max: 65536,
        min: -65536,

        value: {},

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
            this.$inputX = this.$container.find('input[data-type="x"]');
            this.$inputY = this.$container.find('input[data-type="y"]');
            // 绑定事件
            this.bindEvent();
        },

        /**
         * 绑定页面变化事件
         */
        bindEvent: function () {
            this.$inputX.on('change', this.onValueChange.bind(this));
            this.$inputY.on('change', this.onValueChange.bind(this));
        },

        /**
         * 值变化
         */
        onValueChange: function () {
            this.value = {left: this.$inputX.val(), top: this.$inputY.val()};

            // 广播事件，widgetMask会捕获
            this.dispatchEvent(global.EVENT.WIDGET_POSITION_CHANGE, this.value);
        },

        /**
         * 设置值
         * @param val
         */
        setValue: function (val) {
            if (val) {
                if (typeof val.left !== 'undefined') {
                    this.$inputX.val(val.left);
                    this.value.left = val.left;
                }
                if (typeof val.top !== 'undefined') {
                    this.$inputY.val(val.top);
                    this.value.top = val.top;
                }
            }
        }
    });

    module.exports = Property;

});