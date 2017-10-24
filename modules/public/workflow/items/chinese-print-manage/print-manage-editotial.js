define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');

    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'quickPrint/saveOrSubmitCnQuickPrint.action',
        // 查询接口
        detailAction: 'quickPrint/searchCnQuickPrintFlowDetail.action',

        onHandleChange: function () {
            var handle = this.$('input[name="handleState"]:checked').val();
            this.$('div[data-area="nextFlow"]').hide();
            if (handle === '1') {
                // 同意发稿
                this.$('div[data-flow="cn_issueDeptOpinion"]').show();
                this.$('div[data-type = "agree"]').show();
            } else {
                this.$('div[data-flow="cn_fillQuickPrint"]').show();
                this.$('div[data-type = "agree"]').hide();
            }
        },
        
        onBookTimeChange: function () {
            var handle = this.$('input[name="publishBookTime"]:checked').val();
            this.$('div[data-type = "bookTime"]').hide();
            if (handle === '3') {
                // 同意发稿
                this.$('div[data-type = "bookTime"]').show();
            } else {
            	this.$('div[data-type = "bookTime"]').hide();
            }
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
            // 审核结果
            this.$container.on('change', 'input[name="handleState"]', this.onHandleChange.bind(this));
            // 成书时间
            this.$container.on('change', 'input[name="publishBookTime"]', this.onBookTimeChange.bind(this));
    		
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
        	this.onHandleChange();
        	this.onBookTimeChange();

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
