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
		
		/**
		 * 处理意见判断
		 */
		onHandleChange: function() {
			var handle = this.$('input[name="handleState"]:checked').val();
			this.$('div[data-area="nextFlow"]').hide();
			if(handle === '1') {
				// 建议发稿
				this.$('div[data-flow="cn_finallRewrite"]').show();
			} else {
				// 退稿
				this.$('div[data-flow="cn_first"]').show();
			}
		},
		
		/**
		 * 终审报告预览
		 */
		onPreview: function() {
			var $form = this.$('#formEdit');
			var params = {};
			params.bookId = $form.find('input[name="bookId"]').val();
			params.taskId = $form.find('input[name="taskId"]').val();
			params.currentFlowName = '终审';
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
		 * 终审报告 下载
		 */
		onReportDown: function() {
			var $form = this.$('#formEdit');
			var params = {};
			params.bookId = $form.find('input[name="bookId"]').val();
			params.taskId = $form.find('input[name="taskId"]').val();
			params.currentFlowName = '终审';
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
		 * 初始化页面事件
		 */
		initPageEvent: function() {
			var that = this;
			// 处理意见
			this.$container.on('change', 'input[name="handleState"]', this.onHandleChange.bind(this));
			// 终审报告预览
			this.$container.on('click','button[data-down="preview"]',this.onPreview.bind(this));
			// 终审报告下载
			this.$container.on('click','button[data-down="down"]',this.onReportDown.bind(this));
		},

		/**
		 * 初始化页面数据
		 */
        initPageData: function () {
        	// 处理意见
			this.onHandleChange();
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