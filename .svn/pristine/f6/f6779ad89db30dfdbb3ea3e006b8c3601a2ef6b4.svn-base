define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');

    /**
     * Workflow Item
     */
    module.exports = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'composing/submitOrUpdateComposing.action',
        // 批量保存/提交接口
        batchSaveAction: 'composing/batchComposing.action',
        // 查询接口
        detailAction: 'composing/searchComposingDetail.action',

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
            // 审核结果切换
            this.$container.on("click", "input[name='handleState']", function () {
                that.$("div[data-area='nextFlow']").hide();
                if (that.$("input[name='handleState']:checked").val() === '1') {
                    that.$("div[data-index='0']").show();
                } else {
                    that.$("div[data-index='1']").show();
                }
            });
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
            // 审核结果初始化时切换显示
            this.$("div[data-area='nextFlow']").hide();
            if (this.$("input[name='handleState']:checked").val() === '1') {
                this.$("div[data-index='0']").show();
            } else {
                this.$("div[data-index='1']").show();
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