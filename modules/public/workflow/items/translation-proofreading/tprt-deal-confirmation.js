define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');
    var ratioMap;

    /**
     * Workflow Item
     */
    module.exports = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'tpr/saveOrSubmitTrpTask.action',
        // 批量保存/提交接口
        batchSaveAction: 'tpr/batchSaveOrSubmitTrpTask.action',
        // 查询接口
        detailAction: 'tpr/searchTrpDetail.action',

        /**
         * 获取系数列表
         */
        getRatioData: function () {
            var that = this;
            util.sendRequest({
                data: {
                    'code': '0029'
                },
                action: 'common/searchCodeValue.action',
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        ratioMap = resp.data;
                        // 计算差错率
                        that.recalculateDiff();
                        // 显示系数
                        that.$("tbody[data-name='trueOrFalseTb']").children().each(function () {
                            var coefficient = $(this).attr("data-coefficient");
                            $(this).find("td[data-name='coefficient']").text(ratioMap[coefficient]);
                        });
                    } else {
                        console.log(resp);
                        util.showAlert(resp.message || '查询图书种类出错，请稍后重试！');
                    }
                },
                error: function (xhr) {
                    console.log(xhr);
                    util.showAlert('查询图书种类出错，请稍后重试！');
                }
            });
        },

        /**
         * 计算差错
         */
        recalculateDiff: function () {
            if (!ratioMap) {
                return;
            }
            var that = this;
            var diffInfo = [];
            for (var i = 0; i < that.data.info.bookFascicleList.length; i++) {
                var obj = that.data.info.bookFascicleList[i];
                diffInfo.push({
                    fasciculeId: obj.bookFascicleId,
                    fasciculeName: obj.bookFascicleBookName,
                    totalCount: obj.bookFascicleVersionNum * that.data.info.auditCenterWordOne * that.data.info.auditCenterWordTwo,
                    diffCount: 0
                });
            }
            this.$("tbody[data-name='trueOrFalseTb']").children().each(function () {
                var checked = that.data.isEdit ? $(this).find("input[name='isConfirm']").prop('checked') : ($(this).attr('data-is-confirm') === '1');
                if (checked) {
                    var fasciculeId = $(this).attr("data-fascicule-id");
                    for (var k = 0; k < diffInfo.length; k++) {
                        if (diffInfo[k].fasciculeId === fasciculeId) {
                            diffInfo[k].diffCount += parseFloat(ratioMap[$(this).attr("data-coefficient")]);
                            break;
                        }
                    }
                }
            });
            var $tb = this.$("tbody[data-name='diffTb']");
            $tb.empty();
            var $dom, row;
            for (var m = 0; m < diffInfo.length; m++) {
                $dom = $("<tr></tr>");
                $dom.attr("data-fascicule-id", diffInfo[m].fasciculeId);
                // 序号
                row = $("<td></td>");
                row.text(m + 1);
                $dom.append(row);
                // 分册名
                row = $("<td></td>");
                row.text(diffInfo[m].fasciculeName);
                $dom.append(row);
                // 差错数
                row = $("<td></td>");
                if (!diffInfo[m].diffCount) {
                    diffInfo[m].diffCount = 0;
                }
                row.text(diffInfo[m].diffCount);
                row.attr("data-name", "diffCount");
                $dom.append(row);
                // 差错率
                row = $("<td></td>");
                row.text((diffInfo[m].diffCount / diffInfo[m].totalCount * 1000).toFixed(4));
                row.attr("data-name", "diffRate");
                $dom.append(row);
                // 添加到table
                $tb.append($dom);
            }
        },

        /**
         * 生成参数
         */
        getFormData: function () {
            var params = {rightWrongList: this.data.info.rightWrongList, bookWrongList: []};// 接口要求原样返回rightWrongList
            // 正误表数据
            this.$("tbody[data-name='trueOrFalseTb']").children().each(function () {
                var rightWrongId = $(this).attr("data-right-wrong-id");
                for (var i = 0; i < params.rightWrongList.length; i++) {
                    if (params.rightWrongList[i].rigthWrongId === rightWrongId) {
                        params.rightWrongList[i].isConfirm = $(this).find("input[name='isConfirm']").prop('checked') ? "1" : "2";
                        params.rightWrongList[i].confirmCause = $(this).find("input[name='confirmCause']").val();
                    }
                }
            });
            // 差错表数据
            this.$("tbody[data-name='diffTb']").children().each(function () {
                params.bookWrongList.push({
                    bookFascicleId: $(this).attr("data-fascicule-id"),
                    bookWrongNum: $(this).find("td[data-name='diffCount']").text(),
                    bookWrongRate: $(this).find("td[data-name='diffRate']").text()
                });
            });
            params.handleContentOne = this.$("textarea[name='handleContentOne']").val();
            params.taskUsers = this.$("input[name='taskUsers']").attr('data-value');
            params.flowId = this.$("input[name='flowId']").val();
            params.flowName = this.$("input[name='flowName']").val();
            return params;
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
            // 是否确认监听
            this.$container.on('change', 'input[name="isConfirm"]', function () {
                var selectionRow = $(this).parents('tr');
                // 确认
                if ($(this).prop('checked')) {
                    // 判断全选
                    var allChecked = true;
                    selectionRow.parent().find('input[name="isConfirm"]').each(function () {
                        if (!$(this).prop('checked')) {
                            allChecked = false;
                            return false;
                        }
                    });
                    if (allChecked) {
                        $(this).parents('table').find('input[name="isConfirmBatch"]').prop('checked', 'checked');
                        // 没有输入框不显示必填星号
                        that.$(".uncheckMust").hide();
                    }
                    // 隐藏输入框
                    selectionRow.find("input[name='confirmCause']").parent().hide();
                }
                // 不确认
                else {
                    // 去掉全选
                    $(this).parents('table').find('input[name="isConfirmBatch"]').removeProp('checked');
                    // 有输入框显示必填星号
                    that.$(".uncheckMust").show();
                    // 显示输入框
                    selectionRow.find("input[name='confirmCause']").parent().show();
                }
                // 重新计算差错
                that.recalculateDiff();
            });
            // 是否批量确认
            this.$container.on('change', 'input[name="isConfirmBatch"]', function () {
                var table = $(this).parents('table');
                // 确认
                if ($(this).prop('checked')) {
                    // 设置复选框选中
                    table.find('input[name="isConfirm"]').prop('checked', 'checked');
                    // 没有输入框不显示必填星号
                    that.$(".uncheckMust").hide();
                    // 隐藏输入框
                    table.find("input[name='confirmCause']").parent().hide();
                }
                // 不确认
                else {
                    // 设置复选框不选中
                    $(this).parents('table').find('input[name="isConfirm"]').removeProp('checked');
                    // 有输入框显示必填星号
                    that.$(".uncheckMust").show();
                    // 显示输入框
                    table.find("input[name='confirmCause']").parent().show();
                }
                // 重新计算差错
                that.recalculateDiff();
            });
            // 监听input改变，动态设置title
            this.$container.on("input", "input[name='confirmCause']", function () {
                $(this).attr("title", $(this).val());
            });
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
            this.getRatioData();
            var that = this;
            // 判断全选
            var allChecked = true;
            this.$('input[name="isConfirm"]').each(function () {
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
            if (allChecked) {
                this.$('input[name="isConfirmBatch"]').prop('checked', 'checked');
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
});