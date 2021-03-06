define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');

    /**
     * Workflow Item
     */
    module.exports = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'cnproof/saveOrSubmitProof.action',
        // 查询接口
        detailAction: 'cnproof/searchProofDetail.action',

        onHandleChange: function () {
            var handle = this.$('input[name="handleState"]:checked').val();
            this.$('div[data-area="nextFlow"]').hide();
            if (handle === '1') {
                // 待定确认
                this.$('div[data-flow="cn_firstTaskEntrust"]').show();
                this.$('div[data-flow="cn_secondTaskEntrust"]').show();
                this.$('div[data-flow="cn_thirdTaskEntrust"]').show();
            } else if (handle === '2') {
                // 不同意申报
                this.$('div[data-flow="cn_notFirstProofread"]').show();
                this.$('div[data-flow="cn_notSecondProofread"]').show();
                this.$('div[data-flow="cn_notThirdProofread"]').show();
            }
        },
        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            //是否一校
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
});