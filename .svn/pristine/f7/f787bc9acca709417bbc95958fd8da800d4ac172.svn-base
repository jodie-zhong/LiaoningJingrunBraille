define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');

    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 保存/提交接口
//      saveAction: '',
        saveAction: 'contract/saveOrSubmitContract.action',
        // 查询接口
        detailAction: 'contract/searchContractFlowDetail.action',
		
		/**
		 *  处理 预览
		 */
		onPresee: function($btn) {
			var html = $btn.parents('tr[data-area = "contrat"]').find('input[name="contractFileName"]').attr('data-value') || $btn.parents('div[data-area = "law"]').find('input[name="contractFileName"]').attr('data-value');
			if (html) {
				util.showLoading();
				util.sendRequest({
					action: 'common/coverPreview.action',
					data: {filePath:html},
					success: function(resp) {
						util.hideLoading();
						if (resp.code === 0) {
							// 预览
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
				})
			}
		},
		
		/**
		 * 查看 预览
		 */
		onPreview: function($btn) {
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
				})
			}
		},
		
		/**
		 * 保存或提交工作流
		 * @param isSubmit
		 */
		getFormData: function() {
			var $form = this.$('#formEdit');
			// 先调用父类生成基本的数据结构
			var params = this._super();
			// 处理合同附件数据结构
			params.contractFileList = []; // 合同附件
			params.contractFileList.push({
				contractFileTypeCode: $form.find('input[data-name="lawNum"]').val(),
				contractFileName: $form.find('input[data-name="law"]').val(),
				contractFilePath: $form.find('input[data-name="law"]').attr('data-value')
			});
			return params;
		},
		
        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;// 合同附件 下载按钮是否可用
			this.$container.on('change', 'input[name="contractFileName"]', function() {
				var address = $(this).attr('data-value');
				if (address) {
					$(this).parents('div[data-area = "law"]').find('button[data-down="view"]').removeAttr('disabled');
					$(this).parents('div[data-area = "law"]').find('button[data-down="downView"]').removeAttr('disabled');
				} else{
					$(this).parents('div[data-area = "law"').find('button[data-down="view"]').attr('disabled', 'disabled');
					$(this).parents('div[data-area = "law"]').find('button[data-down="downView"]').attr('disabled', 'disabled');
				}
			});
			// 法律评估报告 下载按钮是否可用
    		// 下载合同附件
    		that.$container.on('click','button[data-down="downView"]', function() {
				var flie = $(this).parents('tr[data-area="contrat"]').find('input[name="contractFileName"]').attr('data-value') || $(this).parents('div[data-area="law"]').find('input[name="contractFileName"]').attr('data-value');
				if (flie) {
					window.open(util.getServerBase() + 'common/downloadFile.action?path=' + encodeURIComponent(flie), '_blank');
				}
			});
			// 查看状态下下载合同附件
			that.$container.on('click', 'button[data-down="View"]', function() {
				var fil = $(this).attr('data-address');
				if(fil) {
					window.open(util.getServerBase() + 'common/downloadFile.action?path=' + encodeURIComponent(fil), '_blank');
				}
			});
			// 处理 预览
			this.$container.on('click', 'button[data-down="view"]', function() {
				that.onPresee($(this));
			});
			// 查看 预览
			this.$container.on('click', 'button[data-down="htmlView"]', function() {
				that.onPreview($(this));
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
