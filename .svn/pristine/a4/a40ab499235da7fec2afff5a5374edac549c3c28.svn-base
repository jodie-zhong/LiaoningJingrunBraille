define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');
    var listTpl =
        "<% for(var i = 0; i < list.length; i++){ %>" +
        "<div class='row'>" +
        "  <div class='col-xs-12'>" +
        "    <div class='form-group'>" +
        "      <div class='col-xs-2 control-label'></div>" +
        "      <div class='col-xs-9'>" +
        "        <textarea class='form-control' name='machiningRecord' placeholder='加工记录（最大256字）' maxlength='256' data-fv-notempty='true' data-fv-notempty-message='请填写加工记录'><%- list[i].machiningRecord %></textarea>" +
        "      </div>" +
        "      <div class='col-xs-1'>" +
        "        <button class='btn btn-xs btn-danger' data-type='record-minus'><i class='fa fa-close box'></i></button>" +
        "      </div>" +
        "    </div>" +
        "  </div>" +
        "</div>" +
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
        addRow: function () {
            var $parentDiv = this.$("div[name='items']");
            var $child = util.template(listTpl, {list: [{}]});
            $parentDiv.append($child);
            var that = this;
            $parentDiv.children().last().find("textarea").each(function () {
                that.addValidateField($(this));
            });
            this.changeNextFlow();
        },

        /**
         * 设置下一流程显示
         */
        changeNextFlow: function () {
            this.$("div[data-area='nextFlow']").hide();
            if (this.$("div[name='items']").children().length > 0) {
                this.$("div[data-index='0']").show();
            } else {
                this.$("div[data-index='1']").show();
            }
        },

        /**
         * 保存或提交工作流
         */
        getFormData: function () {
            // 先调用父类生成基本的数据结构
            var params = this._super();
            params.cnMachiningList = []; // 加工记录
            var $div;
            this.$('div[name="items"]').children().each(function () {
                params.cnMachiningList.push({
                    machiningRecord: $(this).find('textarea[name="machiningRecord"]').val()
                });
            });
            return params;
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
            // 加工记录
            this.$container.on('click', 'button[data-type="record-plus"]', this.addRow.bind(this));
            this.$container.on('click', 'button[data-type="record-minus"]', function () {
                $(this).parents(".row").remove();
                that.changeNextFlow();
            });
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
            this.initValidate();
            // 显示列表内容
            var $parentDiv = this.$("div[name='items']");
            var list = this.data.info.cnMachiningList;
            var $child = util.template(listTpl, {list: list});
            $parentDiv.append($child);
            var that = this;
            $parentDiv.children().find("textarea").each(function () {
                that.addValidateField($(this));
            });
            that.changeNextFlow();
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