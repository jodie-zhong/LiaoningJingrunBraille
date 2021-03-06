define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var PageBase = require('../../../common/base-page');
    // 编辑界面模板
    var editTpl = require('./department-manage-edit.tpl');
    // 列表界面模板
    var listTpl = require('./department-manage-list.tpl');

    var Module = PageBase.extend(new function () {
        var that;
        // 当前选中的部门ID
        var currentDepartmentId = '';
        var currentPage = '1';

        /**
         * 查询部门列表
         */
        function queryDepartmentList() {
            // 查询列表时编辑界面及当前选择部门ID清空
            currentDepartmentId = '';
            that.$('#departmentEditPanel').html('<h3 class="c-gray">（请选择一个部门进行编辑部门）</h3>');
            that.$('.depart').text('部门信息');
            // 查询部门列表
            var queryData = {
                page: currentPage
            };
            util.showLoading();
            util.sendRequest({
                data: queryData,
                action: 'department/listDepartment.action',
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        // 填充列表
                        that.$('#departmentListTable').html(util.template(listTpl, {list: resp.data.records}));
                        // 分页数据
                        that.$('#deptManagePaging').html(that.buildPagination(resp.data.pageNow, resp.data.pageCount));
                    } else {
                        console.log(resp);
                        util.showAlert(resp.message || '查询部门列表出错，请稍后重试！');
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('查询部门列表出错，请稍后重试！');
                }
            });
        }

        /**
         * 查询部门信息
         * @param id
         */
        function queryDepartmentInfo(id) {
            // 当前选择的部门ID
            currentDepartmentId = id;
            // 查询部门详情
            var queryData = {
                departmentId: currentDepartmentId
            };
            util.showLoading('正在查询部门信息……');
            util.sendRequest({
                data: queryData,
                action: 'department/detailDepartment.action',
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        that.$('#departmentEditPanel').html(util.template(editTpl, resp.data));
                        that.initValidate(that.$('#formDeptEdit'));
                        that.$('.depart').text('部门信息修改');
                    } else {
                        console.log(resp);
                        util.showAlert(resp.message || '查询部门信息出错，请稍后重试！');
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('查询部门信息出错，请稍后重试！');
                }
            });
        }

        /**
         * 添加部门信息
         */
        function addDepartmentInfo() {
        	that.$('#btnDeptSave').removeAttr('disabled');
            currentDepartmentId = '';

            that.$('#departmentEditPanel').html(util.template(editTpl,
                {
                    departmentName: '',
                    departmentPhone: '',
                    departmentPrincipal: '',
                    departmentLeader: '',
                    departmentPrincipalName: '',
                    departmentLeaderName: ''
                }));
            that.initValidate(that.$('#formDeptEdit'));
        }

        /**
         * 保存部门信息
         */
        function saveDepartment() {
            // 表单验证
            var $form = that.$('#formDeptEdit');
            // 没有错误开始处理
            if(that.validate($form) === true) {
                // 通过公共方法生成表单参数
                var params = that.buildFormParams($form.find('input'));
                var action = 'department/createDepartment.action';
                var actionName = '新增';
                // 如果有currentDepartmentId则是修改
                if (currentDepartmentId) {
                    action = 'department/modifyDepartment.action';
                    params.departmentId = currentDepartmentId;
                    actionName = '修改';
                }
                // 下发请求
                util.showLoading();
                util.sendRequest({
                    type: 'POST',
                    data: params,
                    action: action,
                    success: function (resp) {
                        // 请求成功（200）
                        util.hideLoading();
                        if (resp.code === 0) {
                            // 业务执行成功
                            that.$('#btnDeptSave').attr('disabled', 'disabled');
        					that.$('#btnAddDepartment').removeAttr('disabled');
                            util.showAlert('数据保存成功!', function () {
                                queryDepartmentList();
                            });
                        } else {
                            // 业务执行失败
                            util.showAlert(resp.message || actionName + '部门出错，请稍后重试！');
                        }
                    },
                    error: function (xhr) {
                        // XHR错误
                        util.hideLoading();
                        console.log(xhr);
                        util.showAlert(actionName + '部门出错，请稍后重试！');
                    }
                });

            }
        }

        /**
         * 跳转页面
         */
        function jumpPage() {
            var $el = $(this);
            var page = $el.attr('data-page');
            if (page) {
                // 修改页面后重新刷新页面数据
                currentPage = page;
                queryDepartmentList();
            }
        }

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            // 选中
            that.$container.on('click', '#departmentListTable tr', function () {
                // 选中状态
                that.$('#btnDeptSave').removeAttr('disabled');
                that.$('#departmentListTable').find('tr').removeClass('info');
                $(this).addClass('info');
                // 查询部门详情
                var id = $(this).attr('data-id');
                if (id) {
                    queryDepartmentInfo(id);
                }
            });

            // 新增
            that.$container.on('click', '#btnAddDepartment', addDepartmentInfo);
            // 保存
            that.$container.on('click', '#btnDeptSave', saveDepartment);
            // 分页
            that.$container.on('click', '#deptManagePaging a', jumpPage);
        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
            queryDepartmentList();
            
        }

        /**
         * 初始化时被调用
         */
        this.onInit = function ($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);
            that = this;
            that.initTemplate(tpl, {});
            // 重新初始化数据
            currentDepartmentId = '';
            currentPage = '1';
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