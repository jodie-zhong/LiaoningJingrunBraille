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
        // 批量保存/提交接口
        batchSaveAction: 'examine/batchReview.action',
        // 查询接口
        detailAction: 'examine/searchExamineDetail.action',


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

            this.initPageEvent();

            this.initPageData();
        }

    });


    module.exports = Item;

});
