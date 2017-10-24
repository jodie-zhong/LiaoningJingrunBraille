/**
 * Created by 颜廷宇 on 2017/6/22.
 */

(function () {
    "use strict";

    CKEDITOR.plugins.add('insertgraph', {
        icons: 'insertGraph',
        init: function (editor) {
            editor.addCommand('insertGraph', {
                exec: function (editor) {
                    // 改功能不在插件内实现，直接调用外部方法
                    if(window.openSharpDesinger) {
                        window.openSharpDesinger();
                    }
                }
            });

            editor.ui.addButton('InsertGraph', {
                label: '制作盲文图形',
                command: 'insertGraph'
            });
        }
    });

})();
