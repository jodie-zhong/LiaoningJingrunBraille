define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');
    var listTpl =
        "<% if(list && list.length > 0) { %>" +
        "<% for(var i = 0; i < list.length; i++) { %>" +
        "<tr data-auditRedId='<%- list[i].auditRedId %>'>" +
        "  <td data-name='orderNo'><%- list[i].orderNo %></td>" +
        "  <td>" +
        "    <div class='form-group'>" +
        "      <div class='col-xs-12'>" +
        "        <input class='form-control' value='<%- list[i].auditRedMissPage %>' name='auditRedMissPage' placeholder='页数（P）' maxlength='7' pattern='^[1-9]\\d{0,6}$' data-fv-regexp-message='请输入大于0的整数，最大7位' data-fv-notempty='true' data-fv-notempty-message='请填写页数'/>" +
        "      </div>" +
        "    </div>" +
        "  </td>" +
        "  <td>" +
        "    <div class='form-group'>" +
        "      <div class='col-xs-12'>" +
        "        <input class='form-control' value='<%- list[i].auditRedMissLine %>' name='auditRedMissLine' placeholder='行号' pattern='^[1-9]\\d{0,2}$' data-fv-regexp-message='请输入大于0的整数，最大3位' data-fv-notempty='true' data-fv-notempty-message='请填写行'/>" +
        "      </div>" +
        "    </div>" +
        "  </td>" +
        "  <td>" +
        "    <button class='removeTableRow btn btn-xs btn-danger'><i class='fa fa-minus box'></i></button>" +
        "  </td>" +
        "</tr>" +
        "<% } %>" +
        "<% } %>";

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
         * 根据处理意见判断漏改信息是否显示
         */
        changeMissedAreaState: function () {
            if (this.$("input[name='handleState']:checked").val() === '1') {
                this.$("#missedArea").show();
            } else {
                this.$("#missedArea").hide();
            }
        },

        /**
         * 添加行
         */
        addRow: function () {
            var $tb = this.$("#dataTBody");
            var $child = util.template(listTpl, {list: [{orderNo: $tb.children().length + 1}]});
            $tb.append($child);
            var that = this;
            $tb.children().last().find("input").each(function () {
                that.addValidateField($(this));
            });
            // 漏改数量
            this.$("input[name='missNum']").val($tb.children().length);
        },

        /**
         * 删除行
         */
        removeRow: function (caller) {
            $(caller).parents('tr').remove();
            var $tb = this.$("#dataTBody");
            // 重新显示序号
            var orderNo = 1;
            $tb.find("td[data-name='orderNo']").each(function () {
                $(this).html(orderNo);
                orderNo += 1;
            });
            // 漏改数量
            this.$("input[name='missNum']").val($tb.children().length);
        },

        /**
         * 生成参数
         */
        getFormData: function () {
            var params = this._super();
            params.qualityRedList = [];
            // table数据
            this.$("#dataTBody").children().each(function () {
                params.qualityRedList.push({
                    auditRedId: $(this).attr('data-auditRedId'),
                    auditRedMissPage: $(this).find("input[name='auditRedMissPage']").val(),
                    auditRedMissLine: $(this).find("input[name='auditRedMissLine']").val()
                });
            });
            return params;
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
            // 处理意见切换
            this.$container.on("click", "input[name='handleState']", this.changeMissedAreaState.bind(this));
            // 添加行
            this.$container.on('click', '.addTableRow', this.addRow.bind(this));
            // 删除行
            this.$container.on('click', '.removeTableRow', function () {
                that.removeRow(this);
            });
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
            this.initValidate();
            // 显示列表内容
            var $tb = this.$("#dataTBody");
            var list = this.data.info.qualityRedList;
            if (list) {
                for (var i = 0; i < list.length; i++) {
                    list[i].orderNo = i + 1;
                }
            }
            var $child = util.template(listTpl, {list: list});
            $tb.append($child);
            var that = this;
            $tb.children().find("input").each(function () {
                that.addValidateField($(this));
            });
            // 漏改数量
            this.$("input[name='missNum']").val($tb.children().length);
            // 判断是否显示漏改信息
            this.changeMissedAreaState();
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