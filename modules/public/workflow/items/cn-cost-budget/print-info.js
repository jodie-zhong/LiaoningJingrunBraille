define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');

    /**
     * Workflow Item
     */
    module.exports = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'cost/saveOrSubmitCost.action',
        // 批量保存/提交接口
        batchSaveAction: '',
        // 查询接口
        detailAction: 'cost/searchCostDetail.action',

        /**
         * 生成参数
         */
        getFormData: function () {
            var params = this._super();
            params.cnBookPrintEntity = $.extend({},params);
            // params.cnBookPrintEntity.colorInsert = params.colorInsert;
            // params.cnBookPrintEntity.colorInsertGram = params.colorInsertGram;
            // params.cnBookPrintEntity.colorInsertNum = params.colorInsertNum;
            // params.cnBookPrintEntity.colorInsertPaper = params.colorInsertPaper;
            // params.cnBookPrintEntity.coverColor = params.coverColor;
            // params.cnBookPrintEntity.coverGram = params.coverGram;
            // params.cnBookPrintEntity.coverPaper = params.coverPaper;
            // params.cnBookPrintEntity.endPaper = params.endPaper;
            // params.cnBookPrintEntity.endPaperGram = params.endPaperGram;
            // params.cnBookPrintEntity.endPaperNum = params.endPaperNum;
            // params.cnBookPrintEntity.finishedSize = params.finishedSize;
            // params.cnBookPrintEntity.flap = params.flap;
            // params.cnBookPrintEntity.flapSize = params.flapSize;
            // params.cnBookPrintEntity.nextCategory = params.nextCategory;
            // params.cnBookPrintEntity.operationType = params.operationType;
            // params.cnBookPrintEntity.pageNum = params.pageNum;
            // params.cnBookPrintEntity.printColorNum = params.printColorNum;
            // params.cnBookPrintEntity.printNum = params.printNum;
            // params.cnBookPrintEntity.printSheet = params.printSheet;
            // params.cnBookPrintEntity.textPaperGram = params.textPaperGram;
            // params.cnBookPrintEntity.textPaperNum = params.textPaperNum;
            return params;
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
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
});