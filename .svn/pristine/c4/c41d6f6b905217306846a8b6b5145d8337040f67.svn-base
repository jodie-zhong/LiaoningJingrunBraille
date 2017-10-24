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
