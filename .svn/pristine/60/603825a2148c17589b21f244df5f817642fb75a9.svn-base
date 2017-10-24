define(function (require, exports, module) {
    "use strict";

    var global = require('./global');
    // 为了方便，一次性将所有属性对象都加载
    var PropertyItems = {
        select: require('../properties/select'),
        number: require('../properties/number'),
        coordinate: require('../properties/coordinate'),
        size: require('../properties/size'),
        position: require('../properties/position'),
        border: require('../properties/border'),
        image: require('../properties/image'),
        richtext: require('../properties/richtext'),
        color: require('../properties/color'),
        margin: require('../properties/margin'),
        radius: require('../properties/radius'),
        string: require('../properties/string'),
        boolean: require('../properties/boolean')
    };

    var properties = [];


    // 公共属性定义
    var publicProperty =
        [
            // {
            //     "name": "position",
            //     "type": "position",
            //     "label": "定位",
            //     "size": "4"
            // },
            {
                "name": "coordinate",
                "type": "coordinate",
                "label": "坐标"
            },
            {
                "name": "width",
                "type": "size",
                "label": "宽",
                "default": "auto"
            },
            {
                "name": "height",
                "type": "size",
                "label": "高",
                "default": "auto"
            },
            // {
            //     "name": "rotate",
            //     "type": "number",
            //     "label": "旋转",
            //     "max": 360,
            //     "min": 0,
            //     "default": 0,
            //     "isSlider": true,
            //     "size": 8
            // },
            {
                "name": "zIndex",
                "type": "number",
                "label": "层叠",
                "max": 65536,
                "min": -65536,
                "default": 0
            },
            {
                "name": "opacity",
                "type": "number",
                "label": "透明",
                "max": 100,
                "min": 0,
                "default": 100
            }
        ];

    var pageProperty = [
        {
            "name": "background",
            "type": "color",
            "label": "页面颜色",
            "default": "#FFFFFF"
        }
    ];

    var PropertyPanel = function () {

        /**
         * 初始化
         */
        this.init = function () {
            this.$element = $('#propertyPanel');
        };

        /**
         * 初始化
         * @param list
         * @param page
         */
        this.initProperties = function (list, page) {
            //TODO: 保存当前数据

            // 清空面板和属性对象
            this.$element.empty();
            properties = [];
            var i, $el, prop;
            if (page) {
                for (i = 0; i < pageProperty.length; i++) {
                    if (PropertyItems[pageProperty[i].type]) {
                        $el = $('<div class="form-group" id="property_' + pageProperty[i].name + '"></div>');
                        this.$element.append($el);
                        prop = new PropertyItems[pageProperty[i].type];
                        prop.onInit($el, pageProperty[i]);
                        properties.push(prop);
                    }
                }
            } else {
                // 先渲染公共属性
                for (i = 0; i < publicProperty.length; i++) {
                    if (PropertyItems[publicProperty[i].type]) {
                        $el = $('<div class="form-group" id="property_' + publicProperty[i].name + '"></div>');
                        this.$element.append($el);
                        prop = new PropertyItems[publicProperty[i].type];
                        prop.onInit($el, publicProperty[i]);
                        properties.push(prop);
                    }
                }

                // 分割线
                this.$element.append('<div style="border-top: 1px solid #f4f4f4; height: 15px;"></div>')

                // 再渲染组件自定义属性
                for (i = 0; i < list.length; i++) {
                    if (PropertyItems[list[i].type]) {
                        $el = $('<div class="form-group" id="property_' + list[i].name + '"></div>');
                        this.$element.append($el);
                        prop = new PropertyItems[list[i].type];
                        prop.onInit($el, list[i]);
                        properties.push(prop);
                    }
                }
            }
        };

        /**
         * 清空面板
         */
        this.clearProperties = function () {
            // 清空面板和属性对象
            this.$element.empty();
            properties = [];
        };

        /**
         * 设置属性值
         * @param prop
         */
        this.setProperty = function (prop) {
            // 遍历传过来的所有属性
            for (var i in prop) {
                if (prop.hasOwnProperty(i)) {
                    // 遍历属性面板
                    for (var j = 0; j < properties.length; j++) {
                        if (properties[j].name === i) {
                            properties[j].setValue(prop[i]);
                            break;
                        } else if ((i === 'left' || i === 'top') && properties[j].name === 'coordinate') {
                            // 坐标特殊处理一下
                            var p = {};
                            p[i] = prop[i];
                            properties[j].setValue(p);

                        }
                    }
                }
            }
        };
    };

    module.exports = new PropertyPanel();

});