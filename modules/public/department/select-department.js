define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var PageBase = require('../../../common/base-dialog');
    var listTpl = require('./select-department-list.tpl');

    var Module = PageBase.extend(new function () {
        var that;
        var currentPage = '1';
        
        /**
         * 查询部门列表
         */
        function queryDepartmentList() {
        	var params = {
        		page: currentPage
        	};
        	util.showLoading('');
        	util.sendRequest({
        		type: 'POST',
        		data: params,
        		action: 'department/listDepartment.action',
        		success: function(resp) {
        			util.hideLoading();
        			if (resp.code === 0) {
                        that.$('#selectDepartmentTable').html(util.template(listTpl, {list: resp.data.records}));
                        // 分页数据
                        that.$('#deptManagePaging').html(that.buildPagination(resp.data.pageNow, resp.data.pageCount));
                    } else {
                        util.showAlert(resp.message || '查询部门列表出错，请稍后重试！');
                    }
        		},
        		error: function(xhr) {
        			// XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('查询部门列表出错，请稍后重试！');
        		}
        	})
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

            // 点击选择按钮
            that.$container.on('click', 'table button', function(){
                var $el = $(this).parent().parent();
                // 返回给前一个页面
                var data = {
                    id: $el.attr('data-id'),
                    name: $el.attr('data-name')
                };
                that.close(data);
            });
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