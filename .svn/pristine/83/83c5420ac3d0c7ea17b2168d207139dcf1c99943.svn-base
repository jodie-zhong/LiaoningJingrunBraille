define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');

    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'quickPrint/saveOrSubmitCnQuickPrint.action',
        // 查询接口
        detailAction: 'quickPrint/searchCnQuickPrintFlowDetail.action',
        
        onHandleChange: function () {
            var handle = this.$('input[name="sampleBookPrintState"]:checked').val();
            if (handle === '1') {
                this.workflowDialog.changeBtnState(2);
            } else {
                this.workflowDialog.changeBtnState();
            }
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
            // 时间组件
            that.$('#sampleBookPrintTime').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: 'zh-cn',
                sideBySide: true,
                widgetPositioning: {
					vertical: 'bottom',
					horizontal: 'auto'
				}
            });

			that.$('#sampleBookCompleteTime').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: 'zh-cn',
                sideBySide: true,
                useCurrent: false,
                widgetPositioning: {
					vertical: 'bottom',
					horizontal: 'auto'
				}
            });
            $("#sampleBookPrintTime").on("dp.change", function(e) {
                $('#sampleBookCompleteTime').data("DateTimePicker").minDate(e.date);
            });
            $("#sampleBookCompleteTime").on("dp.change", function(e) {
                $('#sampleBookPrintTime').data("DateTimePicker").maxDate(e.date);
            });
            this.$container.on('change', 'input[name="sampleBookPrintState"]', this.onHandleChange.bind(this));
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
