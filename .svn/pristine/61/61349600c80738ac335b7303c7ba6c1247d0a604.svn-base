define(function (require, exports, module) {
    "use strict";

    var global = require('./global');

    /**
     * 控件蒙版组件，用于移动及拖动组件
     * @constructor
     */
    var WidgetMask = function () {

        // 为了绑定this
        var mouseDownFunc, mouseMoveFunc, mouseUpFunc;
        // 依附的组件容器
        this.attachContainer = null;
        // 依附的组件对象
        this.attachWidget = null;
        // 拖拽用
        this.originPosition = {
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            ratio: 1
        };
        // 当前拖拽8个边角中的一个
        this.currentBar = null;
        // 是否可拖拽
        this.draggable = false;

        /**
         * 初始化组件蒙版
         */
        this.init = function () {
            // 当前Mask
            this.$element = $('#widgetSelectMask');
            this.$element.hide();
            this.$editorPanel = $('#editorPanel');

            this.$rootContainer = $('#editorRoot');

            // 声明新的函数，绑定this
            mouseDownFunc = this.mouseDown.bind(this);
            mouseMoveFunc = this.mouseMove.bind(this);
            mouseUpFunc = this.mouseUp.bind(this);

            this.bindEvent();
        };

        /**
         * 依附在组件上
         * @param container
         * @param widget
         */
        this.attachOnWidget = function (container, widget) {
            // 如果点击的是同一个组件，则取消选中
            if(this.attachWidget && this.attachWidget.id === widget.id){
                this.hideMask();
                return;
            }

            // 设置附着到的组件
            this.attachContainer = container;
            this.attachWidget = widget;
            // 重新计算Mask大小和位置
            // this.recalculate();
            this.$element.appendTo(this.attachContainer);
            this.$element.show();
            // 初始化属性面板
            var option = global.widgetProperty[this.attachWidget.widgetName];
            global.propertyPanel.initProperties(option);
            // 设置属性面板的值
            var publicProp = this.attachWidget.getPublicProperty();
            global.propertyPanel.setProperty(publicProp);
            global.propertyPanel.setProperty(this.attachWidget.getProperty());
            // 启用拖拽
            this.enableMaskDraggable();
        };

        /**
         * 移除附加的组件
         */
        this.removeAttachWidget = function () {
            var widget = this.attachWidget;
            var container = this.attachContainer;
            var id = widget.id;
            // 先要隐藏Mask，因为隐藏Mask时会从Widget内移出，避免删除Widget时将Mask也删除
            this.hideMask();
            // 移除Widget对象
            global.editPanel.removeWidget(id);
            // 移除Widget DOM
            container.remove();
            // 派发一个事件，通知面板重新计算
            global.dispatchEvent(global.EVENT.PANEL_SIZE_CHANGE);
        };

        /**
         * 根据控件重新定位蒙版
         * 设置控件宽度、首次附加到控件上时使用
         */
        this.recalculate = function () {
            this.panelOffset = $('#editorPanel').offset();

            var containerPosition = this.attachContainer.position();
            this.$element.css('top', this.panelOffset.top + containerPosition.top - 50);
            this.$element.css('left', this.panelOffset.left + containerPosition.left);
            this.$element.outerWidth(this.attachContainer.width());
            this.$element.outerHeight(this.attachContainer.height());
        };

        /**
         * 通过draggable拖动后将坐标更新到组件
         */
        this.updatePosition = function (update) {
            if(this.attachContainer){
                var props = {
                    top: global.px2Size(this.attachContainer.position().top),
                    left: global.px2Size(this.attachContainer.position().left),
                    width: global.px2Size(this.attachContainer.outerWidth()),
                    height: global.px2Size(this.attachContainer.outerHeight())
                };

                if (update) {
                    this.attachWidget.setPublicProperty(props);
                    global.propertyPanel.setProperty(props);

                    // 派发一个事件，通知面板重新计算
                    global.dispatchEvent(global.EVENT.PANEL_SIZE_CHANGE);
                }
            }
        };

        /**
         * 通过编校拖动后将坐标更新到组件
         */
        this.updateSize = function (update) {
            var props = {
                top: global.px2Size(this.originPosition.top),
                left: global.px2Size(this.originPosition.top),
                width: global.px2Size(this.originPosition.right - this.originPosition.left),
                height: global.px2Size(this.originPosition.bottom - this.originPosition.top)
            };
            if (this.attachWidget && update) {
                this.attachWidget.setPublicProperty(props);
                global.propertyPanel.setProperty(props);

                // 派发一个事件，通知面板重新计算
                global.dispatchEvent(global.EVENT.PANEL_SIZE_CHANGE);
            }
        };

        /**
         * 一般是通过属性面板改变组件position后触发
         * @param event
         */
        this.onPositionChange = function (event) {
            if (event.data) {
                // 定位变化
                if (event.data.position) {
                    // 更新Widget容器定位
                    this.attachContainer.css('position', event.data.position);
                    // 记录新的position
                    this.attachWidget.setPublicProperty({position: event.data.position});
                    // 设置Mask是否可拖拽
                    this.enableMaskDraggable();
                }

                // 坐标变化
                if (event.data.top || event.data.left) {
                    var posOld = this.attachWidget.getPublicProperty();
                    if (posOld.position === 'relative') {
                        // 相对布局top、left无视
                        return;
                    }
                    // 属性控件传过来的都是
                    var newPos = {
                        top: event.data.top || posOld.top,
                        left: event.data.left || posOld.left
                    };
                    var newPosRem = {
                        top: global.size2Rem(newPos.top),
                        left: global.size2Rem(newPos.left)
                    };
                    // 更新Widget容器定位
                    this.attachContainer.css(newPosRem);
                    // 记录新的定位
                    this.attachWidget.setPublicProperty(newPos);
                }
            }
        };

        /**
         * 一般是通过属性面板改变组件size后触发
         * 过来的单位都是设计稿级别size
         * @param event
         */
        this.onSizeChange = function (event) {
            if (event.data) {
                if (event.data.width) {
                    this.attachContainer.width(global.size2Rem(event.data.width));
                }
                if (event.data.height) {
                    this.attachContainer.height(global.size2Rem(event.data.height));
                }
                this.attachWidget.setPublicProperty(event.data);
            }
        };

        /**
         * 绑定各种事件
         */
        this.bindEvent = function () {
            // 绑定定位变化事件
            global.addEventListener(global.EVENT.WIDGET_POSITION_CHANGE, this.onPositionChange.bind(this));
            // 绑定尺寸变化事件
            global.addEventListener(global.EVENT.WIDGET_SIZE_CHANGE, this.onSizeChange.bind(this));
            // 绑定数据变化事件
            global.addEventListener(global.EVENT.WIDGET_PROPERTY_CHANGE, this.onWidgetPropertyChange.bind(this));

            /* 绑定8个按钮鼠标按下事件，准备拖拽 */
            this.$element.find('.dot').bind('mousedown', mouseDownFunc);

            // X删除按钮
            this.$element.find('#widgetMaskClose').bind('click', this.removeAttachWidget.bind(this));
        };

        /**
         * 数据变更触发
         * @param event
         */
        this.onWidgetPropertyChange = function (event) {
            if (this.attachWidget && event.data) {
                // zIndex属于公共属性
                if (event.data.zIndex) {
                    this.attachContainer.css('z-index', event.data.zIndex);
                    this.attachWidget.setPublicProperty(event.data);
                }
                // 旋转角度属于公共属性
                if (event.data.rotate) {
                    this.attachContainer.css({
                        'transform': 'rotate(' + event.data.rotate + 'deg)',
                        'transform-origin': '50% 50%',
                        '-webkit-transform': 'rotate(' + event.data.rotate + 'deg)',
                        '-webkit-transform-origin': '50% 50%'
                    });
                    this.attachWidget.setPublicProperty(event.data);
                }
                // 透明度属于公共属性
                if (event.data.opacity) {
                    this.attachContainer.css('opacity', event.data.opacity / 100);
                    this.attachWidget.setPublicProperty(event.data);
                }
                this.attachWidget.setProperty(event.data);
                // setTimeout(this.recalculate.bind(this), 100);
            }
        };

        /**
         * 设置Mask可以拖拽
         */
        this.enableMaskDraggable = function () {
            // this.$element.draggable('enable');
            this.draggable = true;
            // 光标样式
            this.$element.removeClass('relative').removeClass('freeze');

            // 直接使用jQueryUI拖拽
            if (this.attachContainer) {
                this.draggableContainer = this.attachContainer.draggable({
                    // 容器，#editorPanel范围内拖动
                    // containment: '#editorPanel',
                    // .dot不能用作拖动手柄，.dot将相应自定义的resize
                    cancel: '.dot',
                    // 自动贴靠到辅助线
                    snap: '.subline',
                    // 10px内自动贴靠
                    snapTolerance: 10,
                    drag: function () {
                        // 拖拽过程中实时更新组件位置
                        this.updatePosition();
                    }.bind(this),
                    stop: function () {
                        // 拖拽结束后更新属性面板
                        this.updatePosition(true);
                    }.bind(this)
                });
            }
        };

        /**
         * 取消Mask可以拖拽
         */
        this.disableMaskDraggable = function () {
            // this.$element.draggable('disable');
            this.draggable = false;
            // 光标样式
            this.$element.addClass('relative');

            if (this.draggableContainer) {
                this.draggableContainer.draggable('destroy');
                this.draggableContainer = null;
            }
        };

        /**
         * 隐藏蒙版
         */
        this.hideMask = function () {
            // 隐藏蒙版，同时取消绑定
            this.$element.hide();
            // 移到外层去、避免被删除掉
            this.$element.appendTo(this.$rootContainer);
            this.attachContainer = null;
            this.attachWidget = null;
            // 隐藏后禁用拖拽
            this.disableMaskDraggable();
            // 清空属性面板
            global.propertyPanel.clearProperties();
        };

        /**
         * 蒙版拖拽点按下
         * @param e
         */
        this.mouseDown = function (e) {
            e.stopPropagation();
            var id = $(e.currentTarget).attr('id');
            // 禁止拖拽时左侧和上部禁止拖拽
            if (!this.draggable && (id.indexOf('Top') >= 0 || id.indexOf('Left') >= 0)) {
                return;
            }
            /* 记录当前蒙版信息 */
            this.originPosition.top = this.attachContainer.position().top;
            this.originPosition.left = this.attachContainer.position().left;
            this.originPosition.right = this.attachContainer.position().left + this.attachContainer.outerWidth();
            this.originPosition.bottom = this.attachContainer.position().top + this.attachContainer.outerHeight();
            // 宽高比
            this.originPosition.ratio = this.attachContainer.width() / this.attachContainer.height();
            /* 绑定鼠标移动和松开事件，移动时重绘、松开时取消事件绑定 */
            this.currentBar = $(e.currentTarget);
            this.$rootContainer.bind('mouseup', mouseUpFunc);
            this.$rootContainer.bind('mousemove', mouseMoveFunc);

        };

        /**
         * 蒙版拖拽点松开
         * @param e
         */
        this.mouseUp = function (e) {
            e.stopPropagation();
            /* 解绑事件监听 */
            this.currentBar = null;
            this.$rootContainer.unbind('mousemove', mouseMoveFunc);
            this.$rootContainer.unbind('mouseup', mouseUpFunc);

            // 更新属性面板
            // 没有在拖拽过程中更新避免更新过于频繁
            this.updateSize(true);
        };

        /**
         * 蒙版拖拽点移动
         * @param e
         */
        this.mouseMove = function (e) {
            e.stopPropagation();
            var bar = this.currentBar.attr('id');
            switch (bar) {
                case 'dotRight' :
                    this.resizeRight(e);
                    break;
                case 'dotLeft' :
                    this.resizeLeft(e);
                    break;
                case 'dotTop' :
                    this.resizeTop(e);
                    break;
                case 'dotBottom' :
                    this.resizeBottom(e);
                    break;
                case 'dotTopRight' :
                    this.resizeTop(e);
                    this.resizeRight(e);
                    break;
                case 'dotTopLeft' :
                    this.resizeTop(e);
                    this.resizeLeft(e);
                    break;
                case 'dotBottomRight' :
                    this.resizeBottom(e);
                    this.resizeRight(e);
                    break;
                case 'dotBottomLeft' :
                    this.resizeBottom(e);
                    this.resizeLeft(e);
                    break;
                default :
            }

            this.attachContainer.css('left', this.originPosition.left);
            this.attachContainer.css('top', this.originPosition.top);
            this.attachContainer.css('width', this.originPosition.right - this.originPosition.left);
            this.attachContainer.css('height', this.originPosition.bottom - this.originPosition.top);

            this.updateSize();
        };

        /**
         * 拖动顶部
         */
        this.resizeTop = function (e) {
            if (this.originPosition.bottom - (e.clientY - this.$editorPanel.offset().top) < 20) {
                return;
            }
            this.originPosition.top = e.clientY - this.$editorPanel.offset().top;
        };

        /**
         * 拖动底部
         */
        this.resizeBottom = function (e) {
            if (e.clientY - this.$editorPanel.offset().top - this.originPosition.top < 20) {
                return;
            }
            this.originPosition.bottom = e.clientY - this.$editorPanel.offset().top;
        };

        /**
         * 拖动左侧
         */
        this.resizeLeft = function (e) {
            if (this.originPosition.right - (e.clientX - this.$editorPanel.offset().left) < 20) {
                return;
            }
            var id = this.currentBar.attr('id');
            if (id.length > 10) {
                // 拖动的是角落
                var height = this.originPosition.bottom - this.originPosition.top;
                var width = height * this.originPosition.ratio;
                this.originPosition.left = this.originPosition.right - width;
            } else {
                // 拖动的是边框
                this.originPosition.left = e.clientX - this.$editorPanel.offset().left;
            }
        };

        /**
         * 拖动右侧
         */
        this.resizeRight = function (e) {
            if (e.clientX - this.$editorPanel.offset().left - this.originPosition.left < 20) {
                return;
            }
            var id = this.currentBar.attr('id');
            if (id.length > 10) {
                // 拖动的是角落
                var height = this.originPosition.bottom - this.originPosition.top;
                var width = height * this.originPosition.ratio;
                this.originPosition.right = this.originPosition.left + width;
            } else {
                // 拖动的是边框
                this.originPosition.right = e.clientX - this.$editorPanel.offset().left;
            }
        };

        /**
         * 向上移动
         */
        this.moveUp = function () {
            var $el = this.attachContainer;
            if ($el) {
                var $prev = $el.prev();
                if ($prev.length) {
                    $prev.before($el);
                }
            }
        };

        /**
         * 向下移动
         */
        this.moveDown = function () {
            var $el = this.attachContainer;
            if ($el) {
                var $next = $el.next();
                if ($next.length) {
                    $next.after($el);
                }
            }
        };
    };

    module.exports = new WidgetMask();

});