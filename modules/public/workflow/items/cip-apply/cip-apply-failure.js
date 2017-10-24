define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');

    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'cipApply/saveOrSubmitApply.action',

        // 批量保存/提交接口
        batchSaveAction: 'cipApply/batchReview.action',

        // 查询接口
        detailAction: 'cipApply/searchApplyDetail.action',

        onHandleChange: function () {
            var handle = this.$('input[name="handleState"]:checked').val();
            console.log(this.$('input[name="handleState"]:checked'));
            this.$('div[data-area="nextFlow"]').hide();
            console.log(handle);
            if (handle === '1') {
                // 再次申请
                this.$('div[data-flow="applyISDNCIP"]').show();
            } else if (handle === '2') {
                // 流程终止
                this.$('div[data-flow="termination"]').show();
            }
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
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

