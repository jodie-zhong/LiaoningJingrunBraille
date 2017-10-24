define(function (require, exports, module) {
    "use strict";

    var global = require('../js/global');
    var PropertyBase = require('./propertyBase');
    // require('../libs/wangEditor/css/wangEditor.min.css');
    require('../libs/ckeditor/ckeditor');

    var tpl = '<label class="col-sm-4 control-label"><%- label %></label>' +
        '<div class="col-sm-6">' +
        '  <button class="btn btn-default" data-btn="edit">编辑内容</button>' +
        '</div>';

    /**
     * 富文本属性
     */
    var Property = PropertyBase.extend({

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
            this.$btnShow = this.$container.find('button[data-btn="edit"]');

            // this.editor = null;
            // 绑定事件
            this.bindEvent();
        },

        /**
         * 绑定事件
         */
        bindEvent: function () {
            this.$btnShow.on('click', this.showEditor.bind(this));
        },

        /**
         * 显示编辑器
         */
        showEditor: function () {
            // 对话框需要添加到body中才能完整显示，但是添加到body后涉及到DOM回收的问题
            // 所以采用每次显示对话框时创建DOM、关闭对话框即回收DOM，而不是在属性销毁时回收
            //
            this.$dialog = $(
                '<div class="modal" id="richTextDialog_' + this.option.name + '">' +
                '  <div class="modal-dialog" style="width: 620px;">' +
                '    <div class="modal-content">' +
                '      <div class="modal-header">' +
                '        <h4 class="modal-title">编辑富文本</h4>' +
                '      </div>' +
                '      <div class="modal-body">' +
                '        <div id="richTextEditor_' + this.option.name + '" class="richText-editor-container"></div>' +
                '      </div>' +
                '      <div class="modal-footer">' +
                '        <button type="button" class="btn btn-default" data-btn="cancel">取消</button>' +
                '        <button type="button" class="btn btn-primary" data-btn="ok">确定</button>' +
                '      </div>' +
                '    </div>' +
                '  </div>' +
                '</div>'
            );
            // DOM对象赋值
            this.editorId = 'richTextEditor_' + this.option.name;
            this.$editor = this.$dialog.find('#richTextEditor_' + this.option.name);
            this.$btnOk = this.$dialog.find('button[data-btn="ok"]');
            this.$btnCancel = this.$dialog.find('button[data-btn="cancel"]');
            // 对话框中的按钮动态绑定
            this.$btnOk.on('click', this.onEditorOk.bind(this));
            this.$btnCancel.on('click', this.onEditorCancel.bind(this));
            // 添加到DOM Tree
            $('body').append(this.$dialog);
            // 默认值
            this.$editor.html(this.value);
            // 初始化CKEditor
            CKEDITOR.replace(this.editorId);
            CKEDITOR.instances[this.editorId].on('contentDom', function (evt) {
                // 处理字号问题
                evt.editor.document.$.documentElement.setAttribute('style', 'font-size: 50px');
            });

            this.$dialog.show();
        },

        /**
         * 确定后赋值并销毁
         */
        onEditorOk: function () {
            // 从CKEditor实例获取数据
            this.value = CKEDITOR.instances[this.editorId].getData();
            this.onEditorCancel();

            var data = {};
            data[this.name] = this.value;

            // 广播事件，widgetMask会捕获
            this.dispatchEvent(global.EVENT.WIDGET_PROPERTY_CHANGE, data);
        },

        /**
         * 取消时销毁Editor和Dialog
         */
        onEditorCancel: function () {
            // 销毁CKEditor实例
            CKEDITOR.instances[this.editorId].destroy();
            this.$dialog.remove();
        },

        /**
         * 设置值
         * @param val
         */
        setValue: function (val) {
            this.value = val;
        }
    });

    module.exports = Property;

});