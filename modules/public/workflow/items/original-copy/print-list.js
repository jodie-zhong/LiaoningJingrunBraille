define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');

    /**
     * Workflow Item
     */
    module.exports = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'clearManage/saveOrSubmitClear.action',
        // 批量保存/提交接口
        batchSaveAction: 'clearManage/saveOrSubmitClearAll.action',
        // 查询接口
        detailAction: 'clearManage/searchClearDetail.action',

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
            this.$container.on("change", "select[name='bookPrintType']", function () {
                that.$("input[name='bookPrice']").val(
                    ((that.data.info.bookPrice * 100) * ([0.35, 0.4, 0.3, 0.2][$(this).val() - 1] * 100) / 10000).toFixed(2)
                );
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
});