define(function (require, exports, module) {
    "use strict";

    var global = require('../js/global');
    var PropertyBase = require('./propertyBase');

    var tpl = '<label class="col-sm-4 control-label"><%- label %></label>' +
        '<div class="col-sm-6">' +
        '  <select class="form-control" name="<%- name %>">' +
        '    <option value="relative">相对定位</option>' +
        '    <option value="absolute">绝对定位</option>' +
        '  </select>' +
        '</div>';

    /**
     * 定位方式属性
     */
    var Property = PropertyBase.extend({

        $select: null,

        /**
         * 属性初始化，注意必须调用父类方法
         * @param $container
         * @param option
         */
        onInit: function ($container, option) {
            this._super($container, option);
            this.$container.html(global.template(tpl, this.option));

            this.$select = this.$container.find('select');
            // 默认值
            this.setValue(option.default ? option.default : 'relative');
            // 绑定事件
            this.bindEvent();
        },

        /**
         * 绑定页面变化事件
         */
        bindEvent: function () {
            this.$select.on('change', this.onPositionChange.bind(this));
        },

        /**
         * 类型变化（auto、100%、数值）
         */
        onPositionChange: function () {
            this.value = this.$select.val();
            // 派发事件
            this.dispatchEvent(global.EVENT.WIDGET_POSITION_CHANGE, {position: this.value});
        },

        /**
         * 设置值
         * @param value
         */
        setValue: function (value) {
            if (value === 'relative' || value === 'absolute') {
                this.value = value;
                this.$select.val(this.value);
                // 通过setValue方式设置值不触发事件
            }
        }

    });

    module.exports = Property;

});