define(function (require, exports, module) {
    "use strict";

    var global = require('../js/global');
    var PropertyBase = require('./propertyBase');

    require('../libs/iCheck/icheck.min');
    require('../libs/iCheck/minimal/blue.css');

    var tpl = '<label class="col-sm-4 control-label"><%- label %></label>' +
        '<div class="col-sm-8">' +
        '  <input type="checkbox" class="form-control" name="<%- name %>" ' +
        '</div>';

    /**
     * 布尔类型属性
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

            this.$container.html(global.template(tpl, this.option));
            // 初始化变量
            this.$checkbox = this.$container.find('input[type="checkbox"]');

            this.$checkbox.iCheck({
                checkboxClass: 'icheckbox_minimal-blue'
            });
            if (this.value) {
                this.$checkbox.iCheck('check');
            }
            // 绑定事件
            this.bindEvent();
        },

        /**
         * 绑定事件
         */
        bindEvent: function () {
            this.$checkbox.on('ifToggled', this.onValueChange.bind(this));
        },

        /**
         * 值变化
         */
        onValueChange: function () {
            this.value = this.$checkbox.prop('checked');
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
            if (this.value) {
                this.$checkbox.iCheck('check');
            } else {
                this.$checkbox.iCheck('uncheck');
            }
        }
    });

    module.exports = Property;

});