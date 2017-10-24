define(function (require, exports, module) {
    "use strict";

    var util = require('../../common/util');
    var Base = require('../../common/base-dialog');
    require('../../assets/plugins/CKEditor/ckeditor');

    var Module = Base.extend(new function () {
        var that;

        function pushHistory(){

        }

        function forwardHistory(){

        }

        function backwardHistory(){

        }

        /**
         * 文件更改
         */
        function fileChanged() {
            var $el = $(this);
            var file = $el[0].files[0];

            var suffix = file.name.toLowerCase();
            suffix = suffix.substr(suffix.lastIndexOf('.'));
            // 检查文件类型
            if ('*.jpg,*.png'.indexOf(suffix) < 0) {
                $el.val('');
                util.showAlert('请选择指定的文件类型：*.jpg,*.png');
                return;
            }
            // 检查文件大小
            if (file.size > 10 * 1024 * 1024) {
                $el.val('');
                util.showAlert('文件体积不能大于 10MB！');
                return;
            }

            // 读取文件内容
            var reader = new FileReader();
            reader.onloadend = function () {
                setImage(reader.result);
                // 清空，以供下次从文件选择
                $el.val('');
            };
            reader.readAsDataURL(file);
        }

        /**
         * 通过图片文件校验后开始渲染图片
         * @param data
         */
        function setImage(data) {
            // 加载图片
            var image = new Image();
            image.onload = function () {
                var canvas = that.$('#sharpCanvas')[0];
                canvas.width = image.naturalWidth;
                canvas.height = image.naturalHeight;
                // 设置并禁用宽高输入框
                that.$('#inputSharpWidth').val(image.naturalWidth).attr('disabled', 'disabled');
                that.$('#inputSharpHeight').val(image.naturalHeight).attr('disabled', 'disabled');
                var ctx = canvas.getContext('2d');
                // 绘制图像
                ctx.drawImage(image, 0, 0);

                // 增加历史记录
                pushHistory();
            };
            image.src = data;
        }

        /**
         * 生成点图预览
         */
        function createPreview() {
            // 界面的Canvas对象
            var canvas = that.$('#sharpCanvas')[0];
            // 扫描步长
            var pointStep = that.$('#inputPointStep').val() || 10;
            // 盲文点半径
            var pointRadius = that.$('#inputPointRadius').val() || 2;
            var ctx = canvas.getContext('2d');
            // 扫描图像
            var imageData = ctx.getImageData(0, 0, canvas.width - 1, canvas.height - 1);
            var data = imageData.data, pos = 0;
            var cols = Math.floor(canvas.width / pointStep);
            var rows = Math.floor(canvas.height / pointStep);
            var i, j;
            // 遍历像素点，收集有效像素
            var points = [];
            for (i = 1; i <= cols; i++) {
                for (j = 1; j <= rows; j++) {
                    pos = ((j * pointStep - 1) * (canvas.width - 1) + i * pointStep - 1) * 4;
                    // 容差处理
                    // 透明度>0.5 & 色值满足一定条件
                    if (data[pos + 3] > 0.5 && (data[pos] + data[pos + 1] + data[pos + 2] < 714)) {
                        points.push({x: i * pointStep, y: j * pointStep});
                    }
                }
            }
            // 清空画布
            ctx.clearRect(0, 0, canvas.width - 1, canvas.height - 1);
            // 绘制点图
            for (j = 0; j < points.length; j++) {
                ctx.beginPath();
                ctx.arc(points[j].x, points[j].y, pointRadius, 0, 2 * Math.PI);
                ctx.stroke();
                ctx.fill();
            }

            // 增加历史记录
            pushHistory();
        }

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            // 文件选择切换
            that.$container.on('change', '#sharpFile', fileChanged);
            // 创建预览点图
            that.$container.on('click', '#btnCreatePreview', createPreview);
            // 清空画布
            that.$container.on('click', '#btnClearCanvas', function(){
                // 界面的Canvas对象
                var canvas = that.$('#sharpCanvas')[0];
                var ctx = canvas.getContext('2d');
                // 清空画布
                ctx.clearRect(0, 0, canvas.width - 1, canvas.height - 1);
                // 增加历史记录
                pushHistory();
            });
            // 清空画布
            that.$container.on('click', '#btnInsertSharp', function(){
                // 界面的Canvas对象
                var canvas = that.$('#sharpCanvas')[0];
                var data = canvas.toDataURL();
                that.close({image: data});
            });
        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
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

        /**
         * 返回
         * @param data
         */
        this.onBack = function (data) {

        };

        /**
         * 页面销毁
         */
        this.onDestroy = function () {
            this._super();
        };


    }());

    module.exports = Module;
});