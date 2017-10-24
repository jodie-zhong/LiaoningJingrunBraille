define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var PageBase = require('../../../common/base-dialog');

    var Module = PageBase.extend(new function () {
        var that;
        var bookDate = {};

        /**
         * 图书列表
         */
        function searchBookList() {
            // 前页面有的图书数据会带到这，匹配后渲染未添加的
            util.showLoading()
            util.sendRequest({
                action: 'cnReprint/searchBookToExamineList.action',
                data: {},
                success: function (resp) {
                    util.hideLoading();
                    console.log(resp);
                    if (resp.code === 0) {
                        //从得到数据提取id
                        var addIds = [], bookNames = [], bookLeads = [], bookReads = [], bookType = [],newBookType = [], bookReprintIds = [], addTaskIds = [], inputStates = [], inputTexts = [],bookParentIds =[],handleStates=[],taskUsers=[];
                        for (var i = 0; i < resp.data.length; i++) {
                            for (var j in resp.data[i]) {
                                if (j === 'bookId') {
                                    addIds.push(resp.data[i][j]);
                                }
                                if (j === 'bookName') {
                                    bookNames.push(resp.data[i][j]);
                                }
                                if (j === 'reprintReason') {
                                    bookLeads.push(resp.data[i][j]);
                                }
                                if (j === 'hReprintBookAnditId') {
                                    bookReprintIds.push(resp.data[i][j]);
                                }
                                if (j === 'taskId') {
                                    addTaskIds.push(resp.data[i][j]);
                                }
                                if (j === 'hBookPrintState') {
                                    bookReads.push(resp.data[i][j]);
                                    if (resp.data[i][j] === '2') {
                                        bookType.push('重印');
                                    } else {
                                        bookType.push('再版');
                                    }
                                }
                                if (j === 'inputState') {
                                    inputStates.push(resp.data[i][j]);
                                    if (resp.data[i][j] === '1') {
                                        inputTexts.push('未录入');
                                    } else {
                                        inputTexts.push('已录入');
                                    }
                                }
                                if (j === 'bookType') {
                                    if(resp.data[i][j] === '2'){
                                        newBookType.push('大字本');
                                    }else {
                                        newBookType.push('普通本');
                                    }
                                }
                                if(j==='parentBookId'){
                                    bookParentIds.push(resp.data[i][j]);
                                }
                                if(j==='handleState'){
                                    handleStates.push(resp.data[i][j]);
                                }
                                if(j==='taskUsers'){
                                    taskUsers.push(resp.data[i][j]);
                                }
                            }
                        }
                        if (bookDate.idReAd) {
                            var idArr = [];
                            idArr = bookDate.idReAd;
                            $.each(idArr, function (i) {
                                var index = $.inArray(idArr[i], addIds);
                                if (index >= 0) {
                                    addIds.splice(index, 1);
                                    bookNames.splice(index, 1);
                                    bookLeads.splice(index, 1);
                                    bookReads.splice(index, 1);
                                    bookReprintIds.splice(index, 1);
                                    bookType.splice(index, 1);
                                    addTaskIds.splice(index, 1);
                                    inputStates.splice(index, 1);
                                    inputTexts.splice(index, 1);
                                    bookParentIds.splice(index, 1);
                                    handleStates.splice(index, 1);
                                    taskUsers.splice(index, 1);
                                    newBookType.splice(index, 1);
                                }
                            });
                        }
                        var $tbody = $("#selectBookTbody");
                        for (var i = 0; i < addIds.length; i++) {
                            var bookTr = $('<tr data-id="' + addIds[i] + '" data-rePrintId="' + bookReprintIds[i] + '" data-taskId="' + addTaskIds[i] + '" data-inputState="' + inputStates[i] + '" data-name="' + bookNames[i] + '" data-newBookType="' + newBookType[i] + '" data-lead="' + bookLeads[i]+ '" data-bookParentId="' + bookParentIds[i]+ '" data-taskUsers="' + taskUsers[i]+ '" data-handleState="' + handleStates[i] + '" data-read="' + bookReads[i] + '"><td>' + (i + 1) + '</td><td data-check="true"><i class="fa fa-square-o" data-action="check"></i></td><td title="'+ bookNames[i] +'">' + bookNames[i] + '</td><td title="'+ newBookType[i] +'">' + newBookType[i] + '</td><td>' + bookType[i] + '</td><td>' + bookLeads[i] + '</td><td>' + inputTexts[i] + '</td></tr>');
                            $tbody.append(bookTr);
                        }
                    } else {
                        console.log(resp);
                        util.showAlert(resp.message || '查询图书出错，请稍后重试！');
                    }
                },
                error: function (xhr) {
                    util.hideLoading();
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
            var ids = [], names = [], Leads = [], Reads = [], Reprints = [], aTaskIds = [], inputStates = [],parentIds
                =[],handleState=[],taskUsers=[],newBookType=[];
            that.$('#selectBookTbody tr').each(function () {
                $row = $(this);
                if ($row.find('i[data-action="check"]').hasClass('fa-check-square-o')) {
                    ids.push($row.attr('data-id'));
                    names.push($row.attr('data-name'));
                    Leads.push($row.attr('data-lead'));
                    Reads.push($row.attr('data-read'));
                    Reprints.push($row.attr('data-rePrintId'));
                    aTaskIds.push($row.attr('data-taskId'));
                    inputStates.push($row.attr('data-inputState'));
                    parentIds.push($row.attr('data-bookParentId'));
                    handleState.push($row.attr('data-handleState'));
                    handleState.push($row.attr('data-handleState'));
                    taskUsers.push($row.attr('data-taskUsers'));
                    newBookType.push($row.attr('data-newBookType'));
                }
            });

            // 返回给前一个页面
            var data1 = {
                idReAd: ids,
                nameReAd: names,
                leadReAd: Leads,
                readReAd: Reads,
                Reprints: Reprints,
                aTaskId: aTaskIds,
                inputState: inputStates,
                parentBookIds:parentIds,
                audit:handleState,
                taskUsers:taskUsers,
                bookType:newBookType,
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