define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');

    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 保存/提交接口        
        saveAction: 'publishing/submitOrUpdatePrintRequest.action',
        // 批量保存/提交接口
        batchSaveAction: 'publishing/batchPrinting.action',
        // 查询接口
        detailAction: 'publishing/searchPrintRequestDetail.action',
        
        /**
         * 初始化装订方式、封面装订后处理
         */
        searchSelect: function() {
        	// 装订方式
        	util.showLoading();
        	util.sendRequest({
				data: {
					'code': '0025'
				},
				action: 'common/searchCodeValue.action',
				success: function(resp) {
					util.hideLoading();
					if(resp.code === 0) {
						var $typeOneElement = this.$('#bindingStyle'),
							$dom;
						for(var i in resp.data) {
							if(resp.data.hasOwnProperty(i)) {
								$dom = $('<option></option>');
								$dom.text(resp.data[i]);
								$dom.val(i);
								if(i === this.data.info.bindingStyle) {
									$dom.attr('selected', 'selected');
								}
								$typeOneElement.append($dom);
							}
						}
					} else {
						console.log(resp);
						util.showAlert(resp.message || '查询装订方式出错，请稍后重试！');
					}
				}.bind(this),
				error: function(xhr) {
					console.log(xhr);
					util.showAlert(resp.message || '查询装订方式出错，请稍后重试！');
				}
			});
			// 封面装订处理
        	util.showLoading();
        	util.sendRequest({
				data: {
					'code': '0026'
				},
				action: 'common/searchCodeValue.action',
				success: function(resp) {
					util.hideLoading();
					if(resp.code === 0) {
						var $typeOneElement = this.$('#usePaperBinding'),
							$dom;
						for(var i in resp.data) {
							if(resp.data.hasOwnProperty(i)) {
								$dom = $('<option></option>');
								$dom.text(resp.data[i]);
								$dom.val(i);
								if(i === this.data.info.usePaperBinding) {
									$dom.attr('selected', 'selected');
								}
								$typeOneElement.append($dom);
							}
						}
					} else {
						console.log(resp);
						util.showAlert(resp.message || '查询封面装订处理出错，请稍后重试！');
					}
				}.bind(this),
				error: function(xhr) {
					console.log(xhr);
					util.showAlert(resp.message || '查询封面装订处理出错，请稍后重试！');
				}
			});
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
    		
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
			// 初始化日期组件
			this.$('input.date-time').datetimepicker({
				format: 'YYYY-MM',
				locale: 'zh-cn',
				sideBySide: true
			});
			
			this.searchSelect();
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
