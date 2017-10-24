define(function (require, exports, module) {
    "use strict";

    var util = require('../../common/util');
    var Base = require('../../common/base-page');
    require('../../assets/plugins/jsdiff/diff.min');
    require('../../assets/plugins/CKEditor/ckeditor');

    var Module = Base.extend(new function () {
        var that;

        var editor = null;
        // 页面内容区域宽度
        var CONTENT_WIDTH = 623;
        // 默认行数、方数
        var DEFAULT_ROWS = 20;
        var DEFAULT_COLS = 30;
        // 行数、方数
        var rows = 20, cols = 30;
        // 1：明眼人校对核实正误表:2：盲人校对修改
        var PROOFREAD_READ = 1;
        var PROOFREAD_EDIT = 2;
        // 审校模式（1：明眼人只读；2：盲人编辑）
        var proofreadMode = 0;
        // 数据同步间隔
        var TIMER_INTERVAL = 2000;
        // 数据同步定时器、出错计数
        var timer = 0, errorCount = 0;

        // 自动保存定时器
        var autoTimer = 0;
        // 自动保存间隔
        var AUTO_SAVE_INTERVAL = 5 * 60 * 1000;

        // 最大容错数
        var MAX_ERROR = 3;

        // 任务相关ID，任务ID、图书ID、分册ID
        var taskId, bookId, bookFascicleId;
        var mTrpOnlineId;
        // 上次同步的内容数据
        var lastContent = '';
        // 从服务器取得的原始内容
        var originContent = '';
        // 转换后后的原始内容
        var originComparableContent = '';
        // 当前光标段落前缀
        var CURRENT_PREFIX = 'PROOFREAD-CURRENT|';
        // 计算行号时的偏移
        var OFFSET_TOP = 100;

        /**
         * 初始化CKEditor
         */
        function initEditor() {
            editor = CKEDITOR.replace('brailleEditor', {
                toolbar: [
                    {name: 'document', items: ['Print']},
                    {name: 'clipboard', items: ['Undo', 'Redo']},
                    {
                        name: 'paragraph',
                        items: ['JustifyLeft', 'JustifyCenter', 'JustifyBlock', 'JustifyRight']
                    },
                    {name: 'custom', items: ['InsertGraph']}
                ],

                extraPlugins: 'insertgraph',
                // Make the editing area bigger than default.
                height: $(window).height() - 308,
                // An array of stylesheets to style the WYSIWYG area.
                // Note: it is recommended to keep your own styles in a separate file in order to make future updates painless.
                contentsCss: ['../assets/plugins/CKEditor/contents.css', '../css/braille-editor.css'],
                // This is optional, but will let us define multiple different styles for multiple editors using the same CSS file.
                bodyClass: 'document-editor',
                allowedContent: 'img[src];p(proofread-current);span(word-add,word-remove)'
            });

            // 需要等待编辑器初始化完iframe和内容才能调用
            editor.on('contentDom', function () {
                util.hideLoading();
                computeEditorFont();
                // 默认只读
                editor.setReadOnly(true);
            });
        }

        /**
         * 打开图形设计器
         * 该函数将在模块初始化时被注入到全局window对象，由CKEditor内的插件调用
         */
        function openSharpDesigner() {
            that.openPage('sharp-designer', {data: null});
        }

        /**
         * 根据行、列数处理编辑器字号
         */
        function computeEditorFont() {
            if (editor) {
                // 开始处理编辑器样式
                var fontSize = CONTENT_WIDTH / cols;
                var doc = $(that.$('iframe')[0].contentDocument);
                doc.find('body').css('font-size', fontSize);
            }
        }

        /**
         * 在比较过程中会将图片数据提取出来，否则性能会非常差
         */
        var imageMap = [];

        /**
         * 将一个包含<p>、<img>标签的html转换为可比较的纯文本
         * @param data
         */
        function toComparableString(data, keepParagraph) {
            var $content = $('<div>' + data + '</div>');
            // 将图片去掉
            $content.find('img').each(function () {
                var img = $(this);
                imageMap.push(img.attr('src'));
                img.replaceWith('[image]');
            });
            // 盲人录入时会将当前光标所在段落在明眼人屏幕上以特殊背景色呈现，
            // 为了压缩内容后，盲人侧保存临时数据时会将html中图像以及部分去除掉，此时将CURRENT_PREFIX前缀拼装到当前段落内容前进行传输，
            // 后续明眼人侧查看内容时再将对应的样式还原。
            var $current = $content.find('.proofread-current');
            if ($current.length > 0) {
                $current.text(CURRENT_PREFIX + $current.text());
            }
            // 如果保留段落，则返回带<p>标签的html，否则只取text
            if (keepParagraph) {
                return $content.html().replace(/\n\n/g, '\n');
            } else {
                return $content.text().replace(/\n\n/g, '\n');
            }
        }

        /**
         * 如果一个比较结果包含了\n，则是因为跨行了，需要拆分后再增加<span>标签
         * @param data
         * @param className
         * @returns {string}
         */
        function wrapLines(data, className) {
            var parts = data.split('\n');
            var result = [];
            $.each(parts, function (index, part) {
                if (part) {
                    if (className) {
                        result.push('<span class="' + className + '">' + part + '</span>');
                    } else {
                        result.push(part);
                    }
                } else {
                    result.push(part);
                }
            });
            return result.join('\n');
        }

        /**
         * 处理从服务器同步的内容
         * @param data
         */
        function dealWithContent(data) {
            // 只有数据变更了才重新设置，频繁设置会导致CKEditor明显闪烁
            if (lastContent !== data.trpOnlineContent && data.trpOnlineContent) {
                // 比较前清空图片映射
                imageMap = [];

                // 内容都是经过将HTML处理为可比较的普通文本
                // 调用JsDiff组件进行按字符比较
                var diff = JsDiff.diffChars(originComparableContent, data.trpOnlineContent);
                // 存放比较后重新拼装的内容字符串
                var result = '';

                $.each(diff, function (index, part) {
                    if (part.value === CURRENT_PREFIX) {
                        // 比较出了CURRENT_PREFIX则不添加“增加”或“删除”标记
                        result += part.value;
                    } else if (part.added) {
                        // 增加
                        if (part.value.indexOf('\n') >= 0) {
                            // 内容是跨段落的
                            result += wrapLines(part.value, 'word-add');
                        } else {
                            result += '<span class="word-add">' + part.value + '</span>';
                        }
                    } else if (part.removed) {
                        // 删除
                        if (part.value.indexOf('\n') >= 0) {
                            // 内容是跨段落的
                            result += wrapLines(part.value, 'word-remove');
                        } else {
                            result += '<span class="word-remove">' + part.value + '</span>';
                        }
                    } else {
                        // 未变
                        result += part.value;
                    }
                });

                // 还原<p>标签之后的字符串
                var renderData = '';
                // 为内容重新添加<p>标签
                $.each(result.split('\n'), function (index, cData) {
                    // 如果包含了CURRENT_PREFIX，则还原为.proofread-current的class
                    if (cData.indexOf(CURRENT_PREFIX) >= 0) {
                        renderData += '<p class="proofread-current">' + cData.replace(CURRENT_PREFIX, '') + '</p>';
                    } else {
                        renderData += '<p>' + cData + '</p>';
                    }
                });

                // 保存最近一次同步的内容
                lastContent = data.trpOnlineContent;
                // 设置新的内容到CKEditor
                editor.setData(renderData, {
                    callback: function () {
                        // 如果有当前段落，则滚动到当前段落
                        var element = editor.document.findOne('.proofread-current');
                        if (element) {
                            element.scrollIntoView();
                        }
                    }
                });
            }
        }

        /**
         * 生成正误表
         */
        function createErrataData() {
            var rowTemplate =
                '<tr>' +
                '  <td><%- index %></td>' +
                '  <td><input class="form-control" name="page" maxlength="4" value="<%- page %>"></td>' +
                '  <td><input class="form-control" name="line" maxlength="3" value="<%- line %>"></td>' +
                '  <td><input class="form-control" name="content" maxlength="128" value="<%- content %>"></td>' +
                '  <td><input type="checkbox" name="accept" class="form-control"></td>' +
                '</tr>';
            // 清空旧的正误表
            var $table = $('#errataDataTBody').empty();

            // 当前富文本编辑器的内容
            var $content = $(that.$('iframe')[0].contentDocument).find('body');
            var contentWin = that.$('iframe')[0].contentWindow;

            // 如果没有修订内容则返回
            var $errataDom = $content.find('.word-add,.word-remove'), top, row, $dom, index = 1;
            if ($errataDom.length === 0) {
                return;
            }
            // 获取行高
            var lineHeight = contentWin.getComputedStyle($content.find('p')[0])['line-height'];
            lineHeight = parseFloat(lineHeight);
            // 遍历每个修订DOM
            $errataDom.each(function () {
                $dom = $(this);
                top = $dom.offset().top - OFFSET_TOP;
                row = Math.ceil(top / lineHeight);

                $table.append(util.template(rowTemplate, {
                    index: index++,
                    fascicle: 'AAA',
                    page: Math.ceil(row / rows),
                    line: row % rows,
                    content: $dom.text()
                }));
            });
        }

        /**
         * 开始明眼人校对模式（只读，从服务器同步数据）
         */
        function startProofreadRead() {
            // 错误计数清零
            errorCount = 0;
            nextProofreadRead();
        }

        /**
         * 启动下次明眼人校对模式
         */
        function nextProofreadRead() {
            clearTimeout(timer);
            timer = setTimeout(doGetContent, TIMER_INTERVAL);
        }

        /**
         * 从服务器同步临时数据
         */
        function doGetContent() {
            util.sendRequest({
                action: 'tpr/searchInterimProofreadDetail.action',
                data: {
                    bookId: bookId,
                    taskId: taskId,
                    bookFascicleId: bookFascicleId
                },
                success: function (resp) {
                    if (resp.code === 0) {
                        // 同步数据成功
                        if (resp.data.interimProofreadEntity) {
                            dealWithContent(resp.data.interimProofreadEntity);
                        }
                    } else {
                        console.log(resp);
                        errorCount++;
                        // 超过最大容错数，提示
                        if (errorCount > MAX_ERROR) {
                            util.showAlert('从服务器同步内容出错，您可能已经与服务器断开连接，请稍后重新打开该窗口继续操作！');
                            return;
                        }
                    }
                    // 继续下次数据同步
                    nextProofreadRead();
                },
                error: function (xhr) {
                    console.log(xhr);
                    errorCount++;
                    // 超过最大容错数，提示
                    if (errorCount > MAX_ERROR) {
                        util.showAlert('从服务器同步内容出错，您可能已经与服务器断开连接，请稍后重新打开该窗口继续操作！');
                        return;
                    }
                    // 继续下次数据同步
                    nextProofreadRead();
                }
            }, true);
        }

        /**
         * 开始盲人校对模式（可写，向服务器同步数据）
         */
        function startProofreadEdit() {
            // 错误计数清零
            errorCount = 0;
            nextProofreadEdit();
        }

        /**
         * 启动下次盲人校对模式
         */
        function nextProofreadEdit() {
            clearTimeout(timer);
            timer = setTimeout(doSendContent, TIMER_INTERVAL);
        }

        /**
         * 向服务器发送数据
         */
        function doSendContent() {
            // 从CKEditor读取内容
            var content;
            var range = editor.getSelection(), element;
            if (range) {
                element = range.getStartElement();
            }
            // 向CKEditor当前选择元素添加临时样式
            if (element) {
                element.addClass('proofread-current');
            }
            content = editor.getData();
            // 读取内容后清除临时样式
            if (element) {
                element.removeClass('proofread-current');
            }
            // 如果当前内容和上一次内容相同，则直接发送空数据清空后台临时内容，确保前台也能取到空数据
            // if (lastContent === content) {
            //     content = '';
            // } else {
            //     lastContent = content;
            // }
            lastContent = content;

            util.sendRequest({
                action: 'tpr/saveInterimProofreadDetail.action',
                data: {
                    bookId: bookId,
                    taskId: taskId,
                    bookFascicleId: bookFascicleId,
                    trpOnlineContent: toComparableString(content)
                },
                success: function (resp) {
                    if (resp.code === 0) {
                        // 什么也不做
                    } else {
                        console.log(resp);
                        errorCount++;
                        // 超过最大容错数，提示
                        if (errorCount > MAX_ERROR) {
                            util.showAlert('向服务器同步内容出错，您可能已经与服务器断开连接，请稍后重新打开该窗口继续操作！');
                            return;
                        }
                    }
                    // 继续下次数据同步
                    nextProofreadEdit();
                },
                error: function (xhr) {
                    console.log(xhr);
                    errorCount++;
                    // 超过最大容错数，提示
                    if (errorCount > MAX_ERROR) {
                        util.showAlert('向服务器同步内容出错，您可能已经与服务器断开连接，请稍后重新打开该窗口继续操作！');
                        return;
                    }
                    // 继续下次数据同步
                    nextProofreadEdit();
                }
            }, true);
        }

        /**
         * 自动保存内容（盲人校对时才会保存）
         */
        function startAutoSave() {
            clearTimeout(autoTimer);
            autoTimer = setTimeout(function () {
                doSave(false, true);
            }, AUTO_SAVE_INTERVAL);
        }

        /**
         * 保存数据
         * @param needExit
         * @param isAutoSave
         */
        function doSave(needExit, isAutoSave) {
            // 首先清除自动保存的定时器
            clearTimeout(autoTimer);
            // 强制让CKEditor将内容同步到<textarea>
            editor.updateElement();
            // 下发请求
            var params = {
                rowsNum: that.$('#textRows').val(),
                squareNum: that.$('#textCols').val(),
                trpOnlineContent: that.$('#brailleEditor').val(),
                bookId: bookId,
                taskId: taskId,
                bookFascicleId: bookFascicleId,
                mTrpOnlineId: mTrpOnlineId
            };

            // 只有非自动保存才显示进度提示
            if (!isAutoSave) {
                util.showLoading();
            } else {
                that.$('#editorTip').text('自动保存中……');
            }
            util.sendRequest({
                action: 'tpr/saveOnlineTrpDetail.action',
                data: params,
                success: function (resp) {
                    util.hideLoading();
                    that.$('#editorTip').text('');
                    if (resp.code === 0) {
                        if (window.opener && window.opener.proofreadEditCallback) {
                            // 找到了opener则回调后关闭当前窗口
                            window.opener.proofreadEditCallback(resp);
                        }
                        if (needExit && !isAutoSave) {
                            // 需要关闭当前窗口
                            util.showConfirm('内容保存成功，确定要关闭窗口么？', function () {
                                window.close();
                            });
                        } else {
                            if (!isAutoSave) {
                                // 仅保存
                                util.showAlert('内容保存成功！');
                            }
                        }
                        // 重启定时器
                        startAutoSave();
                    } else {
                        console.log(resp);
                        if (!isAutoSave) {
                            util.showAlert(resp.message || '保存内容出错，请稍后重试！');
                        }
                        // 出错也重启自动保存
                        startAutoSave();
                    }
                },
                error: function (xhr) {
                    util.hideLoading();
                    that.$('#editorTip').text('');
                    console.log(xhr);
                    if (!isAutoSave) {
                        util.showAlert('保存内容出错，请稍后重试！');
                    }
                    // 出错也重启自动保存
                    startAutoSave();
                }
            }, true);
        }

        /**
         * 返回正误表给工作流
         */
        function doReturnErrataData() {
            // 正误表
            var $errataRows = $('#errataDataTBody tr'), $row, list = [];
            $errataRows.each(function () {
                $row = $(this);
                // 只有接受的才返回
                if ($row.find('[name="accept"]').prop('checked')) {
                    list.push({
                        bookFascicleId: bookFascicleId,
                        page: $row.find('[name="page"]').val(),
                        line: $row.find('[name="line"]').val(),
                        content: $row.find('[name="content"]').val()
                    });
                }
            });

            // 找到了opener回调则返回内容
            if (window.opener && window.opener.proofreadErrataCallback) {
                window.opener.act
                window.opener.proofreadErrataCallback(list);
            }

            window.close();
        }

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            // 给CKEditor内的插件使用
            window.openSharpDesinger = openSharpDesigner;

            // 开始校对
            that.$container.on('click', '#btnStartProofread', function () {
                if (that.$('#inputProofread').prop('checked')) {
                    // 明眼人只读模式
                    proofreadMode = PROOFREAD_READ;
                    // 明眼人去掉图片
                    editor.setData(toComparableString(originContent, true));

                    startProofreadRead();
                    // 显示明眼人校对的操作区域
                    that.$('#proofreadArea').show();
                } else {
                    // 盲人编辑模式
                    proofreadMode = PROOFREAD_EDIT;
                    // 盲人原始内容带图片
                    editor.setData(originContent, {
                        callback: function () {
                            // 编辑器变为非只读
                            editor.setReadOnly(false);
                        }
                    });

                    startProofreadEdit();
                    // 显示盲人校对的操作区域
                    that.$('#editorArea').show();
                }

                $(this).attr('disabled', 'disabled');
                that.$('#inputProofread').attr('disabled', 'disabled');
                that.$('#inputProofreadBraille').attr('disabled', 'disabled');
            });

            // 保存（盲人）
            that.$container.on('click', '#btnSave', function () {
                doSave(false);
            });

            // 保存并退出（盲人）
            that.$container.on('click', '#btnSaveAndExit', function () {
                doSave(true);
            });

            // 生成正误表
            that.$container.on('click', '#btnCreateErrataData', createErrataData);

            // 保存并退出（明眼人）
            that.$container.on('click', '#btnSaveProofreadAndExit', doReturnErrataData);
        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
            util.showLoading();
            util.sendRequest({
                action: 'tpr/searchOnlineTrpDetail.action',
                data: {
                    bookId: bookId,
                    taskId: taskId,
                    bookFascicleId: bookFascicleId
                },
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        // 编辑的内容
                        if (resp.data.onlineTrpEntity) {
                            // that.$('#brailleEditor').val(resp.data.onlineTrpEntity.trpOnlineContent);
                            originContent = resp.data.onlineTrpEntity.trpOnlineContent;
                            originComparableContent = toComparableString(originContent);
                            // 行数、方数
                            rows = resp.data.onlineTrpEntity.rowsNum || DEFAULT_ROWS;
                            cols = resp.data.onlineTrpEntity.squareNum || DEFAULT_COLS;
                        }

                        mTrpOnlineId = resp.data.mTrpOnlineId;
                        that.$('#textRows').val(rows);
                        that.$('#textCols').val(cols);
                        // 初始化CKEditor
                        initEditor();
                    } else {
                        console.log(resp);
                        util.showAlert(resp.message || '初始化译录内容出错，请稍后重试！', function () {
                            window.close();
                        });
                    }
                },
                error: function (xhr) {
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('初始化译录内容出错，请稍后重试！', function () {
                        window.close();
                    });
                }
            }, true);
        }

        /**
         * 初始化时被调用
         */
        this.onInit = function ($el, tpl, data, indexRef) {
            // 页面标题，此处特殊，是设置整个页面的顶部标题，而不是当前模块
            $('#editorStage').text('——在线译录');

            this._super($el, tpl, data, indexRef);
            that = this;
            that.initTemplate(tpl, {});

            // URL获取参数
            var urlParams = util.getUrlParameters();
            taskId = urlParams.taskId;
            bookId = urlParams.bookId;
            bookFascicleId = urlParams.bookFascicleId;

            // 初始化页面事件
            initPageEvent();

            // 初始化页面数据
            initPageData();
        };

        /**
         * 返回时调用
         * @param data
         */
        this.onBack = function (data) {
            // 从图形设计器返回
            if (data && data.image) {
                if (editor) {
                    var $image = $('<img>');
                    $image.attr('src', data.image);
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