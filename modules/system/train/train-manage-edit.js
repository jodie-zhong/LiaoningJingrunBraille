define(function(require, exports, module) {
	"use strict";

	var util = require('../../../common/util');
	var DialogBase = require('../../../common/base-dialog');
	// 日期组件
	require('../../../assets/plugins/bootstrap-datetimepicker/js/bootstrap-datatimepicker');
	require('../../../assets/plugins/bootstrap-datetimepicker/js/moment-with-locales');
	require('../../../assets/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css');

	var Module = DialogBase.extend(new function() {
		var that;
		var info = null;

		/**
		 * 搜索培训形式
		 */
		function searchTrainFrom() {
			util.sendRequest({
				data: {
					'code': '0005'
				},
				action: 'common/searchCodeValue.action',
				success: function(resp) {
					if(resp.code === 0) {
						var $select = that.$('#selTrainOptionName');
						var $option;
						for(var i in resp.data) {
							if(resp.data.hasOwnProperty(i)) {
								$option = $('<option></option>');
								$option.text(resp.data[i]);
								$option.attr('value', i);
								$select.append($option);
							}

						}
						$select.val(info.trainForm);
					} else {
						console.log(resp);
					}
				},
				error: function(xhr) {
					// XHR错误
					console.log(xhr);
				}
			});
		}
		/**
		 * 保存数据
		 */
		function saveTrainInfo() {
			// 表单验证
			var $form = that.$('#formTrainEdit');

			// 没有错误开始处理
			if(that.validate($form) === true) {
				// 通过公共方法生成表单参数
				var params = that.buildFormParams($form.find('input, select,textarea'));
				var action = 'train/createTrain.action';
				var actionName = '新增';
				if(info && info.trainId) {
					action = 'train/modifyTrain.action';
					params.trainId = info.trainId;
					actionName = '修改';
				}
				// 下发请求
				util.showLoading();
				util.sendRequest({
					type: 'POST',
					data: params,
					action: action,
					success: function(resp) {
						util.hideLoading();
						if(resp.code === 0) {
							util.showAlert('数据保存成功!', function() {
								that.close({
									refresh: true
								});
							});
						} else {
							// 业务执行失败
							util.showAlert(resp.message || actionName + '培训列表出错，请稍后重试！');
						}
					},
					error: function(xhr) {
						// XHR错误
						util.hideLoading();
						console.log(xhr);
						util.showAlert(actionName + '培训列表出错，请稍后重试！');
					}
				});
			}
		}

		/**
		 * 初始化页面事件
		 */
		function initPageEvent() {

			// 保存
			that.$container.on('click', '#btnTrainSave', saveTrainInfo);
		}

		/**
		 * 初始化页面数据
		 */
		function initPageData() {
			// 直接从前一个页面传送数据，所以此处不需要查询数据
			that.$('input.date-time').datetimepicker({
				format: 'YYYY-MM-DD HH:mm:ss',
				locale: 'zh-cn',
				sideBySide: true,
				showClose: true,
				showClear: true,
				toolbarPlacement: 'bottom'
			});

			that.initValidate(that.$('#formTrainEdit'));
			// 搜索培训形式
			searchTrainFrom();

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