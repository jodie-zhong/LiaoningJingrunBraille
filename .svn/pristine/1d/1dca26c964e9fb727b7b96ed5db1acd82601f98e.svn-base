define(function (require, exports, module) {
    "use strict";

    var WedigetBase = require('../widgetBase.js');

    var shapes = {
        // 圆形
        circle: {
            node: 'circle',
            attribute: {
                'fill': '#00BBE2',
                'stroke': 'none',
                'cx': '35',
                'cy': '35',
                'r': '35'
            },
            viewBox: '0 0 70 70',
            ratio: 1
        },
        // 矩形
        rectangle: {
            node: 'rect',
            attribute: {
                'fill': '#00BBE2',
                'stroke': 'none',
                'x': '0',
                'y': '0',
                'width': '70',
                'height': '70'
            },
            viewBox: '0 0 70 70',
            ratio: 1
        },
        // 直角三角形
        triangleRight: {
            node: 'polygon',
            attribute: {
                'fill': '#00BBE2',
                'stroke': 'none',
                'points': '0 0 70 70 0 70'
            },
            viewBox: '0 0 70 70',
            ratio: 1
        },
        // 等腰三角形
        triangleIsosceles: {
            node: 'polygon',
            attribute: {
                'fill': '#00BBE2',
                'stroke': 'none',
                'points': '35 0 70 70 0 70'
            },
            viewBox: '0 0 70 70',
            ratio: 1
        },
        // 五边形
        pentagon: {
            node: 'polygon',
            attribute: {
                'fill': '#00BBE2',
                'stroke': 'none',
                'points': '35 0 70 26.7376208 56.6311896 70 13.3688104 70 0 26.7376208'
            },
            viewBox: '0 0 70 70',
            ratio: 1
        },
        // 六边形
        hexagon: {
            node: 'polygon',
            attribute: {
                'fill': '#00BBE2',
                'stroke': 'none',
                'points': '35 -2.84217094e-14 70 19.2182457 70 57.6547372 35 76.872983 2.42293298e-14 57.6547372 1.79476517e-15 19.2182457'
            },
            viewBox: '0 0 70 77',
            ratio: 1.1
        },
        // 五角星
        star: {
            node: 'polygon',
            attribute: {
                'fill': '#00BBE2',
                'stroke': 'none',
                'points': '35 55.2017668 13.3688104 66.5739561 17.5 42.4872725 0 25.4289885 24.1844052 21.9147887 35 0 45.8155948 21.9147887 70 25.4289885 52.5 42.4872725 56.6311896 66.5739561'
            },
            viewBox: '0 0 70 67',
            ratio: 67 / 70
        },
        // 半圆
        halfCircle: {
            node: 'path',
            attribute: {
                'fill': '#00BBE2',
                'stroke': 'none',
                'd': 'M70,35 C70,15.6700338 54.3299662,0 35,0 C15.6700338,0 0,15.6700338 0,35 L70,35 Z'
            },
            viewBox: '0 0 70 35',
            ratio: 0.5
        },
        // 心形
        heart: {
            node: 'path',
            attribute: {
                'fill': '#00BBE2',
                'stroke': 'none',
                'd': 'M50.3092488,65.0845338 C44.2862424,65.0845338 38.6860741,62.0631099 35,57.0808279 C31.3160994,62.0643018 25.7170531,65.0845338 19.6907514,65.0845338 C8.83332666,65.0845338 0,55.4269848 0,43.5551974 C0,36.4728172 3.16374872,31.5044871 5.70694697,27.5125899 C13.0982352,15.9175297 31.6823583,1.48782077 32.4696322,0.879469567 C33.2279501,0.293273384 34.1144309,0 34.9989484,0 C35.8854991,0 36.7707878,0.293273384 37.5282646,0.879469567 C38.3163799,1.48782077 56.9016247,15.9175297 64.2908096,27.5125899 C66.8351996,31.5045572 70,36.4728874 70,43.5551974 C69.9999301,55.4269848 61.1666034,65.0845338 50.3092488,65.0845338 L50.3092488,65.0845338 L50.3092488,65.0845338 Z',
                'transform': 'translate(35.000000, 32.542267) scale(1, -1) translate(-35.000000, -32.542267) '
            },
            viewBox: '0 0 70 66',
            ratio: 66 / 70
        }
    };

    /**
     * 占位组件
     */
    var Widget = WedigetBase.extend({

        widgetName: 'shape',

        prop: {
            "shape": "circle",
            "fill": true,
            "fillColor": "#00BBE2",
            "stroke": false,
            "strokeColor": "#00BBE2"
        },

        /**
         * 初始化控件
         * @param $container
         * @param data
         * @param page
         */
        onInit: function ($container, data, page) {
            this.prop = {
                "shape": "circle",
                "fill": true,
                "fillColor": "#00BBE2",
                "stroke": false,
                "strokeColor": "#00BBE2"
            };

            this._super($container, data, page);

            // 默认样式
            if (this.getRuntime() === 'design') {
                this.$element.css({width: '3rem', height: '3rem', position: 'absolute'});
                this.position = 'absolute';
            }

            // 动态创建SVG对象
            this.$dom = $(document.createElementNS('http://www.w3.org/2000/svg', 'svg'));
            // 设置SVG属性
            this.$dom.attr({
                'width': '70',
                'height': '70',
                'version': '1.1'
            });
            // 区分大小写的不能用jquery设置
            this.$dom[0].setAttribute('viewBox', '0 0 70 70');
            this.$dom[0].setAttribute('preserveAspectRatio', 'none meet');
            // 样式
            this.$dom.css({
                width: '100%',
                height: '100%',
                display: 'block'
            });
            this.$g = $(document.createElementNS('http://www.w3.org/2000/svg', 'g'));
            this.$g.attr({
                'stroke': 'none',
                'fill': 'none',
                'fill-role': 'evenodd'
            });
            this.$dom.append(this.$g);
            this.$element.append(this.$dom);
            // 生成图形
            this.switchShape();
        },

        /**
         * 创建SVG对象
         * SVG不能像普通DOM一样直接通过字符串创建
         * @param shape
         * @returns {*|jQuery|HTMLElement}
         */
        createShape: function (shape) {
            var $path = $(document.createElementNS('http://www.w3.org/2000/svg', shape.node));
            for (var i in shape.attribute) {
                if (shape.attribute.hasOwnProperty(i)) {
                    $path.attr(i, shape.attribute[i]);
                }
            }
            this.$dom[0].setAttribute('viewBox', shape.viewBox);
            // 重新校对容器比例
            this.$element.height(this.$element.width() * shape.ratio);
            return $path;
        },

        /**
         * 切换图形
         */
        switchShape: function () {
            // 生成对应的DOM
            this.$path = this.createShape(shapes[this.prop.shape]);
            // 直接处理颜色
            this.renderColor();
            // 添加到DOM树
            this.$g.empty().append(this.$path);
        },

        /**
         * 处理颜色
         */
        renderColor: function () {
            // 处理颜色
            if (this.prop.fill) {
                this.$path.attr('fill', this.prop.fillColor);
            } else {
                this.$path.attr('fill', 'none');
            }
        },

        /**
         * 设置属性
         * @param prop
         */
        setProperty: function (prop) {
            if (prop.shape) {
                // 如果shape换了则先切换shape
                this.prop.shape = prop.shape;
                this.switchShape();
            }
            if (typeof prop.fill !== 'undefined') {
                this.prop.fill = prop.fill;
            }
            if (prop.fillColor) {
                this.prop.fillColor = prop.fillColor;
            }
            // 重新渲染颜色
            this.renderColor();
        }

    });

    module.exports = Widget;
});