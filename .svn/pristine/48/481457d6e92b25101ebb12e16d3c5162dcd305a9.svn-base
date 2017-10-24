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

        onHandleChange: function () {
            var handle = this.$('input[name="topicSelectProperty"]:checked').val();
            this.$('div[data-area="import"]').hide();
            this.$('div[data-area="cite"]').hide();
            if (handle === '2') {
                // 重大选题备案
                this.$('div[data-area="import"]').show();
            } else if (handle === '3') {
            	// 引用选题备案
                this.$('div[data-area="cite"]').show();
            }
        },
        
        /**
         * 初始化字典表
         */
        searchSelect: function() {
        	// 涉及重大选题类别
        	util.showLoading();
        	util.sendRequest({
				data: {
					'code': '0032'
				},
				action: 'common/searchCodeValue.action',
				success: function(resp) {
					util.hideLoading();
					if(resp.code === 0) {
						var $typeOneElement = this.$('#topicImportantFileType'),
							$dom;
						for(var i in resp.data) {
							if(resp.data.hasOwnProperty(i)) {
								$dom = $('<option></option>');
								$dom.text(resp.data[i]);
								$dom.val(i);
								if(i === this.data.info.topicImportantFileType) {
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
            // 选题备案类型
            this.$container.on('change', 'input[name="topicSelectProperty"]', this.onHandleChange.bind(this));
            
            // this.$container.on('change', 'input[name="topicId"]', function(){
            // 	var name = $(this).val();
            // 	$('input[name="topicImportantFileName"]').val(name);
            // 	$('input[name="bookName"]').val(name);
            // });
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
            
			this.onHandleChange();
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
        back: function (data) {
            if (data && (data.nameCreate || data.author)) {
                console.log(data);
                var author = data.author;
                var nameCreate=data.nameCreate;
                var idCreate=data.idCreate;
                $('input[name="executiveEditor"]').val(author);
                $('input[name="topicId"]').val(nameCreate);
                $('input[name="topicId"]').attr('data-value',idCreate);
                $('input[name="topicImportantFileName"]').val(nameCreate);
                $('input[name="bookName"]').val(nameCreate);
            }
            // 将title值设置为返回的数据
            if(data && data.name){
                this.$('input[name="taskUsers"]').attr('title', data.name);
            }
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
