define(function (require, exports, module) {
	"use strict";

	var ItemBase = require('../../public/workflow/items/item-base');
	var util = require('../../../common/util.js');

	/**
	 * Workflow Item
	 */
	var Item = ItemBase.extend({

		// 查询接口
		detailAction: 'bookLibrary/searchHistoryFileDetail.action',


		/**
		 * 初始化页面事件
		 */
		initPageEvent: function () {
			// 文件下载
			this.$container.on('click','.btn-download',function () {
				var $el=$(this);
				if($el.attr('data-download')){
					var str=$el.parents('tr').find('.bookFileName').text();
					if(str.indexOf('.') > 0){ //表明含有格式后缀
						str=str.split('.')[0];
					}
					window.open(util.getServerBase() + 'common/downloadFile.action?path=' + encodeURIComponent($el.attr('data-download')) + '&bookFileName=' + encodeURIComponent(str), '_blank');
				}
			});
			// 文件预览
			this.$container.on('click','.btn-preview',function () {
				var $el=$(this);
				// 在此区分是不是.png格式的文件，是.png直接放到ifram里，不用向后台发请求，转成html的
				var $preview=$el.attr('data-preview');
				if($preview.slice(-4)==='.png' || $preview.slice(-4)==='.jpg' || $preview.slice(-5)==='.jpeg'){
					// 预览
					util.openPage('public/preview/html-preview', {
						url: util.getServerBase() + $el.attr('data-preview')
					});
				} else {
					util.showLoading();
					util.sendRequest({
						data: {filePath:$el.attr('data-preview')},
						action: 'common/coverPreview.action',
						success: function(resp) {
							util.hideLoading();
							if(resp.code === 0) {
								// 预览
								util.openPage('public/preview/html-preview', {
									url: util.getServerBase() + resp.data
								});
							} else {
								console.log(resp);
								util.showAlert(resp.message || '预览出错，请稍后重试！');
							}
						},
						error: function(xhr) {
							// XHR错误
							util.hideLoading();
							util.showAlert('预览出错，请稍后重试！');
						}
					});
				}
			});
		},

		/**
		 * 初始化页面数据
		 */
		initPageData: function () {
		},

		/**
		 * 构造函数
		 * @param container
		 * @param tpl
		 */
		init: function (container, tpl) {
			this._super(container, tpl);

		},
		/**
		 * 渲染页面
		 */
		render: function () {
			this._super();

			this.initPageEvent();

			this.initPageData();
		}

	});


	module.exports = Item;

});
