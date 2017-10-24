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
        // 批量保存/提交接口
        batchSaveAction: 'examine/batchReview.action',
        onHandleChange: function () {
            var handle = this.$('input[name="handleState"]:checked').val();
            this.$('div[data-name = "mwHAuditRedList"]').hide();
            if (handle === '1') {
                // 退改
                this.$('div[data-name = "mwHAuditRedList"]').show();
            } else {
                this.$('div[data-name = "mwHAuditRedList"]').hide();
            }
        },
        
        /**
         * 添加漏改位置
         * */
        onContractPlus: function() {
        	console.log('hello');
        	var contract;
        	contract = this.$('tr[data-area = "page"]').eq(0).clone();
        	contract.find('input').val('');
        	contract.appendTo('tbody[data-wrap = "change"]');
        	// 漏改位置序号
        	this.contractNum();
        	// 判断有几个漏改位置
        	this.searchButtonNum();
        	this.addValidateField(this.$('input[name="auditRedMissPage"]'));
        	this.addValidateField(this.$('input[name="auditRedMissLine"]'));
        },
        
        /**
         * 删除漏改位置
         * */
        onContractMinus: function($tr) {
        	$tr.parents('tr').remove();
        	// 漏改位置序号
        	this.contractNum();
        	// 判断有几个漏改位置
        	this.searchButtonNum();
        },
        
        /**
         * 漏改位置序号
         * */
        contractNum: function() {
        	var i = 1;
        	this.$('tr[data-area="page"]').each(function() {
        		$(this).find('td[data-type = "number"]').text(i++);
        	});
        },
        
        /**
         * 判断有几个漏改位置
         * */
		searchButtonNum: function() {
			var that = this;
			this.$('tbody[data-wrap = "change"]').each(function() {
				var length = $(this).find('tr').length;
				that.$('input[name="missNum"]').val(length);
				if (length !== 1) {
					$(this).find('button[data-type="contract-minus"]').show();
					$(this).find('button[data-type="contract-plus"]').hide();
					$(this).find('button[data-type="contract-plus"]').last().show();
				} else{
					$(this).find('button[data-type="contract-minus"]').hide();
					$(this).find('button[data-type="contract-plus"]').show();
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
			// 处理合同附件数据结构			
			params.mwHAuditRedList = []; // 核红集合
			if (params.handleState === '1') {
			var $tr;
			$form.find('tr[data-area="page"]').each(function() {
				$tr = $(this);
				params.mwHAuditRedList.push({
					auditRedMissPage: $tr.find('input[name="auditRedMissPage"]').val(),
					auditRedMissLine: $tr.find('input[name="auditRedMissLine"]').val(),
					missNum: $form.find('input[name="missNum"]').val()
				});
			});
			}			
			return params;
		},

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
            // 审核结果
            this.$container.on('change', 'input[name="handleState"]', this.onHandleChange.bind(this));
            // 添加漏改位置
    		this.$container.on('click', 'button[data-type="contract-plus"]',this.onContractPlus.bind(this));
    		// 删除漏改位置
    		this.$container.on('click', 'button[data-type="contract-minus"]', function() {
				that.onContractMinus($(this));
			});
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
			this.onHandleChange();
			// 漏改位置序号
        	this.contractNum();
        	// 判断有几个漏改位置
        	this.searchButtonNum();
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
