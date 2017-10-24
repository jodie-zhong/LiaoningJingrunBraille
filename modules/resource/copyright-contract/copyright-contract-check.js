define(function(require, exports, module) {
	"use strict";

	var util = require('../../../common/util');
	var DialogBase = require('../../../common/base-dialog');

	var Module = DialogBase.extend(new function() {
		var that;
		var info = null;
		
		/**
		 * 预览查看
		 */
		function onPreview($btn) {
			var html = $btn.attr('data-address');
			if (html) {
				util.showLoading();
				util.sendRequest({
					action: 'common/coverPreview.action',
					data: {filePath:html},
					success: function(resp) {
						util.hideLoading();
						if (resp.code === 0) {
							util.openPage('public/preview/html-preview', {
								url: util.getServerBase() + resp.data
							});
						} else{
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
		}

		/**
		 * 初始化页面事件
		 */
		function initPageEvent() {
			// 文件下载
			that.$container.on('click','button[data-type = "down"]', function() {
				var fil = $(this).attr('data-address');
				if($(this).attr('data-address')) {
					window.open(util.getServerBase() + 'common/downloadFile.action?path=' + encodeURIComponent($(this).attr('data-address')), '_blank');
				}
			});
			// 文件预览
			that.$container.on('click','button[data-type="review"]', function() {
				onPreview($(this));
			});
		}

		/**
		 * 初始化页面数据
		 */
		function initPageData() {
			
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