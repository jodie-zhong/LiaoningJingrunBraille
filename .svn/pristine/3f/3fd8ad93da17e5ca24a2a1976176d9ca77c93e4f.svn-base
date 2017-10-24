define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var DialogBase = require('../../../common/base-dialog');
    var listTpl = require('./cip-version-create-list.tpl');
    var Module = DialogBase.extend(new function () {
        var that;
        var info = null;
        var currentApplyId = '';
        var bookDateAdd = {};

        /**
         * 查询列表
         */
        function searchInfo() {
            var params = {};
            if (currentApplyId && currentApplyId.info) {
                params.isbncipApplyId = currentApplyId.info;
                that.$('#cipCreate').text('修改');
            }
            util.showLoading();
            util.sendRequest({
                data: params,
                action: 'cipEditionApply/createOrModifyApplicationBefore.action',
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        var taskFlow = resp.data.nextTaskFlowInfoEntity;
                        if (taskFlow && taskFlow.nextFlowTaskUserIds) {
                            // 说明有数据，开始找对应的流程
                            var flows = resp.data.userTaskEntities;
                            if (flows) {
                                for (var i = 0; i < flows.length; i++) {
                                    if (taskFlow.flowId === flows[i].flowId) {
                                        flows[i].nextFlowTaskUserIds = taskFlow.nextFlowTaskUserIds;
                                        flows[i].nextFlowTaskUserNames = taskFlow.nextFlowTaskUserNames;
                                    }
                                }
                            }
                        }
                        that.$('#panelWorkflow').html(util.template(listTpl, {info: resp.data}));
                        afterRender();
                        that.$('#panelWorkflowContent input').each(function () {
                            that.addValidateField($('#panelWorkflowContent'), $(this));
                        });
                        that.$('#panelWorkflowContent textarea').each(function () {
                            that.addValidateField($('#panelWorkflowContent'), $(this));
                        });
                        // 修改模式有数据，渲染模板
                        if (resp.data.bookNameList && resp.data.bookNameList.length > 0) {
                            var addIds = [], bookNames = [], taskIds = [], bookType = [], bookCodes = [];
                            for (var i = 0; i < resp.data.bookNameList.length; i++) {
                                for (var j in resp.data.bookNameList[i]) {
                                    if (j === 'bookId') {
                                        addIds.push(resp.data.bookNameList[i][j]);
                                    }
                                    if (j === 'bookName') {
                                        bookNames.push(resp.data.bookNameList[i][j]);
                                    }
                                    if (j === 'taskId') {
                                        taskIds.push(resp.data.bookNameList[i][j]);
                                    }
                                    if (j === 'bookTypeCode') {
                                        bookCodes.push(resp.data.bookNameList[i][j]);
                                        if (resp.data.bookNameList[i][j] === '1') {
                                            bookType.push('盲文书');
                                        } else if(resp.data.bookNameList[i][j] === '2'){
                                            bookType.push('大字本');
                                        }else {
                                            bookType.push('普通本');
                                        }
                                    }
                                }
                            }
                            var $tbody = $("#selectBookTable");
                            for (var i = 0; i < addIds.length; i++) {
                                var bookTr = $('<tr><td data-value="number">' + (i + 1) + '</td><td>' + bookType[i] + '</td><td>' + bookNames[i] + '</td><td><button data-id="' + addIds[i] + '" data-name="' + bookNames[i] + '" data-taskId="' + taskIds[i] + '" data-bookTypeCode="' + bookCodes[i] + '" class="btn btn-xs btn-danger' +
                                    ' btn-rounded' +
                                    ' book-delete">删除</button></td></tr>');
                                $tbody.append(bookTr);
                            }
                            bookDateAdd = {
                                idCip: addIds,
                                nameCip: bookNames,
                                taskCip: taskIds,
                                codeCip: bookCodes,
                                typeCip: bookType
                            };
                        }
                    } else {
                        console.log(resp);
                        util.showAlert(resp.message || '出错，请稍后重试！');
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('出错，请稍后重试！');
                }
            });
        }

        /**
         *  执行保存或提交操作
         */
        function doSave(params) {
            // 下发请求
            util.showLoading();
            util.sendRequest({
                data: params,
                action: 'cipEditionApply/createOrModifyApplication.action',
                success: function (resp) {
                    util.hideLoading();
                    console.log(resp);
                    if (resp.code === 0) {
                        // 业务执行成功
                        util.showAlert('操作成功!', function () {
                            that.close({refresh: true});
                        });
                    } else {
                        // 业务执行失败
                        util.showAlert(resp.message || '操作失败，请稍后重试！');
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('操作失败，请稍后重试！');
                }
            });
        }

        /**
         * 保存数据
         */
        function saveReportInfo(isSubmit) {

            if (bookDateAdd.idCip.length > 0) {
                // 表单验证
                var $form = that.$('#panelWorkflowContent');
                // 没有错误开始处理
                if (that.validate($form) === true) {
                    // 通过公共方法生成表单参数
                    var params = that.buildFormParams($form.find('input,textarea'));
                    params.flowId = $form.find('input[name="flowId"]').val();
                    params.flowName = $form.find('input[name="flowName"]').val();
                    params.nextCategory = $form.find('input[name="nextCategory"]').val();
                    params.deptIds = $form.find('input[name="deptIds"]').val();
                    params.roleIds = $form.find('input[name="roleIds"]').val();
                    params.bookIds = bookDateAdd.idCip.join(',');
                    params.taskIds = bookDateAdd.taskCip.join(',');
                    params.isbncipApplyId = '';
                    params.operationType = isSubmit ? '2' : '1';
                    // 如果有currentApplyId则是修改
                    if (currentApplyId && currentApplyId.info) {
                        params.isbncipApplyId = currentApplyId.info;
                    }
                    if (isSubmit) {
                        // 确认是否下发
                        util.showConfirm('确定要提交么？', function () {
                            doSave(params);
                        });
                    } else {
                        doSave(params);
                    }
                }
            } else {
                util.showAlert("没有选择任何一本书");
            }
        }

        /**
         * 下载页面
         */
        function downLoadBook() {
            var cipApplyName = $('input[name="isbncipApplyName"]').val();
            if (bookDateAdd.idCip.length > 0) {
                var url = util.getServerBase() + 'cipEditionApply/doDownload.action?';
                url += 'bookIds=' + bookDateAdd.idCip.join(',');
                url += '&isbncipApplyName=' + encodeURIComponent(cipApplyName);

                window.open(url, '_blank');
            }
        }
        // 重新生成序号
        function onWorkLoadNum() {
            var i = 1;
            that.$('#selectBookTable tr').each(function() {
                $(this).find('td[data-value="number"]').text(i++);
            });
        }

        /**
         * textarea初始显示比例
         */
        function afterRender() {
            $('textarea').change();
        }
        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            //图书添加
            that.$container.on('click', '#btnAddBook', function () {
                that.openPage('manage/cip-version/cip-version-select', bookDateAdd);
            });
            // 保存（一定要检查有没有一本书都没选的）
            that.$container.on('click', '#btnCipSave', function () {
                saveReportInfo(false);
            });
            // 提交（一定要检查有没有一本书都没选的）
            that.$container.on('click', '#btnCipSubmit', function () {
                saveReportInfo(true);
            });
            // 每本书的删除事件
            that.$container.on('click', 'button.book-delete', function () {
                var $el = $(this);
                var id = $el.attr('data-id');
                var ids = bookDateAdd.idCip;
                var bookNames = bookDateAdd.nameCip;
                var taskIds = bookDateAdd.taskCip;
                var bookCodes = bookDateAdd.codeCip;
                var bookTypes = bookDateAdd.typeCip;
                var index = $.inArray(id, ids);
                if (index >= 0) {
                    ids.splice(index, 1);
                    bookNames.splice(index, 1);
                    taskIds.splice(index, 1);
                    bookCodes.splice(index, 1);
                    bookTypes.splice(index, 1);
                }
                $el.parents('tr').remove();
                onWorkLoadNum();
                // 重新生成bookDateAdd
                if (ids) {
                    bookDateAdd = {
                        idCip: ids,
                        nameCip: bookNames,
                        taskCip: taskIds,
                        codeCip: bookCodes,
                        typeCip: bookTypes
                    };
                }else{
                    bookDateAdd={
                        idCip: [],
                        nameCip:[],
                        taskCip: [],
                        codeCip: [],
                        typeCip: []
                    };
                }
            });
            //下载事件
            that.$container.on('click', '#btnDownloadBook', downLoadBook);
            //查看事件
            that.$container.on('click', '#btnDetailBook', function () {
                if (bookDateAdd.idCip.length > 0) {
                    util.sendRequest({
                        data: {
                            bookIds: bookDateAdd.idCip.join(',')
                        },
                        action: 'cipEditionApply/searchBookInfoList.action',
                        success: function (resp) {
                            console.log(resp);
                            if (resp.code === 0) {
                                that.openPage('manage/cip-version/cip-version-search', resp);
                            } else {
                                // 业务执行失败
                                util.showAlert(resp.message || '查询出错，请稍后重试！');
                            }
                        },
                        error: function (xhr) {
                            // XHR错误
                            console.log(xhr);
                            util.showAlert('查询出错，请稍后重试！');
                        }
                    });
                }
            });
        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
            searchInfo();
            that.initValidate(that.$('#panelWorkflowContent'));
            that.initValidate(that.$('#panelWorkflow'));
            // 文本框
            that.$container.on('change input', 'textarea', function() {
                var len = $(this).val().length;
                var max = $(this).attr('maxlength');
                $(this).parent().find('.len').text(len +'/'+ max);
            });
        }
        /**
         * 初始化时被调用
         */
        this.onInit = function ($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);
            bookDateAdd = {};
            that = this;
            currentApplyId = data;
            that.initTemplate(tpl, {});
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
            if (data.book && data.idCip) {
                console.log(data)
                bookDateAdd = data;
                var length = $('#selectBookTable tr').length;
                var ids = [], names = [], tasks = [],codes=[],types=[];
                if (data.idCip) {
                    ids = data.idCip;
                    names = data.nameCip;
                    tasks = data.taskCip;
                    codes = data.codeCip;
                    types = data.typeCip;
                }
                //将数据添加到已有的table表格数据后
                var $tbody = $("#selectBookTable");
                for (var i = 0; i < ids.length; i++) {
                    var bookTr = $('<tr><td data-value="number">' + (i + 1 + length) + '</td><td class="bookTypeCode">' + types[i] + '</td><td>' + names[i] + '</td><td><button data-id="' + ids[i] + '" data-bookTypeCode="' + codes[i] + '" data-name="' + names[i] + '" data-taskId="' + tasks[i] + '" class="btn btn-xs btn-danger btn-rounded book-delete">删除</button></td></tr>');
                    $tbody.append(bookTr);
                }
                // 获取渲染后的所有tr上的id与name，将bookDateAdd替换
                var newId = [], newName = [], newTask = [],newCode = [],newType = [];
                $("#selectBookTable tr").each(function () {
                    var $el1 = $(this);
                    newId.push($el1.find('button').attr('data-id'));
                    newName.push($el1.find('button').attr('data-name'));
                    newTask.push($el1.find('button').attr('data-taskId'));
                    newCode.push($el1.find('button').attr('data-bookTypeCode'));
                    newType.push($el1.find('.bookTypeCode').text());
                });
                bookDateAdd = {
                    idCip: newId,
                    nameCip: newName,
                    taskCip: newTask,
                    codeCip: newCode,
                    typeCip: newType
                };
            }
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