define(function (require, exports, module) {
    "use strict";

    module.exports = {
        EVENT: {
            WIDGET_SIZE_CHANGE: 'widget_size_change',
            WIDGET_POSITION_CHANGE: 'widget_position_change',
            WIDGET_PROPERTY_CHANGE: 'widget_property_change',
            PANEL_SIZE_CHANGE: 'panel_size_change'
        },

        // 页面数据
        pagesData: [],

        // 应用顶层对象
        top: null,
        // 虚拟尺寸，暂时都定义为750
        visualWidth: 750,
        oneRem: 50,
        // 加载的所有property类型
        widgetProperty: {},

        /**
         * 设计稿尺寸转rem
         * @param size
         * @returns {*}
         */
        size2Rem: function (size) {
            if (typeof size === 'number') {
                return (size / 100) + 'rem';
            } else {
                size = size.toString();
                if (size.indexOf('auto') >= 0 || size.indexOf('100%') >= 0) {
                    return size;
                } else {
                    return (parseInt(size) / 100) + 'rem';
                }
            }
        },

        /**
         * 像素转rem
         * @param px
         * @returns {string}
         */
        px2Rem: function (px) {
            if (typeof px === 'string') {
                px = parseInt(px.replace('px', ''));
            }
            return (px / this.oneRem) + 'rem';
        },

        /**
         * 像素转设计稿
         * @param px
         * @returns {number}
         */
        px2Size: function (px) {
            if (typeof px === 'string') {
                px = parseInt(px.replace('px', ''));
            }
            return Math.round((px / this.oneRem) * 100);
        },

        /**
         * 派发自定义事件事件
         * @param eventName
         * @param data
         */
        dispatchEvent: function (eventName, data) {
            var event = document.createEvent('Events');
            event.initEvent(eventName.toLowerCase(), false, false);
            event.data = data;
            document.dispatchEvent(event);
        },


        /**
         * 当前页面所有监听事件列表
         */
        listeners: {},

        /**
         * 添加自定义事件监听
         * @param eventName
         * @param listener
         */
        addEventListener: function (eventName, listener) {
            eventName = eventName.toLowerCase();
            // 记录已经监听的事件
            this.listeners[eventName] = this.listeners[eventName] || [];
            this.listeners[eventName].push(listener);
            document.addEventListener(eventName.toLowerCase(), listener, false);
        },

        /**
         * 清除自定义事件监听（注意：global清除事件不指定listener将清除所有通过global绑定的事件）
         * @param eventName
         * @param listener
         */
        removeEventListener: function (eventName, listener) {
            eventName = eventName.toLowerCase();
            var evtListeners = this.listeners[eventName] || [];
            for (var len = evtListeners.length, i = len - 1; i >= 0; i--) {
                // 如果指定了listener则移除指定监听，否则移除所有监听
                if (!listener || evtListeners[i] === listener) {
                    document.removeEventListener(eventName, evtListeners[i]);
                    evtListeners.splice(i, 1);
                }
            }
        },

        /**
         * 对HTML进行转义
         * @param html 待转义的HTML字符串
         * @returns {*}
         */
        htmlEncode: function (html) {
            var temp = document.createElement("div");
            temp.textContent = html;
            var output = temp.innerHTML;
            temp = null;
            return output;
        },

        /**
         * 对HTML进行逆转义
         * @param html 待逆转义的HTML字符串
         * @returns {*}
         */
        htmlDecode: function (html) {
            var temp = document.createElement("div");
            temp.innerHTML = html;
            var output = temp.textContent;
            temp = null;
            return output;
        },

        /**
         * 移植自underscore的模板
         * @param text 模板文本
         * @param data 数据（可选参数）
         * @returns {*}
         */
        template: function (text, data) {
            var render;
            var settings = {
                evaluate: /<%([\s\S]+?)%>/g,
                interpolate: /<%=([\s\S]+?)%>/g,
                escape: /<%-([\s\S]+?)%>/g
            };
            var noMatch = /(.)^/;
            var matcher = new RegExp([
                (settings.escape || noMatch).source,
                (settings.interpolate || noMatch).source,
                (settings.evaluate || noMatch).source
            ].join('|') + '|$', 'g');
            var escapes = {
                "'": "'",
                '\\': '\\',
                '\r': 'r',
                '\n': 'n',
                '\t': 't',
                '\u2028': 'u2028',
                '\u2029': 'u2029'
            };

            var escaper = /\\|'|\r|\n|\t|\u2028|\u2029/g;
            var index = 0;
            var source = "__p+='";
            text.replace(matcher, function (match, escape, interpolate, evaluate, offset) {
                source += text.slice(index, offset)
                    .replace(escaper, function (match) {
                        return '\\' + escapes[match];
                    });

                if (escape) {
                    source += "'+\n((__t=(" + escape + "))==null?'':_.htmlEncode(__t))+\n'";
                }
                if (interpolate) {
                    source += "'+\n((__t=(" + interpolate + "))==null?'':__t)+\n'";
                }
                if (evaluate) {
                    source += "';\n" + evaluate + "\n__p+='";
                }
                index = offset + match.length;
                return match;
            });
            source += "';\n";

            if (!settings.variable) {
                source = 'with(obj||{}){\n' + source + '}\n';
            }

            source = "var __t,__p='',__j=Array.prototype.join," +
                "print=function(){__p+=__j.call(arguments,'');};\n" +
                source + "return __p;\n";
            try {
                render = new Function(settings.variable || 'obj', '_', source);
            } catch (e) {
                e.source = source;
                throw e;
            }

            if (data) {
                return render(data, this);
            }
            var template = function (data) {
                return render.call(this, data, this);
            };

            template.source = 'function(' + (settings.variable || 'obj') + '){\n' + source + '}';

            return template;
        },

        /**
         * 提示信息框
         * @param msg
         * @param onOk
         * @param onCancel
         */
        showAlert: function (message, onOk, onCancel) {
            if(onCancel){
                this.showConfirm(message, onOk, onCancel, '确认');
                return;
            }
            onOk = onOk || function () {
            };

            var $dialog = $('#dialogAlert');
            if ($dialog.length === 0) {
                $dialog = $('<div class="modal fade alert-dialog" id="dialogAlert" tabindex="-1" data-backdrop="static" role="alertdialog"> ' +
                    '  <div class="modal-dialog custom-dialog">' +
                    '    <div class="modal-content">' +
                    '      <div class="modal-header bg-primary">' +
                    '        <h4 class="modal-title"><strong id="dialogAlertTitle">提示</strong></h4>' +
                    '      </div>' +
                    '      <div class="modal-body">' +
                    '        <p id="dialogAlertMessage">提示信息内容……</p>' +
                    '      </div>' +
                    '      <div class="modal-footer">' +
                    '        <button type="button" class="btn btn-primary" id="dialogAlertOK">确定</button>' +
                    '      </div>' +
                    '    </div>' +
                    '  </div>' +
                    '</div>').appendTo('body');
            }

            // 超长的内容不显示
            if (message && message.length > 1000) {
                message = message.substr(0, 1000) + '……';
            }
            $dialog.find('#dialogAlertTitle').text('提示');
            $dialog.find('#dialogAlertMessage').html(message || '提示信息...');
            $dialog.find('#dialogAlertOK').off('click').on('click', function () {
                $dialog.modal('hide');
                onOk();
            });
            $dialog.modal('show');
            setTimeout(function () {
                $dialog.find('#dialogAlertOK').focus();
            }, 500);
        },

        /**
         * 确认信息框
         * @param message
         * @param okCallback
         * @param cancelCallback
         * @param title
         */
        showConfirm: function (message, okCallback, cancelCallback, title) {
            okCallback = okCallback || function () {
            };
            cancelCallback = cancelCallback || function () {
            };
            var $dialog = $('#dialogConfirm');
            if ($dialog.length === 0) {
                $dialog = $('<div class="modal fade alert-dialog" id="dialogConfirm" tabindex="-1" data-backdrop="static" role="alertdialog">' +
                    '  <div class="modal-dialog custom-dialog">' +
                    '    <div class="modal-content">' +
                    '      <div class="modal-header bg-primary">' +
                    '        <h4 class="modal-title"><strong id="dialogConfirmTitle">确认</strong></h4>' +
                    '      </div>' +
                    '      <div class="modal-body">' +
                    '        <p id="dialogConfirmMessage">提示信息内容……</p>' +
                    '      </div>' +
                    '      <div class="modal-footer">' +
                    '        <button type="button" class="btn btn-primary" id="dialogConfirmOK" tabindex="1">确定</button>' +
                    '        <button type="button" class="btn btn-default" id="dialogConfirmCancel" tabindex="2">取消</button>' +
                    '      </div>' +
                    '    </div>' +
                    '  </div>' +
                    '</div>').appendTo('body');
            }

            // 超长的内容不显示
            if (message && message.length > 1000) {
                message = message.substr(0, 1000) + '……';
            }
            $dialog.find('#dialogConfirmTitle').text(title || '确认');
            $dialog.find('#dialogConfirmMessage').html(message || '提示信息...');
            $dialog.find('#dialogConfirmOK').off('click').on('click', function () {
                $dialog.modal('hide');
                okCallback();
            });
            $dialog.find('#dialogConfirmCancel').off('click').on('click', function () {
                $dialog.modal('hide');
                cancelCallback();
            });
            $dialog.modal();
        },

        showProgress: function (percent, msg) {
            var $progress = $('#dialogProgress');
            percent = percent + '%';
            $progress.find('.progress-bar').css('width', percent);
            $progress.find('#progressMessage').text(msg || '加载中...');
            $progress.show();
        },

        hideProgress: function () {
            $('#dialogProgress').hide();
        }
    };

});