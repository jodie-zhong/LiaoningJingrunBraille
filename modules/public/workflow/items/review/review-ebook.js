define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');

    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'examine/saveOrSubmitExamine.action',
        // 查询接口
        detailAction: 'examine/searchExamineDetail.action',

        /**
         * 保存或提交工作流
         * @param isSubmit
         */
        getFormData: function() {
        	var $form = this.$('#formEdit');
        	// 先调用父类生成基本的数据结构
//      	var params = {};
        	var params = this._super();
        	// 处理上传部份数据结构
        	params.coverList = []; // 电子书稿
        	var $div;
        	$form.find('div[data-type="ebook"]').each(function(){
        		$div = $(this);
        		params.coverList.push({
        			bookFileType:$div.find('input[name="bookFileType"]').val(),
        			bookFileTypeName: $div.find('input[name="bookFileTypeName"]').val(),
        			bookFileName: $div.find('input[data-name="bookFileName"]').val(),
        			bookFileAddress:$div.find('input[data-name="bookFileName"]').attr('data-value')
        		});
        	});
        	console.log(params);
        	return params;
        },
        
        
        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
        	var that = this;
        	this.$container.on('change','input[data-name="bookFileName"]', function() {
        		var address = $(this).attr('data-value');
        		if (address) {
        			$(this).parents('div.row').find('button[data-type = "down"]').removeAttr('disabled');
        		} else {
        			$(this).parents('div.row').find('button[data-type = "down"]').attr('disabled', 'disabled');
        		}
        	});
        	// 处理状态下附件下载
        	this.$container.on('click','button[data-type = "down"]',function () {
        		var flie = $(this).parents('div.row').find('input[data-name="bookFileName"]').attr('data-value');
        		if (flie) {
        			window.open(util.getServerBase() + 'common/downloadFile.action?path=' + encodeURIComponent(flie), '_blank');
        		}
        	});
        	// 查看状态下附件下载
            this.$container.on('click','button[data-type = "download"]',function () {
                if($(this).attr('data-address')){
                    window.open(util.getServerBase() + 'common/downloadFile.action?path=' + encodeURIComponent($(this).attr('data-address')), '_blank');
                }
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
