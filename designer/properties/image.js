define(function (require, exports, module) {
    "use strict";

    var global = require('../js/global');
    var PropertyBase = require('./propertyBase');

    var tpl = '<label class="col-sm-4 control-label"><%- label %></label>' +
        '<div class="col-sm-8">' +
        '    <input type="file" class="form-control" name="<%- name %>" />' +
        '</div>';

    /**
     * 图片属性（暂时文件类型只考虑到支持图片）
     */
    var Property = PropertyBase.extend({

        maxSize: 1024 * 1024,
        extension: 'jpg|png',

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
            this.$input = this.$container.find('input');
            this.maxSize = option.maxSize || this.maxSize;
            this.extension = option.extension || '';
            if (this.extension) {
                this.extensionReg = new RegExp('\.(' + this.extension + ')', 'i');
            }

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
            var files = this.$input[0].files;
            var file = files[0];
            // 检查文件类型
            if (this.extensionReg) {
                if (!this.extensionReg.test(file.name.toLowerCase())) {
                    this.$input.val('');
                    global.showAlert('请选择“' + this.extension + '”类型的文件！');
                    return false;
                }
            }
            // 检查文件大小
            if (file.size > this.maxSize) {
                this.$input.val('');
                global.showAlert('文件体积不能大于 ' + (this.maxSize / 1024) + 'KB！');
                return false;
            }

            // 读取文件内容
            var reader = new FileReader();
            reader.onloadend = function () {
                this.value = reader.result;
                var data = {};
                data[this.name] = this.value;

                // 广播事件，widgetMask会捕获
                this.dispatchEvent(global.EVENT.WIDGET_PROPERTY_CHANGE, data);
            }.bind(this);
            // 以DataURL格式读取
            reader.readAsDataURL(file);

        },

        /**
         * 设置值
         * @param val
         */
        setValue: function (val) {
            // file类型不支持设置值
        }
    });

    module.exports = Property;

});