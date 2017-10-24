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
		saveAction: 'cnExamine/saveOrSubmitCnExamine.action',
		// 查询接口
		detailAction: 'cnExamine/searchCnExamineDetail.action',
		
		/**
		 * 保存或提交工作流
		 */
		getFormData: function() {
			var $form = this.$('#formEdit');
			// 先调用父类生成基本的数据结构
			var params;
			var params = this._super();
			params.flowId = this.$('div[data-flow="cn_finallDistribution"]').find('input[name="flowId"]').val();
			params.flowName = this.$('div[data-flow="cn_finallDistribution"]').find('input[name="flowName"]').val();
			params.nextCategory = this.$('div[data-flow="cn_finallDistribution"]').find('input[name="nextCategory"]').val();
			params.deptIds = this.$('div[data-flow="cn_finallDistribution"]').find('input[name="deptIds"]').val();
			params.roleIds = this.$('div[data-flow="cn_finallDistribution"]').find('input[name="roleIds"]').val();
			params.taskId = this.$('div[data-flow="cn_finallDistribution"]').find('input[name="taskId"]').val();
			params.taskUsers = this.$('div[data-flow="cn_finallDistribution"]').find('input[name="taskUsers"]').attr('data-value');
			params.parallelTaskUsers = this.$('div[data-flow="cn_coverDesignNotice"]').find('input[name="taskUsers"]').attr('data-value');
			return params;
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
