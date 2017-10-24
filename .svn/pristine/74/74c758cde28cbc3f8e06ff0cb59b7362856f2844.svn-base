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
     * 弧度半径属性
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
            this.option.options= [
                {
                    "label": "无",
                    "value": "0"
                },
                {
                    "label": "小",
                    "value": "0.1rem"
                },
                {
                    "label": "中",
                    "value": "0.2rem"
                },
                {
                    "label": "大",
                    "value": "0.3rem"
                },
                {
                    "label": "圆弧",
                    "value": "50%"
                }
            ];
            // 生成页面模板
            this.$container.html(global.template(tpl, this.option));
            // 初始化变量
            this.$select = this.$container.find('select');
            // 默认值
            this.setValue(option.default ? option.default : '0');
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