
define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');

    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 提交接口
        saveAction: 'reprint/saveOrSubmitReprint.action',
        // 批量提交接口
        batchSaveAction: 'reprint/saveOrSubmitReprint.action',

        // 查询接口
        detailAction: 'reprint/searchReprintDetail.action',


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
            this.workflowDialog.changeBtnState(1);
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

