define(function (require, exports, module) {
    "use strict";

    var util = require('../../common/util');
    var Base = require('../../common/base-dialog');
    require('../../assets/plugins/jquery-ui/jquery-ui-1.11.2.min');

    var Module = Base.extend(new function () {
        var that;
        // 画板和临时画板
        var canvas, ctx;
        var canvasBak, ctxBak;
        // 预览点图前的数据
        var originData = null;
        // 绘图历史记录
        var historyList = [];
        var historyIndex = 0;
        // 画板大小限制
        var MAX_CANVAS_WIDTH = 620;
        var MIN_CANVAS_WIDTH = 100;
        var MAX_CANVAS_HEIGHT = 620;
        var MIN_CANVAS_HEIGHT = 100;

        var size = 10;

        /**
         * 预览点图前控制界面
         * @param isPreview
         */
        function doPreview(isPreview) {
            if (isPreview) {
                // 禁用各种输入框和按钮
                that.$('input').attr('disabled', 'disabled');
                that.$('button').attr('disabled', 'disabled');

                // 返回和插入按钮
                that.$('#btnInsertSharp').removeAttr('disabled');
                that.$('#btnBackDraw').removeAttr('disabled');
                that.$('#btnInsertText').removeAttr('disabled');
                that.$('#btnBackDraw').show();
                that.$('#btnInsertSharp').show();
                that.$('#btnCreatePreview').hide();

                // 禁用绘图工具栏
                that.$('#canvasToolbar button').attr('disabled', 'disabled');
            } else {
                // 恢复各种输入框和按钮
                that.$('input').removeAttr('disabled');
                that.$('button').removeAttr('disabled');
                that.$('#btnInsertText').attr('disabled', 'disabled');

                // 返回和插入按钮
                that.$('#btnBackDraw').hide();
                that.$('#btnInsertSharp').hide();
                that.$('#btnCreatePreview').show();

                // 恢复绘图工具栏
                that.$('#canvasToolbar button').removeAttr('disabled');
            }
        }

        /**
         * 重新设置Canvas大小
         */
        function resizeCanvas() {
            var width = that.$('#inputSharpWidth').val();
            var height = that.$('#inputSharpHeight').val();
            canvas.width = width;
            canvas.height = height;
            canvasBak.width = width;
            canvasBak.height = height;
            $('#sharpCanvasContainer').css({width: width, height: height});
        }

        /**
         * 文件更改，准备导入图片
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
                ctx.clearRect(0, 0, canvas.width - 1, canvas.height - 1);

                setImage(reader.result, true);
                // 清空，以供下次从文件选择
                $el.val('');
            };
            reader.readAsDataURL(file);
        }

        /**
         * 通过图片文件校验后开始渲染图片
         * @param data
         */
        function setImage(data, resize) {
            // 加载图片
            var image = new Image();
            image.onload = function () {
                // 是否根据图像尺寸重置画布大小
                if (resize) {
                    var width = image.naturalWidth;
                    var height = image.naturalHeight;
                    width = width > MAX_CANVAS_WIDTH ? MAX_CANVAS_WIDTH : width;
                    width = width < MIN_CANVAS_WIDTH ? MIN_CANVAS_WIDTH : width;
                    height = height > MAX_CANVAS_HEIGHT ? MAX_CANVAS_HEIGHT : height;
                    height = height < MIN_CANVAS_HEIGHT ? MIN_CANVAS_HEIGHT : height;

                    that.$('#inputSharpWidth').val(width);
                    that.$('#inputSharpHeight').val(height);
                    resizeCanvas();
                }

                // 绘制图像
                ctx.drawImage(image, 0, 0);

                // 增加历史记录
                saveImageToHistory();
            };
            image.src = data;
        }

        /**
         * 返回继续绘制
         */
        function backToDraw() {
            // doPreview(false);

            // var canvas = that.$('#sharpCanvas')[0];
            // var ctx = canvas.getContext('2d');
            // // 绘制图像
            // ctx.putImageData(originData, 0, 0);
        }

        /**
         * 生成点图预览
         */
        function createPreview() {
            // doPreview(true);
            stopDrawGraph();

            // 界面的Canvas对象
            // var canvas = that.$('#sharpCanvas')[0];
            // 扫描步长
            var pointStep = that.$('#inputPointStep').val() || 10;
            // 盲文点半径
            var pointRadius = that.$('#inputPointRadius').val() || 2;
            // var ctx = canvas.getContext('2d');
            // 扫描图像
            originData = ctx.getImageData(0, 0, canvas.width - 1, canvas.height - 1);
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
            ctx.lineWidth = 1;
            // 绘制点图
            for (j = 0; j < points.length; j++) {
                ctx.beginPath();
                ctx.arc(points[j].x, points[j].y, pointRadius, 0, 2 * Math.PI);
                ctx.stroke();
                ctx.fill();
            }

            // 生成历史记录
            saveImageToHistory();
        }

        /**
         * 撤销上次绘图操作
         */
        function undoDraw() {
            historyIndex++;
            if (historyIndex > historyList.length - 1) {
                historyIndex = historyList.length - 1;
                return;
            }
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            var image = new Image();
            var index = historyList.length - 1 - historyIndex;
            var url = historyList[index];
            image.src = url;
            image.onload = function () {
                ctx.drawImage(image, 0, 0, image.width, image.height, 0, 0, canvas.width, canvas.height);
            }
        }

        /**
         * 重做撤销的绘图操作
         */
        function repeatDraw() {
            historyIndex--;
            if (historyIndex < 0) {
                historyIndex = 0;
                return;
            }
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            var image = new Image();
            var index = historyList.length - 1 - historyIndex;
            var url = historyList[index];
            image.src = url;
            image.onload = function () {
                ctx.drawImage(image, 0, 0, image.width, image.height, 0, 0, canvas.width, canvas.height);
            }
        }

        /**
         * 添加操作历史记录
         */
        var saveImageToHistory = function () {
            // 如果后退过，需要将后退步骤对应的栈数据清掉
            if (historyIndex > 0) {
                historyList.splice(historyList.length - historyIndex, historyIndex);
            }

            // 记录Canvas数据
            var dataUrl = canvas.toDataURL();
            historyList.push(dataUrl);
            historyIndex = 0;

            // 最多记录50步
            if (historyList.length > 50) {
                historyList.shift();
            }
        };

        /**
         * 从网上搬的一个绘图函数
         * @param graphType
         */
        function drawGraph(graphType) {
            size = parseInt(that.$('#inputPointStep').val());

            // 把蒙版放于画板上面
            // 先画在蒙版上 再复制到画布上
            $(canvasBak).css("z-index", 1);


            var canDraw = false;

            var startX;
            var startY;

            /**
             * 鼠标按下获取 开始xy开始画图
             * @param e
             */
            var mousedown = function (e) {
                ctxBak.lineWidth = size;
                e = e || window.event;
                startX = e.offsetX;
                startY = e.offsetY;
                ctxBak.moveTo(startX, startY);
                canDraw = true;

                if (graphType === 'pencil') {
                    ctxBak.beginPath();
                } else if (graphType === 'circle') {
                    // ctx.beginPath();
                    // ctx.moveTo(startX, startY);
                    // ctx.lineTo(startX + 2, startY + 2);
                    // ctx.stroke();

                } else if (graphType === 'rubber') {
                    ctx.clearRect(startX - size, startY - size, size * 2, size * 2);
                }
            };

            /**
             * 鼠标离开 把蒙版canvas的图片生成到canvas中
             * @param e
             */
            var mouseup = function (e) {
                e = e || window.event;
                canDraw = false;
                var image = new Image();
                if (graphType !== 'rubber') {

                    image.src = canvasBak.toDataURL();
                    image.onload = function () {
                        ctx.drawImage(image, 0, 0, image.width, image.height, 0, 0, canvas.width, canvas.height);
                        clearContext();
                        saveImageToHistory();
                    };
                    // var x = e.offsetX;
                    // var y = e.offsetY;
                    // ctx.beginPath();
                    // ctx.moveTo(x, y);
                    // ctx.lineTo(x + 2, y + 2);
                    // ctx.stroke();
                }
            };

            /**
             * 鼠标移动
             * @param e
             */
            var mousemove = function (e) {
                e = e || window.event;
                var x = e.offsetX;
                var y = e.offsetY;
                ctxBak.lineWidth = size;
                //方块  4条直线搞定
                if (graphType === 'square') {
                    if (canDraw) {
                        // 真正开始绘制
                        ctxBak.beginPath();
                        clearContext();
                        ctxBak.moveTo(startX, startY);
                        ctxBak.lineTo(x, startY);
                        ctxBak.lineTo(x, y);
                        ctxBak.lineTo(startX, y);
                        ctxBak.lineTo(startX, startY);
                        ctxBak.stroke();
                        ctxBak.moveTo(startX - size / 2, startY);
                        ctxBak.lineTo(startX + size / 2, startY);
                        ctxBak.stroke();
                    } else {
                        // 鼠标悬停效果
                        ctxBak.beginPath();
                        clearContext();
                        ctxBak.moveTo(x, y);
                        ctxBak.lineTo(x, y + 20);
                        ctxBak.lineTo(x + 20, y + 20);
                        ctxBak.lineTo(x + 20, y);
                        ctxBak.lineTo(x, y);
                        ctxBak.stroke();
                        ctxBak.moveTo(x - 5, y);
                        ctxBak.lineTo(x + 5, y);
                        ctxBak.stroke();
                    }
                    //直线
                } else if (graphType === 'line') {
                    if (canDraw) {
                        ctxBak.beginPath();
                        clearContext();
                        ctxBak.moveTo(startX, startY);
                        ctxBak.lineTo(x, y);
                        ctxBak.stroke();
                    }
                    //画笔
                } else if (graphType === 'pencil') {
                    if (canDraw) {
                        ctxBak.lineTo(x, y);
                        ctxBak.stroke();
                    }
                    //圆 未画得时候 出现一个小圆
                } else if (graphType === 'circle') {
                    clearContext();
                    if (canDraw) {
                        ctxBak.beginPath();
                        // 参照PPT等习惯，半径计算并非取平方根，而是横纵差中较大的一个
                        // var radii = Math.sqrt((startX - x) * (startX - x) + (startY - y) * (startY - y))/2;
                        var radii = Math.abs(startX - x) > Math.abs(startY - y) ? Math.abs(startX - x) / 2 : Math.abs(startY - y) / 2;
                        ctxBak.arc(startX + radii, startY + radii, radii, 0, Math.PI * 2, false);
                        ctxBak.stroke();
                    } else {
                        ctxBak.beginPath();
                        ctxBak.arc(x + 20, y + 20, 20, 0, Math.PI * 2, false);
                        ctxBak.stroke();
                    }
                } else if (graphType === 'rubber') {
                    ctxBak.lineWidth = 1;
                    clearContext();
                    ctxBak.beginPath();
                    ctxBak.strokeStyle = '#000000';
                    ctxBak.moveTo(x - size, y - size);
                    ctxBak.lineTo(x + size, y - size);
                    ctxBak.lineTo(x + size, y + size);
                    ctxBak.lineTo(x - size, y + size);
                    ctxBak.lineTo(x - size, y - size);
                    ctxBak.stroke();

                    if (canDraw) {
                        ctx.clearRect(x - size, y - size, size * 2, size * 2);
                    }
                }
            };

            /**
             * 鼠标离开区域以外，除了涂鸦都清空
             */
            var mouseout = function () {
                if (graphType !== 'handwriting') {
                    clearContext();
                }
            };

            $(canvasBak).unbind();
            $(canvasBak).bind('mousedown', mousedown);
            $(canvasBak).bind('mousemove', mousemove);
            $(canvasBak).bind('mouseup', mouseup);
            $(canvasBak).bind('mouseout', mouseout);
        }

        /**
         * 停止绘图
         */
        function stopDrawGraph() {
            $(canvasBak).unbind();
            that.$('#canvasToolbar input').removeClass('active');
        }


        /**
         * 清空层
         * @param type
         */
        function clearContext(type) {
            if (!type) {
                ctxBak.clearRect(0, 0, canvas.width, canvas.height);
            } else {
                ctx.clearRect(0, 0, canvas.width, canvas.height);
                ctxBak.clearRect(0, 0, canvas.width, canvas.height);
            }
        }

        /**
         * 将文本框内容嵌入图片
         */
        function doImplantText() {
            util.showConfirm('确定要将文本嵌入图片么？', function () {
                var text = that.$('#textInput').val();
                if (text) {
                    // 绘制文本前设置字号和大小
                    ctx.font = '20px EUDC';
                    ctx.textBaseline = 'top';
                    // 获取需要绘制文本的位置
                    var pos = that.$('#insertTextContainer').position();
                    // 绘制文本：内容，坐标
                    ctx.fillText(text, pos.left + 1, pos.top + 9);
                }
                // 隐藏文本输入框
                that.$('#insertTextContainer').hide();
                // 增加历史记录
                saveImageToHistory();
            });
        }

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            /* 按钮事件 */
            // 文件选择切换
            that.$container.on('change', '#sharpFile', fileChanged);

            // 创建预览点图
            that.$container.on('click', '#btnCreatePreview', createPreview);

            // 创建预览点图
            that.$container.on('click', '#btnBackDraw', backToDraw);

            // 清空画布
            that.$container.on('click', '#btnClearCanvas', function () {
                clearContext(true);
                // 增加历史记录
                saveImageToHistory();
            });

            // 插入文本
            that.$container.on('click', '#btnInsertText', function () {
                that.$('#textInput').val('');
                that.$('#insertTextContainer').css({left: 10, top: 10}).show();
                that.$('#insertTextContainer').find('input,button').removeAttr('disabled');
            });

            // 插入图形
            that.$container.on('click', '#btnInsertSharp', function () {
                // 界面的Canvas对象
                var data = canvas.toDataURL();
                that.close({image: data});
            });


            /* 输入框事件 */
            // 画布宽度
            that.$container.on('change', '#inputSharpWidth', function () {
                var width = that.$('#inputSharpWidth').val();
                width = parseInt(width, 10);
                if (!width || width > MAX_CANVAS_WIDTH || width < MIN_CANVAS_WIDTH) {
                    util.showAlert('请输入正确的画布宽度！');
                    return;
                }

                resizeCanvas();
            });

            // 画布高度
            that.$container.on('change', '#inputSharpHeight', function () {
                var height = that.$('#inputSharpHeight').val();
                height = parseInt(height, 10);
                if (!height || height > MAX_CANVAS_HEIGHT || height < MIN_CANVAS_HEIGHT) {
                    util.showAlert('请输入正确的画布高度！');
                    return;
                }

                resizeCanvas();
            });

            // 撤销、重做
            that.$container.on('click', '#btnUndo', undoDraw);
            that.$container.on('click', '#btnRepeat', repeatDraw);

            // 画布工具栏
            that.$container.on('change', 'input[name="options"]', function () {
                // 画笔模式或橡皮擦模式
                if (that.$('#radioStylePen').prop('checked')) {
                    drawGraph('pencil');
                } else if (that.$('#radioStyleEraser').prop('checked')) {
                    drawGraph('rubber');
                } else if (that.$('#radioStyleLine').prop('checked')) {
                    drawGraph('line');
                } else if (that.$('#radioStyleSquare').prop('checked')) {
                    drawGraph('square');
                } else if (that.$('#radioStyleCircle').prop('checked')) {
                    drawGraph('circle');
                }
            });

            // 拖拽文本框
            that.$('#insertTextContainer').draggable({
                handle: 'i.fa-arrows',
                containment: 'parent'
            });

            // 嵌入文本
            that.$container.on('click', '#btnImplantText', doImplantText);
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

            // 宽、高
            this.width = 623;
            this.height = 300;

            canvas = that.$('#sharpCanvas')[0];
            ctx = canvas.getContext('2d');
            canvasBak = that.$('#sharpCanvasBak')[0];
            ctxBak = canvasBak.getContext('2d');
            // ctxBak.lineCap = 'round';
            ctx.font = '20px EUDC';
            ctx.textBaseline = 'top';

            // 重置一些数据
            // 预览点图前的数据
            originData = null;
            // 绘图历史记录
            historyList = [];
            historyIndex = 0;
            saveImageToHistory();
            // 笔画粗细
            size = 10;

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