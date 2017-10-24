define(function (require, exports, module) {
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

        onHandleChange: function () {
            var handle = this.$('input[name="isProofing"]:checked').val();
            this.$('div[data-type = "proofingNum"]').hide();
            if (handle === '1') {
                // 同意发稿
                this.$('div[data-type = "proofingNum"]').hide();
            } else {
                this.$('div[data-type = "proofingNum"]').show();
            }
        },
        
        /**
		 *  处理 预览
		 */
		onPresee: function($btn) {
			var html = $btn.parents('tr[data-area = "page"]').find('input[name="hBookFileName"]').attr('data-value');
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
		 */
		getFormData: function() {
			var $form = this.$('#formEdit');
			// 先调用父类生成基本的数据结构
			var params = this._super();
			// 处理合同附件数据结构mwHAuditRedList
			params.mwHBookFileList = []; // 核红集合
			var $tr;
			$form.find('tr[data-area="page"]').each(function() {
				$tr = $(this);
				params.mwHBookFileList.push({
					bookFascicleId: $tr.find('input[name="bookFascicleId"]').val(),
					hBookFileName: $tr.find('input[name="hBookFileName"]').val(),
					hTaskPageNum: $tr.find('input[name="hTaskPageNum"]').val(),
					hBookFileAddress: $tr.find('input[name="hBookFileName"]').attr('data-value')
				});
			});
			params.flowId = this.$('div[data-flow="cn_applyCIP"]').find('input[name="flowId"]').val();
			params.flowName = this.$('div[data-flow="cn_applyCIP"]').find('input[name="flowName"]').val();
			params.nextCategory = this.$('div[data-flow="cn_applyCIP"]').find('input[name="nextCategory"]').val();
			params.deptIds = this.$('div[data-flow="cn_applyCIP"]').find('input[name="deptIds"]').val();
			params.roleIds = this.$('div[data-flow="cn_applyCIP"]').find('input[name="roleIds"]').val();
			params.taskId = this.$('div[data-flow="cn_applyCIP"]').find('input[name="taskId"]').val();
			params.taskUsers = this.$('div[data-flow="cn_applyCIP"]').find('input[name="taskUsers"]').attr('data-value');
			params.parallelTaskUsers = this.$('div[data-flow="cn_writePrint"]').find('input[name="taskUsers"]').attr('data-value');
			return params;
		},

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
            // 处理 下载、预览按钮控制
            this.$container.on('change','input[name="hBookFileName"]', function() {
            	var address = $(this).attr('data-value');
            	if (address) {
					$(this).parents('tr').find('button[data-down="down"]').removeAttr('disabled');
					$(this).parents('tr').find('button[data-down="view"]').removeAttr('disabled');
				} else{
					$(this).parents('tr').find('button[data-down="down"]').attr('disabled', 'disabled');
					$(this).parents('tr').find('button[data-down="view"]').attr('disabled', 'disabled');
				}
            });
            // 审核结果
            this.$container.on('change', 'input[name="isProofing"]', this.onHandleChange.bind(this));
            // 处理 文件下载
            that.$container.on('click','button[data-down="down"]', function() {
            	var fil = $(this).parents('tr[data-area="page"]').find('input[name="hBookFileName"]').attr('data-value');
            	if (fil) {
					window.open(util.getServerBase() + 'common/downloadFile.action?path=' + encodeURIComponent(fil), '_blank');
				}
            });
            // 查看 文件下载
            that.$container.on('click', 'button[data-down="downView"]', function() {
				var fil = $(this).attr('data-address');
				if(fil) {
					window.open(util.getServerBase() + 'common/downloadFile.action?path=' + encodeURIComponent(fil), '_blank');
				}
			});
            // 处理 文件预览
            this.$container.on('click', 'button[data-down="view"]', function() {
				that.onPresee($(this));
			});
			// 查看 文件预览
			this.$container.on('click', 'button[data-down="htmlView"]', function() {
				that.onPreview($(this));
			});
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
			this.onHandleChange();
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
