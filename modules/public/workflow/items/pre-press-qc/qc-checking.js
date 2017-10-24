define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');

    /**
     * Workflow Item
     */
    module.exports = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'quality/saveOrSubmitQuality.action',
        // 批量保存/提交接口
        batchSaveAction: 'quality/batchQuality.action',
        // 查询接口
        detailAction: 'quality/searchQualityTestDetail.action',

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
            // 审核结果
            this.$container.on('change', 'input[name="handleState"]', function () {
                var handle = that.$('input[name="handleState"]:checked').val();
                that.$('div[data-area="nextFlow"]').hide();
                // 合格（默认）
                if (!handle || handle === '1') {
                    that.$('div[data-flow="applyISDNCIP"]').show();
                }
                // 不合格
                else {
                    that.$('div[data-flow="taskAllocation"]').show();
                }
            });
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
            this.$('div[data-area="nextFlow"]').hide();
            // 合格（默认）
            if (!this.data.info.handleState || this.data.info.handleState === '1') {
                this.$('div[data-flow="applyISDNCIP"]').show();
            }
            // 不合格
            else {
                this.$('div[data-flow="taskAllocation"]').show();
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