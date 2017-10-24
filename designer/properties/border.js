define(function (require, exports, module) {
    "use strict";

    var global = require('../js/global');
    var PropertyBase = require('./propertyBase');
    require('../libs/colorpicker/bootstrap-colorpicker.min');
    require('../libs/colorpicker/bootstrap-colorpicker.min.css');

    var tpl = '<label class="col-sm-4 control-label"><%- label %></label>' +
        '<div class="col-sm-3">' +
        '    <select class="form-control" data-sub="borderStyle">' +
        '        <option value="none">无</option>' +
        '        <option value="solid">实线</option>' +
        '        <option value="dotted">点线</option>' +
        '        <option value="dashed">虚线</option>' +
        '        <option value="double">双线</option>' +
        '    </select>' +
        '</div>' +
        '<div class="col-sm-3">' +
        '    <input type="text" class="form-control" data-sub="borderColor" >' +
        '</div>' +
        '<div class="col-sm-2">' +
        '    <input type="number" class="form-control" data-sub="borderWidth" max="10" min="1"/>' +
        '</div>' +
        '<div data-color="container" style="position: relative; top: 32px; left: 145px; width: 165px;"></div>';

    /**
     * 边框类型属性
     */
    var Property = PropertyBase.extend({
        $inputWidth: null,
        $selectStyle: null,
        $inputColor: null,

        /**
         * 属性初始化，注意必须调用父类方法
         * @param $container
         * @param option
         */
        onInit: function ($container, option) {
            this._super($container, option);
            this.$container.html(global.template(tpl, this.option));
            this.$inputWidth = this.$container.find('input[data-sub="borderWidth"]');
            this.$selectStyle = this.$container.find('select[data-sub="borderStyle"]');
            this.$inputColor = this.$container.find('input[data-sub="borderColor"]');
            this.$inputColor.colorpicker({
                container: this.$container.find('div[data-color="container"]')
            });
            // 默认值
            this.$inputWidth.val(1);
            this.$selectStyle.val('none');
            this.$inputColor.colorpicker('setValue', '#333333');
            // 绑定事件
            this.bindEvent();
        },

        /**
         * 绑定页面变化事件
         */
        bindEvent: function () {
            this.$inputWidth.on('change', this.onValueChange.bind(this));
            this.$selectStyle.on('change', this.onValueChange.bind(this));
            this.$inputColor.on('changeColor', this.onValueChange.bind(this));
        },

        /**
         * 数值变化
         */
        onValueChange: function () {
            var style = this.$selectStyle.val();
            if (style === 'none') {
                this.value = 'none';
            } else {
                if (isNaN(this.$inputWidth.val())) {
                    this.$inputWidth.val(1);
                    return;
                }
                this.value = this.$inputWidth.val() + 'px ' + this.$selectStyle.val() + ' ' + this.$inputColor.colorpicker('getValue');
            }

            var data = {};
            data[this.option.name] = this.value;
            this.dispatchEvent(global.EVENT.WIDGET_PROPERTY_CHANGE, data);
        },

        /**
         * 设置值
         * @param value
         */
        setValue: function (value) {
            if (value.indexOf('none') >= 0) {
                this.value = 'none';
                this.$inputWidth.val(1);
                this.$selectStyle.val('none');
                this.$inputColor.colorpicker('setValue', '#333333');
            } else {
                var values = value.split(' ');
                this.value = value;
                this.$inputWidth.val(values[0].replace('px', ''));
                this.$selectStyle.val(values[1]);
                this.$inputColor.colorpicker('setValue', values[2]);
            }
        }
    });

    module.exports = Property;

});