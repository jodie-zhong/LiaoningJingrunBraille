define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var PageBase = require('../../../common/base-dialog');
    var listTpl = require('./select-role-list.tpl');

    var Module = PageBase.extend(new function () {
        var that;
        var searchParams = {};
        var departId = '';

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
			// 点击选择按钮
			that.$container.on('click','table button', function(){
				var $el = $(this).parent().parent();
				// 返回给前一个页面
				var data = {
					id: $el.attr('data-id'),
					name: $el.attr('data-name')
				};
				that.close(data);
			});

			// 搜索角色
            that.$container.on('click','#btnSearchRole',function(){
                searchParams = that.buildSearchParams(that.$('#formSearchRole input[data-search],select[data-search]'));
                searchRoleList();
            });
        }

        /**
         * 搜索角色列表
         */
        function searchRoleList(){
            util.showLoading('正在查询权限列表……');
            util.sendRequest({
                type: 'POST',
                data: searchParams,
                action: 'role/listRole.action',
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        that.$('#selectRoleTable').html(util.template(listTpl, {list: resp.data.records}));
                        // 分页数据
                        that.$('#roleManagePaging').html(that.buildPagination(resp.data.pageNow, resp.data.pageCount));
                    } else {
                        util.showAlert(resp.message || '查询权限列表出错，请稍后重试！');
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('查询权限列表出错，请稍后重试！');
                }
            });
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
                searchRoleList();
            }
        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
            searchRoleList();
        }

        /**
         * 初始化时被调用
         */
        this.onInit = function ($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);
            that = this;
            that.initTemplate(tpl, {});

            // 初始化变量
            searchParams = {};
            
            // 如果传了部门和角色，控制搜索条件
            if(!util.showAll && data.departId) {
            searchParams.searchDepartmentId = data.departId;
            // 隐藏搜索
            that.$('#formSearchRole').parent().hide();
            }

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