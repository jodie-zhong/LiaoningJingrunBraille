define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var PageBase = require('../../../common/base-dialog');
    var listTpl = require('./cip-version-select-list.tpl');

    var Module = PageBase.extend(new function () {
        var that;
        var bookDate = {};

        /**
         * 图书列表
         */
        function searchBookList() {
            // 前页面有的图书数据会带到这，匹配后渲染未添加的
            util.sendRequest({
                action: 'cipEditionApply/addBook.action',
                data: {},
                success: function (resp) {
                    console.log(resp);
                    if (resp.code === 0) {
                        //从得到数据提取id
                        var addIds = [], bookNames = [], bookTaskIdS = [], bookTypeCode = [], bookType = [];
                        for (var i = 0; i < resp.data.length; i++) {
                            for (var j in resp.data[i]) {
                                if (j === 'bookId') {
                                    addIds.push(resp.data[i][j]);
                                }
                                if (j === 'bookName') {
                                    bookNames.push(resp.data[i][j]);
                                }
                                if (j === 'taskId') {
                                    bookTaskIdS.push(resp.data[i][j]);
                                }
                                if (j === 'bookTypeCode') {
                                    bookTypeCode.push(resp.data[i][j]);
                                    if (resp.data[i][j] === '1') {
                                        bookType.push('盲文书');
                                    } else if(resp.data[i][j] === '2'){
                                        bookType.push('大字本');
                                    }else {
                                        bookType.push('普通本');
                                    }
                                }
                            }
                        }
                        if (bookDate.idCip) {
                            var idArr = [];
                            if (bookDate.idCip) {
                                idArr = bookDate.idCip;
                            }
                            $.each(idArr, function (i) {
                                var index = $.inArray(idArr[i], addIds);
                                if (index >= 0) {
                                    addIds.splice(index, 1);
                                    bookNames.splice(index, 1);
                                    bookTaskIdS.splice(index, 1);
                                    bookTypeCode.splice(index, 1);
                                    bookType.splice(index, 1);
                                }
                            });
                        }
                        var $tbody = $("#selectBookTbody");
                        for (var i = 0; i < addIds.length; i++) {
                            var bookTr = $('<tr data-id="' + addIds[i] + '" data-name="' + bookNames[i] + '" data-taskId="' + bookTaskIdS[i] + '" data-bookTypeCode="' + bookTypeCode[i] + '"><td>' + (i + 1) + '</td><td data-check="true"><i class="fa fa-square-o" data-action="check"></i></td><td class="bookType">' + bookType[i] + '</td><td>' + bookNames[i] + '</td></tr>');
                            $tbody.append(bookTr);
                        }
                    } else {
                        console.log(resp);
                        util.showAlert(resp.message || '查询图书出错，请稍后重试！');
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    console.log(xhr);
                    util.showAlert('查询图书出错，请稍后重试！');
                }
            });
        }

        /**
         * 确定选择图书
         */
        function selectBookCheck() {
            var $row;
            var ids = [], names = [], tasks = [], codes = [],types=[];
            that.$('#selectBookTbody tr').each(function () {
                $row = $(this);
                if ($row.find('i[data-action="check"]').hasClass('fa-check-square-o')) {
                    ids.push($row.attr('data-id'));
                    names.push($row.attr('data-name'));
                    tasks.push($row.attr('data-taskId'));
                    codes.push($row.attr('data-bookTypeCode'));
                    types.push($row.find('td.bookType').text());
                }
            });

            // 返回给前一个页面
            var data1 = {
                idCip: ids,
                nameCip: names,
                taskCip: tasks,
                codeCip: codes,
                typeCip: types,
                book: true
            };
            that.close(data1);
        }

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            // 列头全选按钮
            that.$container.on('click', '#selectBookContainer thead i[data-action="check"]', function () {
                var $el = $(this);
                if ($el.hasClass('fa-check-square-o')) {
                    // 取消全选
                    $el.removeClass('fa-check-square-o').addClass('fa-square-o');
                    $el.parents('table').find('tbody tr i[data-action="check"]').removeClass('fa-check-square-o').addClass('fa-square-o');
                } else {
                    // 全选
                    $el.removeClass('fa-square-o').addClass('fa-check-square-o');
                    $el.parents('table').find('tbody tr i[data-action="check"]').removeClass('fa-square-o').addClass('fa-check-square-o');
                }
            });

            // 勾选行
            that.$container.on('click', '#selectBookContainer tbody tr', function () {
                var $el = $(this);
                // 设置选择状态
                if ($el.find('i[data-action="check"]').hasClass('fa-check-square-o')) {
                    $el.find('i[data-action="check"]').removeClass('fa-check-square-o').addClass('fa-square-o');
                } else {
                    $el.find('i[data-action="check"]').removeClass('fa-square-o').addClass('fa-check-square-o');
                }

                // 判断全选状态
                if ($el.parents('tbody').find('i[data-action="check"]:not(.fa-check-square-o)').length === 0) {
                    $el.parents('table').find('thead i[data-action="check"]').removeClass('fa-square-o').addClass('fa-check-square-o');
                } else {
                    $el.parents('table').find('thead i[data-action="check"]').removeClass('fa-check-square-o').addClass('fa-square-o');
                }
            });

            // 选择按钮
            that.$container.on('click', '#btnBookCheckSelect', selectBookCheck);

        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
            searchBookList();
        }

        /**
         * 初始化时被调用
         */
        this.onInit = function ($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);
            that = this;
            that.initTemplate(tpl, {});
            bookDate = data;
            // 初始化页面事件
            initPageEvent();

            // 初始化页面数据
            initPageData();
        };

        /**
         * 页面返回事件
         * @param data
         */
        this.onBack = function (data) {
            this._super(data);

        };

        /**
         * 窗口缩放事件
         */
        this.onResize = function () {
            this._super();
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