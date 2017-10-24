define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');

    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'contract/saveOrSubmitContract.action',
        // 查询接口
        detailAction: 'contract/searchContractFlowDetail.action',
        
        onHandleChange: function () {
            var handle = this.$('input[name="handleState"]:checked').val();
            this.$('div[data-area="nextFlow"]').hide();
            if (handle === '1') {
                // 同意 上传法律评估报告
                this.$('div[data-flow="cn_uploadLegalReport"]').show();
            } else {
                this.$('div[data-flow="cn_contractEntry"]').show();
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
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
            // 审核结果
            this.$container.on('change', 'input[name="handleState"]', this.onHandleChange.bind(this));
    		// 下载合同附件
    		that.$container.on('click','button[data-down="down"]', function() {
				var fil = $(this).attr('data-address');
				if(fil) {
					window.open(util.getServerBase() + 'common/downloadFile.action?path=' + encodeURIComponent(fil), '_blank');
				}
			});
			// 查看 文件预览
			this.$container.on('click', 'button[data-down="view"]', function() {
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
