define(function (require, exports, module) {
    "use strict";

    var global = require('../js/global');
    var PropertyBase = require('./propertyBase');

    var tpl = '<label class="col-sm-4 control-label"><%- label %></label>' +
        '<div class="col-sm-<%- size %>">' +
        '    <select class="form-control" name="<%- name %>">' +
        '    <% for (var i = 0; i < options.length; i++) { %>' +
        '        <option value="<%- options[i].value %>"><%- options[i].label %></option>' +
        '    <% } %>' +
        '    </select>' +
        '</div>';

    /**
     * 选择列表属性
     */
    var Property = PropertyBase.extend({

        /**
         * 属性初始化，注意必须调用父类方法
         * @param $container
         * @param option
         */
        onInit: function ($container, option) {
            this._super($container, option);
            this.option.size = this.option.size || '3';
            // 生成页面模板
            this.$container.html(global.template(tpl, this.option));
            // 初始化变量
            this.$select = this.$container.find('select');
            // 绑定事件
            this.bindEvent();
        },

        /**
         * 绑定事件
         */
        bindEvent: function () {
            this.$select.on('change', this.onValueChange.bind(this));
        },

        /**
         * 值变化
         */
        onValueChange: function () {
            this.value = this.$select.val();
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
            this.$select.val(val);
        }
    });

    module.exports = Property;

});