define(function (require, exports, module) {
    "use strict";

    var global = require('../js/global');
    var PropertyBase = require('./propertyBase');

    var tpl = '<label class="col-sm-4 control-label"><%- label %></label>' +
        '<div class="col-sm-4">' +
        '    <select class="form-control">' +
        '        <option value="auto">自动</option>' +
        '        <option value="100%">100%</option>' +
        '        <option value="rem">数值</option>' +
        '    </select>' +
        '</div>' +
        '<div class="col-sm-4">' +
        '  <input type="number" class="form-control" name="<%- name %>-y" value="750" max="65536" min="30" data-type="height"/>' +
        '</div>';

    /**
     * 尺寸属性
     */
    var Property = PropertyBase.extend({
        $input: null,
        $select: null,

        max: 65536,
        min: 30,

        /**
         * 属性初始化，注意必须调用父类方法
         * @param $container
         * @param option
         */
        onInit: function ($container, option) {
            this._super($container, option);
            this.$container.html(global.template(tpl, this.option));
            this.$input = this.$container.find('input');
            this.$select = this.$container.find('select');
            // 绑定事件
            this.bindEvent();
        },

        /**
         * 绑定页面变化事件
         */
        bindEvent: function () {
            this.$select.on('change', this.onTypeChange.bind(this));
            this.$input.on('change', this.onValueChange.bind(this));
        },

        /**
         * 类型变化（auto、100%、数值）
         */
        onTypeChange: function () {
            if (this.$select.val() === 'rem') {
                // 如果是rem则以输入框具体指为准
                this.$input.removeAttr('disabled');
                this.value = this.$input.val();
                // 触发值变更
                this.onValueChange();
            } else {
                // 否则是auto或者100%
                this.$input.attr('disabled', 'true');
                this.value = this.$select.val();
                // 触发值变更
                this.onValueChange();
            }
        },

        /**
         * 数值变化
         */
        onValueChange: function () {
            var type = this.$select.val();
            if(type === 'auto' || type === '100%'){
                this.value = type;
            } else {
                this.value = this.$input.val();
            }

            var data = {};
            data[this.option.name] = this.value;
            this.dispatchEvent(global.EVENT.WIDGET_SIZE_CHANGE, data);
        },

        /**
         * 设置值
         * @param value
         */
        setValue: function (value) {
            if (value === '100%' || value === 'auto') {
                this.$input.attr('disabled', 'true');
                this.value = value;
                this.$select.val(this.value);
            } else {
                if (!isNaN(value)) {
                    this.$input.removeAttr('disabled');
                    this.value = value;
                    this.$select.val('rem');
                    this.$input.val(this.value);
                }
            }
        }
    });

    module.exports = Property;

});