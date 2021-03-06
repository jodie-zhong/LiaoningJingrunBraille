define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var DialogBase = require('../../../common/base-dialog');
    var listTpl = require('./reprint-add-list.tpl');
    var Module = DialogBase.extend(new function () {
        var that;
        var bookDateAdd = {};

        /**
         * 查询列表
         */
        function searchInfo() {
            util.showLoading();
            util.sendRequest({
                data: {},
                action: 'reprint/addReprint.action',
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
                        that.$('#panelWorkflow input').each(function () {
                            that.addValidateField($('#panelWorkflow'), $(this));
                        });
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
                action: 'reprint/saveOrSubmitReprint.action',
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
            if (bookDateAdd.idReprint && bookDateAdd.idReprint.length > 0) {
                // 表单验证
                var $form = that.$('#panelWorkflow');
                // 没有错误开始处理
                if (that.validate($form) === true) {
                    // 通过公共方法生成表单参数
                    var params = {};
                    params.flowId = $form.find('input[name="flowId"]').val();
                    params.flowName = $form.find('input[name="flowName"]').val();
                    params.nextCategory = $form.find('input[name="nextCategory"]').val();
                    params.currentFlowId = 'rpt_launchReprint';
                    params.deptIds = $form.find('input[name="deptIds"]').val();
                    params.roleIds = $form.find('input[name="roleIds"]').val();
                    params.taskUsers = $form.find('input[name="taskUsers"]').attr('data-value');
                    params.bookList = [];
                    var $str = $.trim(that.$('#sponsorDept').text())
                    that.$('#selectBookTable tr').each(function () {
                        var $btn = $(this).find('button');
                        if ($str === '典藏借阅部') {
                            params.bookList.push({
                                bookId: $btn.attr('data-id'),
                                bookName: $btn.attr('data-name'),
                                libraryNeedNum: $(this).find('input[name="needNum"]').val(),
                                launchReason: $(this).find('input[name="launchReason"]').val()
                            });
                        } else {
                            params.bookList.push({
                                bookId: $btn.attr('data-id'),
                                bookName: $btn.attr('data-name'),
                                readersServiceNeedNum: $(this).find('input[name="needNum"]').val(),
                                launchReason: $(this).find('input[name="launchReason"]').val()
                            });
                        }
                    });
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
         * 重新生成序号
         */
        function onWorkLoadNum() {
            var i = 1;
            that.$('#selectBookTable tr').each(function () {
                $(this).find('td[data-value="number"]').text(i++);
            });
        }

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            //图书添加
            that.$container.on('click', '#addBook', function () {
                that.openPage('braille/reprint/reprint-select', bookDateAdd);
            });
            // 提交（一定要检查有没有一本书都没选的）
            that.$container.on('click', '#btnCipSubmit', function () {
                saveReportInfo(true);
            });

            // 每本书的删除事件
            that.$container.on('click', 'button.book-delete', function () {
                var $el = $(this);
                var id = $el.attr('data-id');
                var ids = bookDateAdd.idReprint;
                var bookNames = bookDateAdd.nameReprint;
                var index = $.inArray(id, ids);
                if (index >= 0) {
                    ids.splice(index, 1);
                    bookNames.splice(index, 1);
                }
                $el.parents('tr').remove();
                onWorkLoadNum()
                // 重新生成bookDateAdd
                if (ids) {
                    bookDateAdd = {
                        idReprint: ids,
                        nameReprint: bookNames
                    };
                }
            });

        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
            searchInfo();
            that.initValidate(that.$('#panelWorkflow'));
        }

        /**
         * 初始化时被调用
         */
        this.onInit = function ($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);
            bookDateAdd = {};
            that = this;
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
            if (data.book && data.idReprint) {
                console.log(data)
                bookDateAdd = data;
                var length = $('#selectBookTable tr').length;
                var ids = [], names = [];
                ids = data.idReprint;
                names = data.nameReprint;
                //将数据添加到已有的table表格数据后
                var $tbody = $("#selectBookTable");
                for (var i = 0; i < ids.length; i++) {
                    var bookTr = $('<tr><td data-value="number">' + (i + 1 + length) + '</td><td title="' + names[i] + '">' + names[i] + '</td><td' +
                        ' class="form-group"><input type="text" data-fv-notempty="true" data-fv-notempty-message="请填写数量" pattern="^[0-9]*$" data-fv-regexp-message="输入8位以下整数"' +
                        ' maxlength="8" name="needNum"' +
                        ' class="form-control small"></td><td' +
                        ' class="form-group"><input type="text" maxlength="512" placeholder="(最长输入512个字符)" name="launchReason" class="form-control small"></td><td><button data-id="' + ids[i] + '" data-name="' + names[i] + '" class="btn btn-xs btn-danger btn-rounded book-delete">删除</button></td></tr>');
                    $tbody.append(bookTr);
                }
                that.$('#panelWorkflow input').each(function () {
                    that.addValidateField($('#panelWorkflow'), $(this));
                });
                // 获取渲染后的所有tr上的id与name，将bookDateAdd替换
                var newId = [], newName = [];
                $("#selectBookTable tr").each(function () {
                    var $el1 = $(this);
                    newId.push($el1.find('button').attr('data-id'));
                    newName.push($el1.find('button').attr('data-name'));
                });
                bookDateAdd = {
                    idReprint: newId,
                    nameReprint: newName
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