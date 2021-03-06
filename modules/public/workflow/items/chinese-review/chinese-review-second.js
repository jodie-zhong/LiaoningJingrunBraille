define(function(require, exports, module) {
	"use strict";

	var ItemBase = require('../item-base');
	var util = require('../../../../../common/util.js');

	/**
	 * Workflow Item
	 */
	var Item = ItemBase.extend({
		// 保存/提交接口
		saveAction: 'cnExamine/saveOrSubmitCnExamine.action',
		// 查询接口
		detailAction: 'cnExamine/searchCnExamineDetail.action',

		// 加工记录添加
		onMachPlus: function() {
			var machCopy;
			machCopy = this.$('div[data-area = "machining"]').eq(0).clone();
			machCopy.find('textarea').val('');
			machCopy.find('.len').text('0/256');
			machCopy.appendTo('div[data-type = "mach-record"]');
			this.searchMinusButton();
			// 加工记录序号
			this.machNum();
			this.addValidateField(this.$('textarea[name="machiningRecord"]'));
		},
		// 加工记录删除
		onMachMinus: function($btn) {
			$btn.parents('div[data-area = "machining"]').remove();
			this.searchMinusButton();
			// 加工记录序号
			this.machNum();
		},

		// 判断加工记录有几条数据
		searchMinusButton: function() {
			var machLength = this.$('div[data-area = "machining"]').length;
			if(machLength !== 1) {
				this.$('button[data-type="record-minus"]').show();
				this.$('button[data-type="record-plus"]').hide();
				this.$('button[data-type="record-plus"]').last().show();
			} else {
				this.$('button[data-type="record-minus"]').hide();
				this.$('button[data-type="record-plus"]').show();
			}
		},

		/**
		 * 加工记录序号
		 */
		machNum: function() {
			var i = 1;
			this.$('div[data-area="machining"]').each(function() {
				$(this).find('span[data-value = "number"]').text(i++);
			});
		},
		/**
		 * 复审处理意见
		 */
		onHandleChange: function() {
			var handle = this.$('input[name="handleState"]:checked').val();
			this.$('div[data-area="nextFlow"]').hide();
			if(handle === '1') {
				// 同意
				this.$('div[data-flow="cn_secondRewrite"]').show();
				this.$('div[data-flow="cn_reSecond"]').show();
			} else {
				// 退编辑
				this.$('div[data-flow="cn_first"]').show();
			}
		},
		
		/**
		 * 复审报告预览
		 */
		onPreview: function() {
			var $form = this.$('#formEdit');
			var params = {};
			params.bookId = $form.find('input[name="bookId"]').val();
			params.taskId = $form.find('input[name="taskId"]').val();
			params.currentFlowName = '复审';
			params.preliminaryOpinion = $form.find('textarea[name="handleContentOne"]').val();
			params.machiningRecordList = []; // 加工记录
			var $div;
			$form.find('div[data-area="machining"]').each(function() {
				$div = $(this);
				var record = $div.find('textarea[name="machiningRecord"]').val();
				if (record) {
					params.machiningRecordList.push({
						machiningRecord: $div.find('textarea[name="machiningRecord"]').val()
					});					
				}
			});
			util.showLoading();
			util.sendRequest({
				type: 'POST',
				action: 'cnExamine/cnBuildWord.action',
				data: params,
				success: function(resp) {
					util.hideLoading();
					if (resp.code === 0) {
						util.openPage('public/preview/html-preview', {
							url: util.getServerBase() + resp.data.htmlPath
						});
					} else {
						console.log(resp);
						util.showAlert(resp.message);
					}
				},
				error: function(xhr) {
					console.log(xhr);
					util.showAlert(resp.message);
				}
			});
		},
		
		/**
		 * 复审报告 下载
		 */
		onReportDown: function() {
			var $form = this.$('#formEdit');
			var params = {};
			params.bookId = $form.find('input[name="bookId"]').val();
			params.taskId = $form.find('input[name="taskId"]').val();
			params.currentFlowName = '复审';
			params.preliminaryOpinion = $form.find('textarea[name="handleContentOne"]').val();
			params.machiningRecordList = []; // 加工记录
			var $div;
			$form.find('div[data-area="machining"]').each(function() {
				$div = $(this);
				var record = $div.find('textarea[name="machiningRecord"]').val();
				if (record) {
					params.machiningRecordList.push({
						machiningRecord: $div.find('textarea[name="machiningRecord"]').val()
					});					
				}
			});
			util.showLoading();
			util.sendRequest({
				type: 'POST',
				action: 'cnExamine/cnBuildWord.action',
				data: params,
				success: function(resp) {
					util.hideLoading();
					if (resp.code === 0) {
						window.open(util.getServerBase() + 'common/downloadFile.action?path=' + encodeURIComponent(resp.data.wordPath), '_blank');
					} else {
						console.log(resp);
						util.showAlert(resp.message);
					}
				},
				error: function(xhr) {
					console.log(xhr);
					util.showAlert(resp.message);
				}
			});
		},

		/**
		 * 保存或提交工作流
		 */
		getFormData: function() {
			var $form = this.$('#formEdit');
			// 先调用父类生成基本的数据结构
			var params = this._super();
			params.machiningRecordList = []; // 加工记录
			var $div;
			$form.find('div[data-area="machining"]').each(function() {
				$div = $(this);
				var record = $div.find('textarea[name="machiningRecord"]').val();
				if (record) {
					params.machiningRecordList.push({
						machiningRecord: $div.find('textarea[name="machiningRecord"]').val()
					});
				}
			});
			return params;
		},

		/**
		 * 初始化页面事件
		 */
		initPageEvent: function() {
			var that = this;
			// 加工记录
			this.$container.on('click', 'button[data-type="record-plus"]', this.onMachPlus.bind(this));
			this.$container.on('click', 'button[data-type="record-minus"]', function() {
				that.onMachMinus($(this));
			});
			// 复审处理意见
			this.$container.on('change', 'input[name="handleState"]', this.onHandleChange.bind(this));
			// 复审报告预览
			this.$container.on('click','button[data-down="preview"]',this.onPreview.bind(this));
			// 复审报告下载
			this.$container.on('click','button[data-down="down"]',this.onReportDown.bind(this));
		},

		/**
		 * 初始化页面数据
		 */
		initPageData: function() {
			// 复审处理意见
			this.onHandleChange();
			this.searchMinusButton();
			// 加工记录序号
			this.machNum();
		},

		/**
		 * 构造函数
		 * @param container
		 * @param tpl
		 */
		init: function(container, tpl) {
			this._super(container, tpl);
		},

		/**
		 * 渲染页面
		 */
		render: function() {
			this._super();

			this.initPageEvent();

			this.initPageData();
		}

	});

	module.exports = Item;

});