define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');
    var listTpl =
        "<% for(var i = 0; i < list.length; i++) { %>" +
        "<tr>" +
        "   <td data-name='orderNo'><%- list[i].orderNo %></td>" +
        "   <td>" +
        "       <div class='form-group'>" +
        "           <div class='col-xs-12'>" +
        "               <input class='form-control page' name='page' value='<%- list[i].page %>' placeholder='页码'  pattern='^[1-9]\\d{0,3}$' data-fv-regexp-message='请输入大于0的整数，<br>最大4位' data-fv-notempty='true' data-fv-notempty-message='请填写页码'/>" +
        "           </div>" +
        "       </div>" +
        "   </td>" +
        "   <td>" +
        "       <div class='form-group'>" +
        "           <div class='col-xs-12'>" +
        "               <input style='margin-left: 5px;' class='form-control row' name='line' value='<%- list[i].line %>' placeholder='行' pattern='^[1-9]\\d{0,2}$' data-fv-regexp-message='请输入大于0的整数，<br>最大2位' data-fv-notempty='true' data-fv-notempty-message='请填写行'/>" +
        "           </div>" +
        "       </div>" +
        "   </td>" +
        "   <td>" +
        "       <div class='form-group'>" +
        "           <div class='col-xs-12'>" +
        "               <input class='form-control info' name='wrongInformation' value='<%- list[i].wrongInformation %>' placeholder='误' maxlength='128' data-fv-notempty='true' data-fv-notempty-message='请填写错误内容'/>" +
        "           </div>" +
        "       </div>" +
        "   </td>" +
        "   <td>" +
        "       <div class='form-group'>" +
        "           <div class='col-xs-12'>" +
        "               <input class='form-control info' name='rigthInformation' value='<%- list[i].rigthInformation %>' placeholder='正' maxlength='128' data-fv-notempty='true' data-fv-notempty-message='请填写正确内容'/>" +
        "           </div>" +
        "       </div>" +
        "   </td>" +
        "   <td>" +
        "       <div class='form-group'>" +
        "           <div class='col-xs-12'>" +
        "               <input class='form-control info' name='remarks' value='<%- list[i].remarks %>' placeholder='备注' maxlength='128'/>" +
        "           </div>" +
        "       </div>" +
        "   </td>" +
        "   <td><button class='removeTableRow btn btn-xs btn-danger'><i class='fa fa-minus box'></i></button></td>" +
        "</tr>" +
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
         * 添加行
         */
        addTableRow: function () {
            var $tb = this.$("#dataTBody");
            var $child = util.template(listTpl, {list: [{orderNo: $tb.children().length + 1}]});
            $tb.append($child);
            var that = this;
            $tb.children().last().find("input").each(function () {
                that.addValidateField($(this));
            });
            this.nextFlowChange();
        },

        /**
         * 删除行
         */
        removeTableRow: function (caller) {
            $(caller).parents('tr').remove();
            // 重新显示序号
            var orderNo = 1;
            this.$("#dataTBody").find("td[data-name='orderNo']").each(function () {
                $(this).html(orderNo);
                orderNo += 1;
            });
            this.nextFlowChange();
        },

        /**
         * 下一流程显示切换
         */
        nextFlowChange: function () {
            this.$("div[data-area='nextFlow']").hide();
            if (this.$("#dataTBody").children().length > 0) {
                this.$("div[data-index='0']").show();
            } else {
                this.$("div[data-index='1']").show();
            }
        },

        /**
         * 生成参数
         */
        getFormData: function () {
            var params = this._super();
            params.cnRightWrongList = [];
            // 勘误表数据
            this.$("#dataTBody").children().each(function () {
                params.cnRightWrongList.push({
                    page: $(this).find("input[name='page']").val(),
                    line: $(this).find("input[name='line']").val(),
                    wrongInformation: $(this).find("input[name='wrongInformation']").val(),
                    rigthInformation: $(this).find("input[name='rigthInformation']").val(),
                    remarks: $(this).find("input[name='remarks']").val()
                });
            });
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
                that.removeTableRow(this);
            });
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
            this.initValidate();
            // 显示列表内容
            var $tb = this.$("#dataTBody");
            var list = this.data.info.rightWrongList;
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
            this.nextFlowChange();
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