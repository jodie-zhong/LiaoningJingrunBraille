define(function(require, exports, module) {
	"use strict";

	var ItemBase = require('../item-base');
	var util = require('../../../../../common/util.js');
	var info = [];

	/**
	 * Workflow Item
	 */
	var Item = ItemBase.extend({
		// 保存/提交接口
//		saveAction: '',
		saveAction: 'printing/modifyPrinting.action',
		// 查询接口
		detailAction: 'printing/searchPrintingDetail.action',
		
		flowId: '',
		flowName : '',
		
		/**
		 * 下一工序选择
		 */
		onNextProcedure: function() {
			var that = this;
			if (info.listPrintingFlow) {				
				for(var i = 0; i< info.listPrintingFlow.length;i++){
					this.$('div[data-type = "procedure"]').find('input[data-flowId="'+info.listPrintingFlow[i].flowId+'"]').attr('checked','checked');
				}				
			}
			this.onCheckRowChanged();
		},
		
		/**
		 * 下一工序之间的联系
		 * 选择裁边，必须选刻印；刻印与制版、平印与轮转只能二选一；选择平印或轮转必选制版；
		 */
		// 刻印
		onCheckEngraving: function() {
			var that = this;
			var $input = this.$('input[data-flowId="engraving"]');
			if ($input.prop('checked')) {
				that.$('input[data-flowId="plate"],input[data-flowId="flatPrint"],input[data-flowId="roundRobin"]').removeAttr('checked');
				this.onCheckRowChanged();
			}
			if ($input.prop('checked') === false) {
				that.$('input[data-flowId="cuttingEdge"]').removeAttr('checked');
				this.onCheckRowChanged();
			}
		},
		// 裁边
		onCheckCuttingEdge: function() {
			var that = this;
			var $input = this.$('input[data-flowId="cuttingEdge"]');
			if ($input.prop('checked')) {
				that.$('input[data-flowId="engraving"]').attr('checked','checked');
				that.$('input[data-flowId="plate"],input[data-flowId="flatPrint"],input[data-flowId="roundRobin"]').removeAttr('checked');
				this.onCheckRowChanged();
			}
		},
		// 制版
		onCheckPlate: function() {
			var that = this;
			var $input = this.$('input[data-flowId="plate"]');
			if ($input.prop('checked')) {
				that.$('input[data-flowId="engraving"],input[data-flowId="cuttingEdge"]').removeAttr('checked');
				this.onCheckRowChanged();
			}
			if ($input.prop('checked') === false) {
				that.$('input[data-flowId="flatPrint"],input[data-flowId="roundRobin"]').removeAttr('checked');
				this.onCheckRowChanged();
			}
		},
		// 平印
		onCheckFlatPrint: function() {
			var that = this;
			var $input = this.$('input[data-flowId="flatPrint"]');
			if ($input.prop('checked')) {
				that.$('input[data-flowId="engraving"],input[data-flowId="cuttingEdge"],input[data-flowId="roundRobin"]').removeAttr('checked');
				that.$('input[data-flowId="plate"]').attr('checked','checked');
				this.onCheckRowChanged();
			}
		},
		// 轮转
		onCheckRoundRobin: function() {
			var that = this;
			var $input = this.$('input[data-flowId="roundRobin"]');
			if ($input.prop('checked')) {
				that.$('input[data-flowId="engraving"],input[data-flowId="cuttingEdge"],input[data-flowId="flatPrint"]').removeAttr('checked');
				that.$('input[data-flowId="plate"]').attr('checked','checked');
				this.onCheckRowChanged();
			}
		},
		
		/**
		 * 下一工序选择
		 */
		onCheckRowChanged: function() {
			var count = 0;
			var flowId; 
			var that = this;
			this.$('div[data-type = "procedure"] label').each(function(){				
				var $check = $(this).find('input');	
				if ($check.prop('checked')) {
					count++;
					if (count === 1) {
						flowId = $check.attr('data-flowId');						
					}					
				}
				if (count === 0) {
					that.$('div[data-area="nextFlow"]').hide();
					that.$('div[data-flow="printingConfirm"]').show();
				} else{
					that.$('div[data-area="nextFlow"]').hide();
					that.$('div[data-flow="'+ flowId +'"]').show();
				}
				
			});
			// 封面设计判断
			this.onHandleChange();
		},
		
		/**
		 * 封面设计判断
		 */
		onHandleChange: function () {
            var deptChoose = this.$('input[name="deptChoose"]:checked').val();
            if (deptChoose === '1') {
                // 盲文印制部
                this.flowId = 'braillePrintDeptDesignLeaderIssued';
                this.flowName = '盲文印制部部门负责人下发';
                this.$('div[data-flow="braillePrintDeptDesignLeaderIssued"]').show();
                this.$('div[data-flow="publicationDeptDesignHeadIssued"]').hide();
            }
            if (deptChoose === '2') {
                // 出版部
                this.flowId = 'publicationDeptDesignHeadIssued';
                this.flowName = '出版部设计组长下发';
                this.$('div[data-flow="braillePrintDeptDesignLeaderIssued"]').hide();
                this.$('div[data-flow="publicationDeptDesignHeadIssued"]').show();
            }
        },

		/**
		 * 保存或提交工作流
		 */
		getFormData: function() {
			var $form = this.$('#formEdit');
			// 先调用父类生成基本的数据结构
			var params = this._super();
			// 处理上传部份数据结构
			params.listPrintingFlow = [];
			var $check;
			var bookId;
			$form.find('.checkbox-inline').each(function(){
				$check = $(this).find('input');
				bookId = $check.attr('data-bookId');
				if ($check.prop('checked')) {					
					params.listPrintingFlow.push({
						bookId: $check.attr('data-bookId'),
						flowId: $check.attr('data-flowId'),
						flowName: $check.attr('data-flowName'),
						isUse: $check.val()
					});
				}
			});
			params.listPrintingFlow.push({
				bookId: bookId,
				flowId: 'printingConfirm',
				flowName: '印刷流程确认',
				isUse: '1'
			});
			params.listPrintingFlow.push({
				bookId: bookId,
				flowId: this.flowId,
				flowName: this.flowName,
				isUse: '1'
			});
			params.listNext = [];
			var $flow;
			$form.find('div[data-area="nextFlow"]').each(function() {
				$flow = $(this);
				if($(this).is(':hidden')) {
					return;
				} else {
					params.listNext.push({
						flowId: $flow.find('input[name="flowId"]').val(),
						flowName: $flow.find('input[name="flowName"]').val(),
						nextCategory: $flow.find('input[name="nextCategory"]').val(),
						deptIds: $flow.find('input[name="deptIds"]').val(),
						roleIds: $flow.find('input[name="roleIds"]').val(),
						taskId: $flow.find('input[name="taskId"]').val(),
						taskUsers: $flow.find('input[name="taskUsers"]').attr('data-value')
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
			this.$container.on('change', 'input[type="radio"]', this.onHandleChange.bind(this));
			// 刻印
			this.$container.on('change', 'input[data-flowId="engraving"]', this.onCheckEngraving.bind(this));
			// 裁边
			this.$container.on('change', 'input[data-flowId="cuttingEdge"]', this.onCheckCuttingEdge.bind(this));
			// 制版
			this.$container.on('change', 'input[data-flowId="plate"]', this.onCheckPlate.bind(this));
			// 平印
			this.$container.on('change', 'input[data-flowId="flatPrint"]', this.onCheckFlatPrint.bind(this));
			// 轮转
			this.$container.on('change', 'input[data-flowId="roundRobin"]', this.onCheckRoundRobin.bind(this));
			// 下一流程显示
			this.$container.on('change', 'input[name="isUse"]', this.onCheckRowChanged.bind(this));
		},

		/**
		 * 初始化页面数据
		 */
		initPageData: function() {
			// 下一工序选择
			this.onNextProcedure();
			// 封面设计判断
			this.onHandleChange();
			// 下一流程显示
			this.onCheckRowChanged();
		},
		
		/**
         * 设置表单数据
         * @param data
         */
        setData: function (data) {
            info = data.info;
            this._super(data);
            
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