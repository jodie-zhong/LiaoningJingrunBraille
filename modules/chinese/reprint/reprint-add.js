define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var DialogBase = require('../../../common/base-dialog');
    var Module = DialogBase.extend(new function () {
        var that;
        var bookDateAdd = {};

        /**
         *  执行保存或提交操作
         */
        function doSave(params) {
            // 下发请求
            util.showLoading();
            util.sendRequest({
                data: params,
                action: 'cnReprint/saveOrSubmitCNReprint.action',
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

        // 重新生成序号和名字
        function onWorkLoadNum() {
            var i = 1;
            that.$('#selectBookTable tr').each(function () {
                $(this).find('td[data-value="number"]').text(i++);
            });
            that.$('#selectBookTable tr').each(function () {
                var name = "handleState" + (i - 2);// 上边i加1了
                $(this).find('input[type="radio"]').attr('name', name);
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
                    params.currentFlowId = 'rpt_cnAddReprint';
                    params.deptIds = $form.find('input[name="deptIds"]').val();
                    params.roleIds = $form.find('input[name="roleIds"]').val();
                    params.taskUsers = $form.find('input[name="taskUsers"]').attr('data-value');
                    params.bookList = [];
                    that.$('#selectBookTable tr').each(function () {
                        var $btn = $(this).find('button');
                        params.bookList.push({
                            bookId: $btn.attr('data-id'),
                            hBookPrintState: $(this).find('input[type="radio"]:checked').val(),
                            reprintReason: $(this).find('input[name="launchReason"]').val(),
                        });
                    });
                    params.operationType = isSubmit ? '2' : '1';
                    params.handleState = '1';
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
                that.openPage('chinese/reprint/reprint-select', bookDateAdd);
            });
            // 提交（一定要检查有没有一本书都没选的）
            that.$container.on('click', '#btnCipSubmit', function () {
                saveReportInfo(true);
            });

            // 每本书的删除事件
            that.$container.on('click', 'button.book-delete', function () {
                // 先删除数据，并排序，再删dom,重置radio的name
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
                onWorkLoadNum();
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
            that.initValidate(that.$('#panelWorkflow'));
        }

        /**
         * 初始化时被调用
         */
        this.onInit = function ($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);
            bookDateAdd = {};
            that = this;
            console.log(data)
            that.initTemplate(tpl, {info: data.info});
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
                var ids = [], names = [],codes = [],types=[];
                ids = data.idReprint;
                names = data.nameReprint;
                types =data.typeReprint;
                //将数据添加到已有的table表格数据后
                var $tbody = $("#selectBookTable");
                for (var i = 0; i < ids.length; i++) {
                    var bookTr = $('<tr><td data-value="number">' + (i + 1 + length) + '</td><td title="' + names[i] + '">' + names[i] + '</td><td title="' + types[i] + '">' + types[i] + '</td><td' +
                        ' class="form-group"><label class="radio-inline"><input type="radio" name="handleState' + (i + length) + '"" value="3" checked/>再版 </label> <label class="radio-inline"><input type="radio" name="handleState' + (i + length) + '" value="2"/>重印</label></td><td' +
                        ' class="form-group"><input type="text" maxlength="512" placeholder="(最长输入512个字符)" name="launchReason" class="form-control small"></td><td><button data-id="' + ids[i] + '" data-name="' + names[i] + '" data-type="' + types[i] + '" class="btn btn-xs btn-danger btn-rounded' +
                        ' book-delete">删除</button></td></tr>');
                    $tbody.append(bookTr);
                }
                that.$('#panelWorkflow input').each(function () {
                    that.addValidateField($('#panelWorkflow'), $(this));
                });
                // 获取渲染后的所有tr上的id与name，将bookDateAdd替换
                var newId = [], newName = [],newType=[];
                $("#selectBookTable tr").each(function () {
                    var $el1 = $(this);
                    newId.push($el1.find('button').attr('data-id'));
                    newName.push($el1.find('button').attr('data-name'));
                    newType.push($el1.find('button').attr('data-type'));
                });
                bookDateAdd = {
                    idReprint: newId,
                    nameReprint: newName,
                    typeReprint: newType
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