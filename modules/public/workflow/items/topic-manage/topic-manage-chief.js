define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');
    var info = [];

    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'topic/saveOrSubmitTopic.action',
        // 查询接口
        detailAction: 'topic/detailTopic.action',

        onHandleChange: function () {
            var handle = this.$('input[name="handleState"]:checked').val();
            this.$('div[data-area="nextFlow"]').hide();
            if (handle === '3') {
                // 待定确认
                this.$('div[data-flow="braillePend"]').show();
            } else if (handle === '4') {
                // 不同意申报
                this.$('div[data-flow="abandoned"]').show();
            } else if (handle === '1') {
                // 同意下发
                this.$('div[data-flow="issued"]').show();
            }
        },
        
        /**
         * 判断下一流程任务人
         */
        onOptionChoose: function() {
        	var handle = this.$('input[name="handleState"]:checked').val();
        	if (info.nextTaskFlowInfoList.length && handle === '1' && info.handleState === '1') {
        		var $flow = this.$('#nextFlow'); 
        		var i = 0;
        		var $empty;
        		$flow.find('tr[data-flow ="nextFlow"]').each(function() {
        			$empty = $(this);
        			var deptIds = info.nextTaskFlowInfoList[i].deptIds;
        			var $option;
        			$empty.find('option').each(function() {
        				$option = $(this);
        				var option = $option.val();
        				if (option === deptIds) {
        					$option.val(option).attr('selected', 'selected');
        				}
        			});
        			i++;
        		});        		
        	}
        },
        
        /**
         * 根据下一流程，选择下一流程任务人
         */
        onFlowSelectChange: function() {
        	var $flow = this.$('#formEdit'); 
        	var $select;
        	$flow.find('tr[data-flow = "nextFlow"]').each(function() {
        		$select = $(this);
        		$select.find('div[data-dept]').hide();
        		$select.find('div[data-dept]').removeClass('choose');
        		var deptIds = $select.find('select').val();
        		$select.find('div[data-dept="'+ deptIds +'"]').show();
        		$select.find('div[data-dept="'+ deptIds +'"]').addClass('choose');
        	});
        },
        
        /**
         * 给下一流程任务人赋值
         */
        onFlowUser : function() {
        	// 同意下发
        	if (info.nextTaskFlowInfoList.length && info.handleState === '1') {
        		var $flow = this.$('#nextFlow'); 
        		var i = 0;
        		var $empty;
        		$flow.find('tr[data-flow ="nextFlow"]').each(function() {
        			$empty = $(this);
        			var name = info.nextTaskFlowInfoList[i].nextFlowTaskUserNames;
        			var id = info.nextTaskFlowInfoList[i].nextFlowTaskUserIds;
        			$empty.find('.choose input[name="taskUsers"]').val(name);
        			$empty.find('.choose input[name="taskUsers"]').attr('data-value', id);
        			$empty.find('.choose input[name="taskUsers"]').attr('title', name);
        			i++;
        		});        		
        	}
        	// 待定确认
        	if (info.nextTaskFlowInfoList.length && info.handleState === '3') {
        		var name = info.nextTaskFlowInfoList[0].nextFlowTaskUserNames;
        		var id = info.nextTaskFlowInfoList[0].nextFlowTaskUserIds;
        		var $flow = this.$('div[data-flow="braillePend"]');
        		$flow.find('input[name="taskUsers"]').val(name);
        		$flow.find('input[name="taskUsers"]').attr('data-value', id);
        		$flow.find('input[name="taskUsers"]').attr('title', name);
        	}
        },
        
        /**
         * 保存或提交工作流
         */
        getFormData: function() {
        	var $form = this.$('#formEdit');
			// 先调用父类生成基本的数据结构
			var params = this._super();
			params.nextFlowInfoList = []; //下一流程集合
			var $tr;
			$form.find('tr[data-flow="nextFlow"]').each(function() {
				$tr = $(this);
				console.log($tr);
				params.nextFlowInfoList.push({
					bookTypeCode: $tr.find('input[name="bookTypeCode"]').val(),
					flowId: $tr.find('.choose input[name="flowId"]').val(),
					taskUsers: $tr.find('.choose input[name="taskUsers"]').attr('data-value'),
					flowName: $tr.find('.choose input[name="flowName"]').val(),
					nextCategory: $tr.find('.choose input[name="nextCategory"]').val(),
					deptIds: $tr.find('.choose input[name="deptIds"]').val(),
					roleIds: $tr.find('.choose input[name="roleIds"]').val()
				})
			});
			return params;
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
            // 审核结果
            this.$container.on('change', 'input[name="handleState"]', this.onHandleChange.bind(this));
            // 判断下一流程任务人
            this.$container.on('change', 'select[name="nextFlow"]', this.onFlowSelectChange.bind(this));
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
        	this.onOptionChoose();
            this.onFlowSelectChange();
            this.onFlowUser();
            this.onHandleChange();
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
