define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');

    /**
     * Workflow Item
     */
    module.exports = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'tpr/saveOrSubmitTrpTask.action',
        // 批量保存/提交接口
        batchSaveAction: 'tpr/batchSaveOrSubmitTrpTask.action',
        // 查询接口
        detailAction: 'tpr/searchTrpDetail.action',

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
            // 书稿接收结果
            this.$container.on('change', 'input[name="handleState"]', function () {
                var handle = that.$('input[name="handleState"]:checked').val();
                that.$('div[data-area="nextFlow"]').hide();
                // 接收（默认）
                if (!handle || handle === '1') {
                    that.$('div[data-index="0"]').show();
                }
                // 未接收
                else {
                    that.$('div[data-index="1"]').show();
                }
            });
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
            // 书稿接收结果
            this.$('div[data-area="nextFlow"]').hide();
            // 接收（默认）
            if (!this.data.info.handleState || this.data.info.handleState === '1') {
                this.$('div[data-index="0"]').show();
            }
            // 未接收
            else {
                this.$('div[data-index="1"]').show();
            }
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