define(function (require, exports, module) {
    "use strict";

    var global = require('../js/global');
    var PropertyBase = require('./propertyBase');
    require('../libs/bootstrap-slider/slider.css');
    require('../libs/bootstrap-slider/bootstrap-slider');

    var tpl = '<label class="col-sm-4 control-label"><%- label %></label>' +
        '<div class="col-sm-<%- size %>">' +
        '    <input type="number" class="form-control" name="<%- name %>" max="<%- max %>" min="<%- min %>"/>' +
        '</div>';
    var tplRange = '<label class="col-sm-4 control-label"><%- label %></label>' +
        '<div class="col-sm-<%- size %> input-group">' +
        '    <input type="range" class="form-control" name="<%- name %>" max="<%- max %>" min="<%- min %>"/>' +
        '    <span class="input-group-addon"></span>' +
        '</div>';

    /**
     * 数值属性
     */
    var Property = PropertyBase.extend({
        $input: null,
        isRem: false,
        max: 65536,
        min: 0,

        /**
         * 属性初始化，注意必须调用父类方法
         * @param $container
         * @param option
         */
        onInit: function ($container, option) {
            this._super($container, option);
            this.option.size = this.option.size || '3';
            this.isRem = option.isRem || false;

            // 生成页面模板
            if (typeof this.option.max === 'undefined') {
                this.option.max = this.max;
            }
            if (typeof this.option.min === 'undefined') {
                this.option.min = this.min;
            }
            this.$container.html(global.template(this.option.isSlider ? tplRange : tpl, this.option));
            // 初始化变量
            this.$input = this.$container.find('input');
            // 无所谓，即使不存在也不会出错
            this.$span = this.$container.find('span');
            // // 如果使用slider则生成
            // if (this.option.isSlider) {
            //     // this.slider = this.$input.slider();
            //     this.$input.attr('type', 'range');
            // }
            // 默认值
            this.setValue(typeof this.option.default === 'undefined' ? '0' : option.default);
            // 绑定事件
            this.bindEvent();
        },

        /**
         * 绑定事件
         */
        bindEvent: function () {
            this.$input.on('change', this.onValueChange.bind(this));
        },

        /**
         * 值变化
         */
        onValueChange: function () {
            this.value = this.$input.val();
            // REM类型特殊处理
            if (this.isRem) {
                this.value = (this.value / 100) + 'rem';
            } else {
                this.$span.text(this.value);
            }
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
            if (this.isRem) {
                this.$input.val(Math.round(val.replace('rem', '') * 100));
            } else {
                this.$input.val(val);
                this.$span.text(val);
            }
        }
    });

    module.exports = Property;

});