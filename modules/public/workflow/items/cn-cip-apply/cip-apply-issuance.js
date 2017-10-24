define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');

    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'cnCip/saveOrSubmitCNCip.action',

        // 批量保存/提交接口
        batchSaveAction: 'cnCip/batchReviewCN.action',

        // 查询接口
        detailAction: 'cnCip/searchCNCipFlowDetail.action',

        onHandleChange: function () {
            var handle = this.$('input[name="handleState"]:checked').val();
            console.log(this.$('input[name="handleState"]:checked'));
            this.$('div[data-area="nextFlow"]').hide();
            if (handle === '1') {
                // 同意签发
                this.$('div[data-flow="cn_cipIssued"]').show();
            } else if (handle === '2') {
                // 废弃
                this.$('div[data-flow="cn_abandoned"]').show();
            } else if (handle === '3') {
                // 变更备案登记
                this.$('div[data-flow="cn_cipIssued"]').show();
            } else if (handle === '4') {
                // 回到初审
                this.$('div[data-flow="cn_first"]').show();
            }
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
            // 审核结果
            this.$container.on('change', 'input[name="handleState"]', this.onHandleChange.bind(this));
            // 下载
            this.$container.on('click', '.address', function () {
                var $el = $(this);
                window.open(util.getServerBase() + 'common/downloadFile.action?path=' + encodeURIComponent($el.attr('data-address')), '_blank');
            });
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
            this.onHandleChange();
            if (this.workflowDialog.bookId.indexOf(',') >= 0 || this.workflowDialog.taskId.indexOf(',') >= 0) {
                this.$('.row-bach').remove();
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


    module.exports = Item;

});
