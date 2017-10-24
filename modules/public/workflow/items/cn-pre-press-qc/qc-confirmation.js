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
         * 计算差错
         */
        caculateDiff: function () {
            var count = 0;
            this.$("#dataTBody").children().each(function () {
                if ($(this).attr("data-isConfirm") === '1' || !$(this).find("input[name='checkResult']:checked").prop("checked")) {
                    count++;
                }
            });
            var total = this.data.info.bookWordsNum;
            this.$("input[name='hAcErrorNumber']").val(count);
            if (total) {
                this.$("input[name='hAcErrorRate']").val((count / total).toFixed(4));
            }
        },

        /**
         * 是否同意监听
         */
        onAgreeChange: function (caller) {
            var selectionRow = $(caller).parents('tr');
            // 同意
            if ($(caller).prop('checked')) {
                // 判断全选
                var allChecked = true;
                selectionRow.parent().find('input[name="checkResult"]').each(function () {
                    if (!$(this).prop('checked')) {
                        allChecked = false;
                        return false;
                    }
                });
                if (allChecked) {
                    $(caller).parents('table').find('input[name="checkResultBatch"]').prop('checked', 'checked');
                    // 没有输入框不显示必填星号
                    this.$(".uncheckMust").hide();
                }
                // 隐藏输入框
                selectionRow.find("input[name='checkIdea']").hide();
            }
            // 不同意
            else {
                // 去掉全选
                $(caller).parents('table').find('input[name="checkResultBatch"]').removeProp('checked');
                // 有输入框显示必填星号
                this.$(".uncheckMust").show();
                // 显示输入框
                selectionRow.find("input[name='checkIdea']").show();
            }
            // 计算差错率
            this.caculateDiff();
        },

        /**
         * 批量同意监听
         */
        onBatchAgreeChange: function (caller) {
            var table = $(caller).parents('table');
            // 同意
            if ($(caller).prop('checked')) {
                // 设置复选框选中
                table.find('input[name="checkResult"]').prop('checked', 'checked');
                // 没有输入框不显示必填星号
                this.$(".uncheckMust").hide();
                // 隐藏输入框
                table.find("input[name='checkIdea']").hide();
            }
            // 不同意
            else {
                // 设置复选框不选中
                $(caller).parents('table').find('input[name="checkResult"]').removeProp('checked');
                // 有输入框显示必填星号
                this.$(".uncheckMust").show();
                // 显示输入框
                table.find("input[name='checkIdea']").show();
            }
            // 计算差错率
            this.caculateDiff();
        },

        /**
         * 生成参数
         */
        getFormData: function () {
            var params = this._super();
            params.bookWordsNum = this.data.info.bookWordsNum;
            params.hAcWordsNum = this.data.info.hAcWordsNum;
            params.hAcPageNum = this.data.info.hAcPageNum;
            params.isQualified = this.data.info.isQualified;
            params.cnRightWrongList = [];
            // 勘误表数据
            this.$("#dataTBody").children().each(function () {
                params.cnRightWrongList.push({
                    rigthWrongId: $(this).attr("data-rigthWrongId"),
                    checkResult: $(this).find("input[name='checkResult']").prop("checked") ? "1" : "2",
                    checkIdea: $(this).find("input[name='checkIdea']").val()
                });
            });
            return params;
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
            // 是否同意监听
            this.$container.on('change', 'input[name="checkResult"]', function () {
                that.onAgreeChange(this);
            });
            // 是否批量同意
            this.$container.on('change', 'input[name="checkResultBatch"]', function () {
                that.onBatchAgreeChange(this);
            });
            // 监听input改变，动态设置title
            this.$container.on("input", "input[name='checkIdea']", function () {
                $(this).attr("title", $(this).val());
            });
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
            var that = this;
            // 判断全选
            var allChecked = true;
            this.$('input[name="checkResult"]').each(function () {
                // 同意
                if ($(this).prop('checked')) {
                    // 没有输入框不显示必填星号
                    that.$(".uncheckMust").hide();
                    // 隐藏输入框
                    $(this).parents('tr').find("input[name='checkIdea']").hide();
                }
                // 不同意
                else {
                    // 去掉全选
                    allChecked = false;
                    // 有输入框显示必填星号
                    that.$(".uncheckMust").show();
                    // 显示输入框
                    $(this).parents('tr').find("input[name='checkIdea']").show();
                }
            });
            if (allChecked) {
                this.$('input[name="checkResultBatch"]').prop('checked', 'checked');
            }
            // 计算差错率
            this.caculateDiff();
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