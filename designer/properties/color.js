define(function (require, exports, module) {
    "use strict";

    var global = require('../js/global');
    var PropertyBase = require('./propertyBase');
    require('../libs/colorpicker/bootstrap-colorpicker.min');
    require('../libs/colorpicker/bootstrap-colorpicker.min.css');

    var tpl = '<label class="col-sm-4 control-label"><%- label %></label>' +
        '<div class="col-sm-5">' +
        '  <div class="input-group colorpicker-component">' +
        '    <input type="text" class="form-control">' +
        '    <span class="input-group-addon"><i></i></span>' +
        '  </div>' +
        '</div>' +
        '<div data-color="container" style="position: relative; top: 32px; left: 105px; width: 165px;"></div>';

    /**
     * 颜色类型属性
     */
    var Property = PropertyBase.extend({
        $inputColor: null,

        /**
         * 属性初始化，注意必须调用父类方法
         * @param $container
         * @param option
         */
        onInit: function ($container, option) {
            this._super($container, option);
            this.$container.html(global.template(tpl, this.option));
            this.$inputColor = this.$container.find('div.colorpicker-component');
            this.$inputColor.colorpicker({
                container: this.$container.find('div[data-color="container"]')
            });
            // 默认值
            this.setValue(option.default ? option.default : '#333333');
            // 绑定事件
            this.bindEvent();
        },

        /**
         * 绑定页面变化事件
         */
        bindEvent: function () {
            this.$inputColor.on('changeColor', this.onValueChange.bind(this));
        },

        /**
         * 数值变化
         */
        onValueChange: function () {
            this.value = this.$inputColor.colorpicker('getValue');

            var data = {};
            data[this.option.name] = this.value;
            this.dispatchEvent(global.EVENT.WIDGET_PROPERTY_CHANGE, data);
        },

        /**
         * 设置值
         * @param value
         */
        setValue: function (value) {
            this.value = value;
            this.$inputColor.colorpicker('setValue', value);
        }
    });

    module.exports = Property;

});