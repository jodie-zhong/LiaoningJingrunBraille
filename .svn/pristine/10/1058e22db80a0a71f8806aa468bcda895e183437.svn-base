define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var PageBase = require('../../../common/base-dialog');
    var listTpl = require('./choice-user-list.tpl');

    var Module = PageBase.extend(new function () {
        var that;
        var currentPage = 1;
        var searchParams = {};
        var info={};
        /**
         * 搜索人员列表
         */
        function searchUserList(){
            // 生成搜索条件
            var params = {
                page:currentPage,
                jobInsideYear:info.currentYear,
                jobInsideMonth:info.currentMonth
            };
            if(searchParams.searchUserName){
                params.searchUserName=searchParams.searchUserName;
            }
            if(searchParams.searchUserIdCard){
                params.searchUserIdCard=searchParams.searchUserIdCard;
            }
			util.showLoading('正在查询人员列表……');
            util.sendRequest({
                data: params,
                action: 'job/searchUserByDepartmentId.action',
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        that.$('#selectUserTable').html(util.template(listTpl, {list:resp.data.records}));
                        // 分页数据
						that.$('#personListPaging').html(that.buildPagination(resp.data.pageNow, resp.data.pageCount));
                    } else {
                        util.showAlert(resp.message || '查询人员列表出错，请稍后重试！');
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('查询人员列表出错，请稍后重试！');
                }
            });
        }
        
        /**
		 * 跳转页面
		 */
		function jumpPage() {
			var $el = $(this);
			var page = $el.attr('data-page');
			if(page) {
				// 修改页面后重新刷新页面数据
				currentPage = page;
				searchUserList();
			}
		}
        
        /**
         * 初始化页面事件
         */
        function initPageEvent() {

            // 点击选择按钮
            that.$container.on('click', 'table button', function(){
                var $el = $(this).parent().parent();
                var data = {
                    id: $el.attr('data-id'),
                    name: $el.attr('data-name'),
                    userIdCard:$el.attr('data-userIdCard')
                };
                that.close(data);
            });

            // 搜索按钮
			that.$container.on('click','#btnSearchUser',function(){
				searchParams = that.buildSearchParams(that.$('#formSearchUser input[data-search]'));
				currentPage = 1;
				searchUserList();
			});

			// 分页
			that.$container.on('click', '#personListPaging a', jumpPage);
		}

        /**
         * 初始化页面数据
         */
        function initPageData() {
            // 搜索默认的人员列表
            searchUserList();
        }

        /**
         * 初始化时被调用
         */
        this.onInit = function ($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);
            that = this;
            info=data;
            searchParams = {};
            currentPage = 1;
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
        this.onResize = function(){
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