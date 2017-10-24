define(function(require, exports, module) {
	"use strict";
	
	var util = require('../../../common/util');
	var DialogBase = require('../../../common/base-dialog');
	var listTpl = require('./print-manage-workload-list.tpl');
	
	var Module = DialogBase.extend(new function() {
		var that;
		var info = null;
		var searchParams = {};
		var currentPage = 1;
		
		function searchList() {
			var params = $.extend({}, searchParams);
			params.page = currentPage;
			util.showLoading();
			util.sendRequest({
				type: 'POST',
				data: params,
				action: 'printing/searchWorkLoad.action',
				success: function(resp) {
					util.hideLoading();
					if(resp.code === 0) {
						that.$('#listtbody').html(util.template(listTpl, {
							list: resp.data.pageView.records,
							action: true
						}));
						// 分页数据
						that.$('#personListPaging').html(that.buildPagination(resp.data.pageView.pageNow, resp.data.pageView.pageCount));
						that.$('div[data-type = "export"]').css('display','block');
					} else {
						util.showAlert(resp.message || '查询人员列表出错，请稍后重试！');
					}
				},
				error: function(xhr) {
					// XHR错误
                    console.log(xhr);
					util.hideLoading();
					util.showAlert('查询人员列表出错，请稍后重试！');
				}
			});
		}
		/**
		 * 导出
		 */
//		function searchExport() {
//			var params = $.extend({}, searchParams);
//			util.showLoading();
//			util.sendRequest({
//				type: 'GET',
//				data: params,
//				action: 'printing/downLoadWorkLoad.action',
//				success: function(resp) {
//					util.hideLoading();
//					if(resp.code === 0) {
//						console.log(resp);
//					} else {
//						util.showAlert(resp.message || '查询人员列表出错，请稍后重试！');
//					}
//				},
//				error: function(xhr) {
//					// XHR错误
//                  console.log(xhr);
//					util.hideLoading();
//					util.showAlert('查询人员列表出错，请稍后重试！');
//				}
//			});
//		}
		
		/**
		 * 跳转页面
		 */
		function jumpPage() {
			var $el = $(this);
			var page = $el.attr('data-page');
			if(page) {
				// 修改页面后重新刷新页面数据
				currentPage = page;
				searchList();
			}
		}
	


		/**
		 * 初始化页面事件
		 */
		function initPageEvent() {
			that.$container.on('click', '#search', function() {
				searchParams = that.buildSearchParams(that.$('#formPrintWorkload input[data-search]'));
				currentPage = 1;
				searchList();
			});
			// 导入
			that.$container.on('click', '#export', function() {
				searchParams = that.buildSearchParams(that.$('#formPrintWorkload input[data-search]'));
//				searchExport();
				var url = util.getServerBase() + 'printing/downLoadWorkLoad.action?';
                    url += 'loginUserId=' + searchParams.loginUserId;
                    url += '&searchEndDate=' + encodeURIComponent(searchParams.searchEndDate);
                    url += '&searchStartDate=' + encodeURIComponent(searchParams.searchStartDate);
                    window.open(url, '_blank');
			});
			// 分页
			that.$container.on('click', '#personListPaging a', jumpPage);
		}

		/**
		 * 初始化页面数据
		 */
		function initPageData() {
			// 时间组件
            that.$('#datetimeStart').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: 'zh-cn',
                toolbarPlacement: 'bottom'
            });

			that.$('#datetimeEnd').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: 'zh-cn',
                useCurrent: false,
                toolbarPlacement: 'bottom'
            });

            $("#datetimeStart").on("dp.change", function(e) {
                $('#datetimeEnd').data("DateTimePicker").minDate(e.date);
            });
            $("#datetimeEnd").on("dp.change", function(e) {
                $('#datetimeStart').data("DateTimePicker").maxDate(e.date);
            });
		}

		/**
		 * 初始化时被调用
		 */
		this.onInit = function($el, tpl, data, indexRef) {
			this._super($el, tpl, data, indexRef);
			that = this;
			info = data;

			that.initTemplate(tpl, {
				info: data
			});
			// 初始化页面事件
			initPageEvent();
			// 初始化页面数据
			initPageData();
		};

		/**
		 * 页面返回事件
		 * @param data
		 */
		this.onBack = function(data) {
			this._super(data);

		};

		/**
		 * 窗口缩放事件
		 */
		this.onResize = function() {
			this._super();
		};

		/**
		 * 页面销毁
		 */
		this.onDestroy = function() {
			this._super();
		};

	}());

	module.exports = Module;
});