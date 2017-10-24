define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');

    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'publication/submitOrReport.action',
        // 查询接口
        detailAction: 'publication/searchReportDetail.action',

        onHandleChange: function () {
            var handle = this.$('input[name="handleState"]:checked').val();
            this.$('div[data-area="nextFlow"]').hide();
            if (handle === '1') {
                // 同意发稿
                this.$('div[data-flow="re_publicationExamineTwo"]').show();
                this.$('div[data-flow="re_submitVersion"]').show();
            } else {
                this.$('div[data-flow="re_publicationAudit"]').show();
            }
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
            // 导出
            that.$container.on('click', '#btnExport', function() {
            	var exp = $(this).attr('data-type');
            	var url = util.getServerBase() + 'publication/downLoadReport.action?';
                    url += 'zPublishPlanReportId=' + exp;
                    window.open(url, '_blank');
            });
            
            // 审核结果
            this.$container.on('change', 'input[name="handleState"]', this.onHandleChange.bind(this));
    		
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
