define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');

    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'backup/saveOrSubmitBackup.action',
        // 查询接口
        detailAction: 'backup/searchBackupDetail.action',
        
        /**
         * 初始化字典表
         */
        searchSelect: function() {
			// 国籍
        	util.showLoading();
        	util.sendRequest({
				data: {
					'code': '0033'
				},
				action: 'common/searchCodeValue.action',
				success: function(resp) {
					util.hideLoading();
					if(resp.code === 0) {
						var $authorNationality = this.$('#authorNationality'),
							$dom;
						for(var i in resp.data) {
							if(resp.data.hasOwnProperty(i)) {
								$dom = $('<option></option>');
								$dom.text(resp.data[i]);
								$dom.val(i);
								if(i === this.data.info.authorNationality) {
									$dom.attr('selected', 'selected');
								}
								$authorNationality.append($dom);
							}
						}
						var $copyrightUserNationality = this.$('#copyrightUserNationality'),
							$dom;
						for(var i in resp.data) {
							if(resp.data.hasOwnProperty(i)) {
								$dom = $('<option></option>');
								$dom.text(resp.data[i]);
								$dom.val(i);
								if(i === this.data.info.copyrightUserNationality) {
									$dom.attr('selected', 'selected');
								}
								$copyrightUserNationality.append($dom);
							}
						}
						var $copyrightHolderNationality = this.$('#copyrightHolderNationality'),
							$dom;
						for(var i in resp.data) {
							if(resp.data.hasOwnProperty(i)) {
								$dom = $('<option></option>');
								$dom.text(resp.data[i]);
								$dom.val(i);
								if(i === this.data.info.copyrightHolderNationality) {
									$dom.attr('selected', 'selected');
								}
								$copyrightHolderNationality.append($dom);
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
        	this.$container.on('click', '#printPage', function(){
            	var $el = that.$container.clone();
            	$el.find('.dialog-options').remove();
            	$el.find('.form-horizontal').addClass('print-bg');
            	util.openPage('public/print/print-preview', {content: $el.html(), title: '打印此页'});
            });
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
			// 初始化日期组件
            this.$('input.date-time').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: 'zh-cn',
                sideBySide: true
            });
            // 查询字典表
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
