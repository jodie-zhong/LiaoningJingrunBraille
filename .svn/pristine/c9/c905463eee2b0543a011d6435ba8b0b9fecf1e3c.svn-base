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
            // 接受
            if (handle === '1') {
                this.$('div[data-flow="cn_firstCheck"]').show();
                this.$('div[data-flow="cn_secondCheck"]').show();
                this.$('div[data-flow="cn_thirdCheck"]').show();
            }
            // 拒绝
            else if (handle === '2') {
                this.$('div[data-flow="cn_firstTaskEntrust"]').show();
                this.$('div[data-flow="cn_secondTaskEntrust"]').show();
                this.$('div[data-flow="cn_thirdTaskEntrust"]').show();
            }
            // 待定不显示下一流程
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