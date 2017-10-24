define(function (require, exports, module) {
    "use strict";

    var global = require('../js/global');
    var PropertyBase = require('./propertyBase');

    var tpl = '<label class="col-sm-4 control-label"><%- label %></label>' +
        '<div class="col-sm-8">' +
        '    <input type="text" class="form-control" name="<%- name %>" max="<%- max %>"/>' +
        '</div>';

    /**
     * 单行文本属性
     */
    var Property = PropertyBase.extend({
        $input: null,
        max: 65536,

        /**
         * 属性初始化，注意必须调用父类方法
         * @param $container
         * @param option
         */
        onInit: function ($container, option) {
            this._super($container, option);
            this.option.max = this.option.max || 65536;

            this.$container.html(global.template(tpl, this.option));
            // 初始化变量
            this.$input = this.$container.find('input');
            // 绑定事件
            this.bindEvent();
        },

        /**
         * 绑定事件
         */
        bindEvent: function () {
            this.$input.on('input', this.onValueChange.bind(this));
        },

        /**
         * 值变化
         */
        onValueChange: function () {
            this.value = this.$input.val();
            var data = {};
            data[this.name] = this.value;

            // 广播事件，widgetMask会捕获
            this.dispatchEvent(global.EVENT.WIDGET_PROPERTY_CHANGE, data);
        },

        /**
         * 设置值
         * @param val
         */
        setValue: function (val) {
            this.value = val;
            this.$input.val(val);
        }
    });

    module.exports = Property;

});