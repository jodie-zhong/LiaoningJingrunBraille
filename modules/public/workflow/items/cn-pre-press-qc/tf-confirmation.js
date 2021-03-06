define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');

    /**
     * Workflow Item
     */
    module.exports = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'CNQuality/saveOrSubmitCNQuality.action',
        // 批量保存/提交接口
        batchSaveAction: '',
        // 查询接口
        detailAction: 'CNQuality/searchCNQualityDetail.action',

        /**
         * 是否确认监听
         */
        confirmChange:function (caller) {
            var selectionRow = $(caller).parents('tr');
            // 确认
            if ($(caller).prop('checked')) {
                // 判断全选
                var allChecked = true;
                selectionRow.parent().find('input[name="isConfirm"]').each(function () {
                    if (!$(caller).prop('checked')) {
                        allChecked = false;
                        return false;
                    }
                });
                if (allChecked) {
                    $(caller).parents('table').find('input[name="isConfirmBatch"]').prop('checked', 'checked');
                    // 没有输入框不显示必填星号
                    this.$(".uncheckMust").hide();
                }
                // 隐藏输入框
                selectionRow.find("input[name='confirmCause']").parent().hide();
            }
            // 不确认
            else {
                // 去掉全选
                $(caller).parents('table').find('input[name="isConfirmBatch"]').removeProp('checked');
                // 有输入框显示必填星号
                this.$(".uncheckMust").show();
                // 显示输入框
                selectionRow.find("input[name='confirmCause']").parent().show();
            }
        },

        /**
         * 批量确认
         */
        batchConfirmChange: function (caller) {
            var table = $(caller).parents('table');
            // 确认
            if ($(caller).prop('checked')) {
                // 设置复选框选中
                table.find('input[name="isConfirm"]').prop('checked', 'checked');
                // 没有输入框不显示必填星号
                this.$(".uncheckMust").hide();
                // 隐藏输入框
                table.find("input[name='confirmCause']").parent().hide();
            }
            // 不确认
            else {
                // 设置复选框不选中
                $(caller).parents('table').find('input[name="isConfirm"]').removeProp('checked');
                // 有输入框显示必填星号
                this.$(".uncheckMust").show();
                // 显示输入框
                table.find("input[name='confirmCause']").parent().show();
            }
        },

        /**
         * 判断数据是否全选
         */
        checkBatchConfirm: function () {
            var that = this;
            // 判断全选
            var allChecked = true;
            var isEmpty = true;
            this.$('input[name="isConfirm"]').each(function () {
                isEmpty = false;
                // 确认
                if ($(this).prop('checked')) {
                    // 没有输入框不显示必填星号
                    that.$(".uncheckMust").hide();
                    // 隐藏输入框
                    $(this).parents('tr').find("input[name='confirmCause']").parent().hide();
                }
                // 不确认
                else {
                    // 去掉全选
                    allChecked = false;
                    // 有输入框显示必填星号
                    that.$(".uncheckMust").show();
                    // 显示输入框
                    $(this).parents('tr').find("input[name='confirmCause']").parent().show();
                }
            });
            if (!isEmpty && allChecked) {
                this.$('input[name="isConfirmBatch"]').prop('checked', 'checked');
            }
        },

        /**
         * 生成参数
         */
        getFormData: function () {
            var params = this._super();
            params.cnRightWrongList = [];
            // 正误表数据
            this.$("#dataTBody").children().each(function () {
                var rightWrongId = $(this).attr("data-right-wrong-id");
                params.cnRightWrongList.push({
                    rigthWrongId: rightWrongId,
                    isConfirm: $(this).find("input[name='isConfirm']").prop('checked') ? "1" : "2",
                    confirmCause: $(this).find("input[name='confirmCause']").val()
                });
            });
            return params;
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
            // 是否确认监听
            this.$container.on('change', 'input[name="isConfirm"]', function () {
                that.confirmChange(this);
            });
            // 是否批量确认
            this.$container.on('change', 'input[name="isConfirmBatch"]', function () {
                that.batchConfirmChange(this);
            });
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
            // 判断全选
            this.checkBatchConfirm();
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