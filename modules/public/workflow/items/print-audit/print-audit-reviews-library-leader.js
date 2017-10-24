define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');

    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'bookPrinted/doSaveOrSubmitBookPrint.action',

        // 查询接口
        detailAction: 'bookPrinted/searchFlowInfoList.action',

        confirmMessage: '确定要将所有的数据都提交吗？',

        onHandleChange: function () {
            var handle = this.$('input[name="handleState"]:checked').val();

            this.$('div[data-area="nextFlow"]').hide();

            if (handle === '2') {
                // 不同意
                this.$('div[data-flow="editorOfficeDepartmentHeadAudit"]').show();
            } else if (handle === '1') {
                // 同意
                this.$('div[data-flow="braillePrintDepartmentHeadAudit"]').show();
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

