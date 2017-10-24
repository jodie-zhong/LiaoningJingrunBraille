define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');

    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'production/modifyProductionDetail.action',
        // 批量保存/提交接口
        batchSaveAction: 'examine/batchReview.action',
        // 查询接口
        detailAction: 'production/searchProductionDetail.action',
        
        /**
         * 任务操作切换
         */
        onTaskOperationChange: function () {
            var handle = this.$('input[name="handleState"]:checked').val();
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
            that.$('#bluePaperPrintTime').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: 'zh-cn',
                sideBySide: true,
                widgetPositioning: {
					vertical: 'bottom',
					horizontal: 'auto'
				}
            });

			that.$('#bluePaperCompleteTime').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: 'zh-cn',
                sideBySide: true,
                useCurrent: false,
                widgetPositioning: {
					vertical: 'bottom',
					horizontal: 'auto'
				}
            });
            $("#bluePaperPrintTime").on("dp.change", function(e) {
                $('#bluePaperCompleteTime').data("DateTimePicker").minDate(e.date);
            });
            $("#bluePaperCompleteTime").on("dp.change", function(e) {
                $('#bluePaperPrintTime').data("DateTimePicker").maxDate(e.date);
            });
            // 任务操作切换
            this.$container.on("click", "input[name='handleState']", this.onTaskOperationChange.bind(this));
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
        	// 任务操作初始化时切换显示
            this.onTaskOperationChange();
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
