define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');

    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
//		saveAction: '',
        // 保存/提交接口
        saveAction: 'CNchangeRecord/cnSaveOrUpdateChangeRecord.action',
        // 批量保存/提交接口
        batchSaveAction: 'CNchangeRecord/cnSaveOrUpdateChangeAll.action',
        // 查询接口
        detailAction: 'CNchangeRecord/cnSearchChangeRecordDetail.action',

        onHandleChange: function () {
            var handle = this.$('input[name="handleState"]:checked').val();
            this.$('div[data-area="nextFlow"]').hide();
            if (handle === '1') {
                // 待定确认
                this.$('div[data-flow="cn_sign"]').show();
            } else {
                this.$('div[data-flow="cn_changeTheRecordsApplication"]').show();
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
