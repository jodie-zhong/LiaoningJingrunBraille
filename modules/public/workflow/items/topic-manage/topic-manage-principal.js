define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');

    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'topic/saveOrSubmitTopic.action',
        // 批量保存/提交接口
        batchSaveAction: 'topic/batchReview.action',
        // 查询接口
        detailAction: 'topic/detailTopic.action',

        onHandleChange: function () {
            var handle = this.$('input[name="handleState"]:checked').val();
            this.$('div[data-area="nextFlow"]').hide();
            if (handle === '3') {
                // 待定确认
                this.$('div[data-flow="braillePend"]').show();
                this.$('div[data-area="urgent"]').hide();
            } else if (handle === '5') {
                // 不建议申报
                this.$('div[data-flow="abandoned"]').show();
                this.$('div[data-area="urgent"]').hide();
            } else {
                // 同意
                this.$('div[data-flow="brailleTopicReport"]').show();
                this.$('div[data-area="urgent"]').show();
                this.onUrgentChange();
            }
        },

        onUrgentChange: function () {

            var isUrgent = this.$('input[name="topicIsUrgent"]:checked').val();
            this.$('div[data-area="nextFlow"]').hide();
            if (isUrgent === '2') {
                // 加急
                this.$('div[data-flow="brailleChiefEditorTrial"]').show();
            } else {
                // 非加急
                this.$('div[data-flow="brailleTopicReport"]').show();
                this.$('div[data-flow="brailleTopicReport"]').find('.forHideTaskUsers').hide();
            }
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
            // 审核结果
            this.$container.on('change', 'input[name="handleState"]', this.onHandleChange.bind(this));

            this.$container.on('change', 'input[name="topicIsUrgent"]', this.onUrgentChange.bind(this));
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
            // this.onUrgentChange();
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