define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var DialogBase = require('../../../common/base-dialog');
    var listTpl = require('./reprint-audit-add-list.tpl');
    var Module = DialogBase.extend(new function () {
        var that;
        var currentApply = '';
        var bookDateAdd = {};

        /**
         * 查询列表
         */
        function searchInfo() {
            var params = {};
            var action = 'reprintAudit/searchAddReprintAuditDetail.action';
            if (currentApply && currentApply.info) {
                action = 'reprintAudit/searchModifyReprintAuditDetail.action';
                params.reprintBookAuditId = currentApply.info;
                params.taskId = currentApply.taskId;
                that.$('#cipCreate').text('修改');
            }
            util.showLoading();
            util.sendRequest({
                data: params,
                action: action,
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
                        that.$('#panelWorkflowContent input').each(function () {
                            that.addValidateField($('#panelWorkflowContent'), $(this));
                        });
                        // 修改模式有数据，渲染模板
                        if (resp.data.reprintBookInfoList && resp.data.reprintBookInfoList.length > 0) {
                            var addIds = [], bookNames = [], bookLeads = [], bookReads = [];
                            for (var i = 0; i < resp.data.reprintBookInfoList.length; i++) {
                                for (var j in resp.data.reprintBookInfoList[i]) {
                                    if (j === 'bookId') {
                                        addIds.push(resp.data.reprintBookInfoList[i][j]);
                                    }
                                    if (j === 'bookName') {
                                        bookNames.push(resp.data.reprintBookInfoList[i][j]);
                                    }
                                    if (j === 'libraryNeedNum') {
                                        bookLeads.push(resp.data.reprintBookInfoList[i][j]);
                                    }
                                    if (j === 'readersServiceNeedNum') {
                                        bookReads.push(resp.data.reprintBookInfoList[i][j]);
                                    }
                                }
                            }
                            var $tbody = $("#selectBookTable");
                            for (var i = 0; i < addIds.length; i++) {
                                var bookTr = $('<tr><td>' + (i + 1) + '</td><td>' + bookNames[i] + '</td><td>' + bookReads[i] + '</td><td>' + bookLeads[i] + '</td><td><button data-id="' + addIds[i] + '" data-name="' + bookNames[i] + '" data-read="' + bookReads[i] + '" data-lead="' + bookLeads[i] + '" class="btn btn-xs btn-danger' +
                                    ' btn-rounded' +
                                    ' book-delete">删除</button></td></tr>');
                                $tbody.append(bookTr);
                            }
                            bookDateAdd = {
                                idReAd: addIds,
                                nameReAd: bookNames,
                                leadReAd: bookLeads,
                                readReAd: bookReads
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
                action: 'reprintAudit/saveOrSubmitReprintAudit.action',
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
            if (bookDateAdd.idReAd && bookDateAdd.idReAd.length > 0) {
                // 表单验证
                var $form = that.$('#panelWorkflowContent');
                // 没有错误开始处理
                if (that.validate($form) === true) {
                    // 通过公共方法生成表单参数
                    var params = {};
                    params.flowId = $form.find('input[name="flowId"]').val();
                    params.flowName = $form.find('input[name="flowName"]').val();
                    params.nextCategory = $form.find('input[name="nextCategory"]').val();
                    params.currentFlowId = 'rpt_addReprint';
                    params.deptIds = $form.find('input[name="deptIds"]').val();
                    params.roleIds = $form.find('input[name="roleIds"]').val();
                    params.taskUsers = $form.find('input[name="taskUsers"]').attr('data-value');
                    params.reprintBookAuditName = $form.find('input[name="reprintBookAuditName"]').val();
                    params.reprintBookAuditId = currentApply.info;
                    params.taskId = currentApply.taskId;
                    params.bookIdList = bookDateAdd.idReAd;
                    params.operationType = isSubmit ? '2' : '1';
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
         * 初始化页面事件
         */
        function initPageEvent() {
            //图书添加
            that.$container.on('click', '#addBook', function () {
                that.openPage('braille/reprint-audit/reprint-audit-select', bookDateAdd);
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
                var ids = bookDateAdd.idReAd;
                var bookNames = bookDateAdd.nameReAd;
                var bookLeads = bookDateAdd.leadReAd;
                var bookReads = bookDateAdd.readReAd;
                var index = $.inArray(id, ids);
                if (index >= 0) {
                    ids.splice(index, 1);
                    bookNames.splice(index, 1);
                    bookLeads.splice(index, 1);
                    bookReads.splice(index, 1);
                }
                var $tbody = $("#selectBookTable");
                // 重新渲染tobdy
                $tbody.empty();
                for (var i = 0; i < ids.length; i++) {
                    var bookTr = $('<tr><td>' + (i + 1 ) + '</td><td>' + bookNames[i] + '</td><td>' + bookReads[i] + '</td><td>' + bookLeads[i] + '</td><td><button data-id="' + ids[i] + '" data-name="' + bookNames[i] + '" data-read="' + bookReads[i] + '" data-lead="' + bookLeads[i] + '" class="btn btn-xs' +
                        ' btn-danger btn-rounded' +
                        ' book-delete">删除</button></td></tr>');
                    $tbody.append(bookTr);
                }
                // 重新生成bookDateAdd
                if (ids) {
                    bookDateAdd = {
                        idReAd: ids,
                        nameReAd: bookNames,
                        leadReAd: bookLeads,
                        readReAd: bookReads
                    };
                }
            });

        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
            searchInfo();
            that.initValidate(that.$('#panelWorkflowContent'));
        }

        /**
         * 初始化时被调用
         */
        this.onInit = function ($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);
            bookDateAdd = {};
            that = this;
            currentApply = data;
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
            if (data.book && data.idReAd) {
                console.log(data)
                bookDateAdd = data;
                var length = $('#selectBookTable tr').length;
                var ids = [], names = [], leads = [], reads = [];
                if (data.idReAd) {
                    ids = data.idReAd;
                    names = data.nameReAd;
                    leads = data.leadReAd;
                    reads = data.readReAd;
                }
                //将数据添加到已有的table表格数据后
                var $tbody = $("#selectBookTable");
                for (var i = 0; i < ids.length; i++) {
                    var bookTr = $('<tr><td>' + (i + 1 + length) + '</td><td>' + names[i] + '</td><td>' + reads[i] + '</td><td>' + leads[i] + '</td><td><button data-id="' + ids[i] + '" data-lead="' + leads[i] + '" data-name="' + names[i] + '" data-read="' + reads[i] + '" class="btn btn-xs btn-danger btn-rounded book-delete">删除</button></td></tr>');
                    $tbody.append(bookTr);
                }
                // 获取渲染后的所有tr上的id与name，将bookDateAdd替换
                var newId = [], newName = [], newLead = [], newRead = [];
                $("#selectBookTable tr").each(function () {
                    var $el1 = $(this);
                    newId.push($el1.find('button').attr('data-id'));
                    newName.push($el1.find('button').attr('data-name'));
                    newLead.push($el1.find('button').attr('data-lead'));
                    newRead.push($el1.find('button').attr('data-read'));
                });
                bookDateAdd = {
                    idReAd: newId,
                    nameReAd: newName,
                    leadReAd: newLead,
                    readReAd: newRead,
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