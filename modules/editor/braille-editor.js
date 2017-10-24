define(function (require, exports, module) {
    "use strict";

    var util = require('../../common/util');
    var Base = require('../../common/base-dialog');
    require('../../assets/plugins/CKEditor/ckeditor');

    var Module = Base.extend(new function () {
        var that;

        var editor = null;

        function initEditor() {
            editor = CKEDITOR.replace('brailleEditor', {
                toolbar: [
                    {name: 'document', items: ['Print']},
                    {name: 'clipboard', items: ['Undo', 'Redo']},
                    {
                        name: 'paragraph',
                        items: ['Outdent', 'Indent', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyBlock', 'JustifyRight']
                    },
                    {name: 'custom', items: ['InsertGraph']}
                ],

                extraPlugins: 'insertgraph',
                // Make the editing area bigger than default.
                height: 400,
                // An array of stylesheets to style the WYSIWYG area.
                // Note: it is recommended to keep your own styles in a separate file in order to make future updates painless.
                contentsCss: ['assets/plugins/CKEditor/contents.css', 'css/page-editor.css'],
                // This is optional, but will let us define multiple different styles for multiple editors using the same CSS file.
                bodyClass: 'document-editor'

            });
        }

        /**
         * 打开图形设计器
         * 该函数将在模块初始化时被注入到全局window对象，由CKEditor内的插件调用
         */
        function openSharpDesigner(){
            that.openPage('editor/sharp-designer', {});
        }

        /**
         * 初始化页面事件
         */
        function initPageEvent() {

        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
            initEditor();

            window.openSharpDesinger = openSharpDesigner;
        }

        /**
         * 初始化时被调用
         */
        this.onInit = function ($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);
            that = this;
            that.initTemplate(tpl, {});

            // 初始化页面事件
            initPageEvent();

            // 初始化页面数据
            initPageData();
        };

        this.onBack = function (data) {
            if(data && data.image){
                if(editor){
                    var $image = $('<img>');
                    $image.attr('src',data.image);
                    editor.insertHtml($image[0].outerHTML, 'unfiltered_html');
                }
            }
        };

        /**
         * 页面销毁
         */
        this.onDestroy = function () {
            this._super();

            window.openSharpDesinger = null;
        };


    });

    module.exports = Module;
});