define(function (require, exports, module) {
    "use strict";

    var global = require('./global');

    var util = require('../../common/util');

    require('../libs/html2canvas.min');

    /**
     * 返回给Widget的模拟运行时状态page对象
     * 固定runtime为design
     * @type {{getRuntime: getRuntime}}
     */
    var runtime = {
        getRuntime: function () {
            // 编辑器返回runtime为design
            return 'design';
        }
    };

    /**
     * 编辑面板
     * @constructor
     */
    var EditPanel = function () {

        this.$element = $('#editorPanel');
        this.$container = $('#editorPanelContainer');
        this.$toolsContainer = $('#editorToolsContainer');
        this.loadedWidget = [];

        /**
         * 请求并渲染指定Widget
         * @param widget
         * @param data
         */
        this.randerWidget = function (widget, position) {
            seajs.use(['./widget/' + widget + '/main', 'text!./widget/' + widget + '/property.json'], function (WidgetClass, prop) {
                global.widgetProperty[widget] = JSON.parse(prop);
                // 创建组件，并为组件分配ID
                var w = new WidgetClass();
                w.id = w.widgetName + '_' + Date.now();
                // 调用组件初始化方法，默认初始化无参数
                position.left -= this.$element.offset().left;
                position.top -= this.$element.offset().top;
                w.onInit(this.$element, {position: position}, runtime);
                // 将组件保存
                this.loadedWidget.push(w);

                // 选中新组件
                global.widgetMask.attachOnWidget(w.$element, w);
            }.bind(this));
        };

        /**
         * 支持拖放
         */
        this.applyDrop = function () {
            // 使用jquery-ui的droppable组件
            // accept为widget图标
            this.$element.droppable({
                accept: ".widget-item",
                drop: function (event, ui) {
                    var $el = $(ui.draggable);
                    // widget name，详见widgetList.tpl
                    var widget = $el.attr('data-name');
                    console.log(ui);
                    console.log(event);
                    this.randerWidget(widget, ui.offset);
                }.bind(this)
            });
        };

        /**
         * 销毁某个组件
         * @param id
         */
        this.removeWidget = function (id) {
            for (var i = 0; i < this.loadedWidget.length; i++) {
                if (this.loadedWidget[i].id === id) {
                    this.loadedWidget.splice(i, 1);
                    break;
                }
            }
        };

        /**
         * 初始化点击事件
         */
        this.applyClick = function () {
            // 点击到某个widget-container时绑定到WidgetMask
            this.$element.on('click', '.widget-container', function (evt) {
                // evt.stopPropagation();
                var $el = $(evt.currentTarget);
                var id = $el.attr('id');
                var widget = null;
                for (var i = 0; i < this.loadedWidget.length; i++) {
                    if (this.loadedWidget[i].id === id) {
                        widget = this.loadedWidget[i];
                        break;
                    }
                }
                if ($el.length > 0 && widget) {
                    // 调用组件蒙版依附在当前组件上
                    global.widgetMask.attachOnWidget($el, widget);
                }
            }.bind(this));

            // 点击面板空白处
            // this.$element.on('click', function (evt) {
            //     // global.widgetMask.hideMask();
            // }.bind(this));

            // 设置
            this.$toolsContainer.on('click', '#btnEditorPageSetting', function () {
                global.widgetMask.hideMask();
                global.propertyPanel.initProperties([], true);

            }.bind(this));

            // 向上滚动
            this.$toolsContainer.on('click', '#btnEditorScrollUp', function () {
                // 向上移动组件
                global.widgetMask.moveUp();
            }.bind(this));

            // 向下滚动
            this.$toolsContainer.on('click', '#btnEditorScrollDown', function () {
                global.widgetMask.moveDown();
            }.bind(this));

            this.$toolsContainer.on('click', '#btnEditorSave', this.savePageData.bind(this));

            $('#btnFinish').on('click', this.finishEdit.bind(this));
        };

        /**
         * 保存当前页面数据
         */
        this.savePageData = function () {
            // 遍历已经加载的组件列表
            // TODO: 当前暂时禁用了sortable的排序所以可以直接从遍历loadedWidget确定顺序，否则应该以页面DOM内顺序为准
            var data = [], widget;
            for (var i = 0; i < this.loadedWidget.length; i++) {
                widget = this.loadedWidget[i];
                var widgetData = {};
                widgetData.id = widget.id;
                widgetData.name = widget.widgetName;
                // 属性进行拷贝，避免应用
                widgetData.prop = $.extend({}, widget.getProperty());
                $.extend(widgetData, widget.getPublicProperty());

                data.push(widgetData);
            }
        };

        /**
         * 完成封面设计
         */
        this.finishEdit = function () {
            global.widgetMask.hideMask();
            util.showLoading();
            // html2canvas有个限制，如果保存内容超过body范围会无法保存，所以临时加大body高度
            $('body').addClass('full-size');
            html2canvas($('#editorPanel')[0], {
                onrendered: function (canvas) {
                    // 将Canvas内容生成DataURL
                    var data = canvas.toDataURL().substr(22);
                    util.sendRequest({
                        action: 'readProofread/saveOnlineDesign.action',
                        data: {
                            onlineDesignImage: data
                        },
                        success: function (resp) {
                            $('body').removeClass('full-size');
                            util.hideLoading();
                            if (resp.code === 0) {
                                // 保存成功，如果没找到opener则报错
                                if (window.opener && window.opener.designerCallback) {
                                    // 找到了opener则回调后关闭当前窗口
                                    util.showAlert('封面保存成功！', function () {
                                        window.opener.designerCallback(resp);
                                        window.close();
                                    });
                                } else {
                                    util.showAlert('无法找到流程管理系统对应窗口，请关闭当前窗口后重新打开封面设计窗口！');
                                }
                            } else {
                                console.log(resp);
                                util.showAlert(resp.message || '保存设计图出错，请稍后重试！');
                            }
                        },
                        error: function (xhr) {
                            $('body').removeClass('full-size');
                            util.hideLoading();
                            console.log(xhr);
                            util.showAlert('保存设计图出错，请稍后重试！');
                        }
                    });
                }
            });
        };

        /**
         * 收到该事件后，重新计算一下面板高度
         */
        this.onPanelSizeChanged = function () {
            if (this.$element.height() > this.$container.height()) {
                // 内容大于容器，增大容器高度
                this.$container.height(this.$element.height());
            } else if (this.$element.height() <= 500) {
                // 内容小于500，缩小容器高度
                this.$container.height(500);
            }
        };

        /**
         * 初始化Editor面板
         */
        this.init = function () {
            // 允许组件拖拽进来
            this.applyDrop();
            // 监听各种点击类事件
            this.applyClick();
            // 兼容内容大小变化
            global.addEventListener(global.EVENT.PANEL_SIZE_CHANGE, this.onPanelSizeChanged.bind(this));
        };
    };

    module.exports = new EditPanel();

});