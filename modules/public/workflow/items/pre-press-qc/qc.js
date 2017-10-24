define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');
    var ratioMap;
    var listTpl =
        "<% for(var i = 0; i < list.length; i++) { %>" +
        "<tr>" +
        "  <td data-name='orderNo'><%- list[i].orderNo || (i + 1) %></td>" +
        "  <td>" +
        "    <div class='form-group'>" +
        "      <div class='col-xs-12'>" +
        "        <select name='fascicule' class='form-control' data-fv-notempty='true' data-fv-notempty-message='请选择分册' title='分册'>" +
        "          <% if(bookFascicleEntities && bookFascicleEntities.length > 0) { %>" +
        "          <% for(var k = 0; k < bookFascicleEntities.length; k++) { %>" +
        "          <% if(bookFascicleEntities[k].bookFascicleId === list[i].bookFascicleId){ %>" +
        "          <option value='<%- bookFascicleEntities[k].bookFascicleId %>' selected><%- bookFascicleEntities[k].bookFascicleBookName %></option>" +
        "          <% }else{ %>" +
        "          <option value='<%- bookFascicleEntities[k].bookFascicleId %>'><%- bookFascicleEntities[k].bookFascicleBookName %></option>" +
        "          <% } %>" +
        "          <% } %>" +
        "          <% } %>" +
        "        </select>" +
        "      </div>" +
        "    </div>" +
        "  </td>" +
        "  <td>" +
        "    <div class='form-group'>" +
        "      <div class='col-xs-12'>" +
        "        <input class='form-control' value='<%- list[i].page %>' name='pageNum' placeholder='页码' maxlength='4' pattern='^[1-9][0-9]*$' data-fv-regexp-message='请输入大于0的整数' data-fv-notempty='true' data-fv-notempty-message='请填写页码'/>" +
        "      </div>" +
        "    </div>" +
        "  </td>" +
        "  <td>" +
        "    <div class='form-group'>" +
        "      <div class='col-xs-12'>" +
        "        <input class='form-control' value='<%- list[i].line %>' name='rowNum' placeholder='行' maxlength='3' pattern='^[1-9][0-9]*$' data-fv-regexp-message='请输入大于0的整数' data-fv-notempty='true' data-fv-notempty-message='请填写行'/>" +
        "      </div>" +
        "    </div>" +
        "  </td>" +
        "  <td>" +
        "    <div class='form-group'>" +
        "      <div class='col-xs-12'>" +
        "        <input class='form-control' value='<%- list[i].content %>' name='content' placeholder='内容' maxlength='128' data-fv-notempty='true' data-fv-notempty-message='请填写内容'/>" +
        "      </div>" +
        "    </div>" +
        "  </td>" +
        "  <td>" +
        "    <div class='form-group'>" +
        "      <div class='col-xs-12'>" +
        "        <select name='coefficient' class='form-control' title='系数' data-oldRatio='<%- list[i].coefficient %>'>" +
        "          <% if(ratioMap) { %>" +
        "          <% for(var k in ratioMap) { %>" +
        "          <% if(k === list[i].bookFascicleId){ %>" +
        "          <option value='<%- k %>' selected><%- ratioMap[k] %></option>" +
        "          <% }else{ %>" +
        "          <option value='<%- k %>'><%- ratioMap[k] %></option>" +
        "          <% } %>" +
        "          <% } %>" +
        "          <% } %>" +
        "        </select>" +
        "      </div>" +
        "    </div>" +
        "  </td>" +
        "  <td>" +
        "    <button class='removeTableRow btn btn-xs btn-danger'><i class='fa fa-minus box'></i></button>" +
        "  </td>" +
        "</tr>" +
        "<% } %>";

    /**
     * Workflow Item
     */
    module.exports = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'quality/saveOrSubmitQuality.action',
        // 批量保存/提交接口
        batchSaveAction: 'quality/batchQuality.action',
        // 查询接口
        detailAction: 'quality/searchQualityTestDetail.action',

        /**
         * 获取系数列表，并赋值到table数据中
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
                        // 赋值到table数据中
                        if (that.data.isEdit) {
                            that.$("tbody[data-name='trueOrFalseTb']").find("select[name='coefficient']").each(function () {
                                var oldRatio = $(this).attr("data-oldRatio");
                                $(this).empty();
                                var $dom;
                                for (var i in ratioMap) {
                                    if (ratioMap.hasOwnProperty(i)) {
                                        $dom = $('<option></option>');
                                        $dom.text(ratioMap[i]);
                                        $dom.val(i);
                                        $(this).append($dom);
                                        if (!oldRatio) {
                                            oldRatio = i;
                                        }
                                    }
                                }
                                $(this).val(oldRatio);
                            });
                        } else {
                            that.$("tbody[data-name='trueOrFalseTb']").children().each(function () {
                                var coefficient = $(this).attr("data-coefficient");
                                $(this).find("td[data-name='coefficient']").text(ratioMap[coefficient]);
                            });
                        }
                        // 计算差错率
                        that.recalculateDiff();
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
         * 添加行
         */
        addTableRow: function () {
            // 添加行
            var $tb = this.$("tbody[data-name='trueOrFalseTb']");
            var $child = util.template(listTpl, {list: [{orderNo: $tb.children().length + 1}], ratioMap: ratioMap, bookFascicleEntities: this.data.info.bookFascicleEntities});
            $tb.append($child);
            var that = this;
            $tb.children().last().find("input").each(function () {
                that.addValidateField($(this));
            });
            this.recalculateDiff();
        },

        /**
         * 重新计算差错
         */
        recalculateDiff: function () {
            if (!ratioMap) {
                return;
            }
            var that = this;
            var diffInfo = [];
            for (var i = 0; i < that.data.info.bookFascicleEntities.length; i++) {
                var obj = that.data.info.bookFascicleEntities[i];
                diffInfo.push({
                    fasciculeId: obj.bookFascicleId,
                    fasciculeName: obj.bookFascicleBookName,
                    totalCount: obj.bookFascicleCheckVersion * that.data.info.centerWordEntity.auditCenterWordOne * that.data.info.centerWordEntity.auditCenterWordTwo,
                    diffCount: 0
                });
            }
            this.$("tbody[data-name='trueOrFalseTb']").children().each(function () {
                var fasciculeId = that.data.isEdit ? $(this).find('select').val() : $(this).attr("data-fascicule-id");
                for (var k = 0; k < diffInfo.length; k++) {
                    if (diffInfo[k].fasciculeId === fasciculeId) {
                        if (that.data.isEdit) {
                            diffInfo[k].diffCount += parseFloat(ratioMap[$(this).find("select[name='coefficient']").val()]);
                        } else {
                            diffInfo[k].diffCount += parseFloat(ratioMap[$(this).attr("data-coefficient")]);
                        }
                        break;
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
            var params = {qualityRightWrongEntities: [], bookWrongEntities: []};
            // 正误表数据
            this.$("tbody[data-name='trueOrFalseTb']").children().each(function () {
                params.qualityRightWrongEntities.push({
                    bookFascicleId: $(this).find("select[name='fascicule']").val(),
                    page: $(this).find("input[name='pageNum']").val(),
                    line: $(this).find("input[name='rowNum']").val(),
                    content: $(this).find("input[name='content']").val(),
                    coefficient: $(this).find("select[name='coefficient']").val()
                });
            });
            // 差错表数据
            this.$("tbody[data-name='diffTb']").children().each(function () {
                params.bookWrongEntities.push({
                    bookFascicleId: $(this).attr("data-fascicule-id"),
                    bookWrongNum: $(this).find("td[data-name='diffCount']").text(),
                    bookWrongRate: $(this).find("td[data-name='diffRate']").text()
                });
            });
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
            // 添加行
            this.$container.on('click', '.addTableRow', this.addTableRow.bind(this));
            // 删除行
            this.$container.on('click', '.removeTableRow', function () {
                $(this).parents('tr').remove();
                that.recalculateDiff();
                // 重新显示序号
                var orderNo = 1;
                that.$("tbody[data-name='trueOrFalseTb']").find("td[data-name='orderNo']").each(function () {
                    $(this).html(orderNo);
                    orderNo += 1;
                });
            });
            // 分册选择
            this.$container.on('change', 'select[name="fascicule"]', this.recalculateDiff.bind(this));
            // 系数选择
            this.$container.on('change', 'select[name="coefficient"]', this.recalculateDiff.bind(this));
            // 监听内容改变，动态设置title
            this.$container.on("input", "input[name='content']", function () {
                $(this).attr("title", $(this).val());
            });
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
            // 填充表格数据
            if (this.data.isEdit) {
                var list = this.data.info.qualityRightWrongEntities;
                if (!list || list.length === 0) {
                    list = [];
                }
                this.$("tbody[data-name='trueOrFalseTb']").append(util.template(listTpl, {list: list, ratioMap: ratioMap, bookFascicleEntities: this.data.info.bookFascicleEntities}));
            }
            // 初始化系数数据
            this.getRatioData();
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