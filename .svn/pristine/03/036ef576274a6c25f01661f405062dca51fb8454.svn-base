define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');

    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'cover/saveOrSubmitCover.action',

        // 查询接口
        detailAction: 'cover/searchCoverDetail.action',

        onHandleChange: function () {
            var handle = this.$('input[name="bookPrintType"]:checked').val();
            this.$('div[data-area="nextFlow"]').hide();
            if (handle === '2') {
                // 另件印制单
                this.$('div[data-flow="devise"]').show();
            } else if (handle === '1') {
                // 快印通知单
                this.$('div[data-flow="printNoticeOfEntry"]').show();
            }
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
            // 审核结果
            this.$container.on('change', 'input[name="bookPrintType"]', this.onHandleChange.bind(this));

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

