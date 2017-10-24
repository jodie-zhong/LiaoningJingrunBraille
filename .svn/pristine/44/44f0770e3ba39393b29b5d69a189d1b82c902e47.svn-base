define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');

    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'styleBook/saveOrSubmitProcess.action',
        // 查询接口
        detailAction: 'styleBook/searchReceiveStyleBookDetail.action',

        onHandleChange: function () {
            var handle = this.$('input[name="handleState"]:checked').val();
            this.$('div[data-area="nextFlow"]').hide();
             if (handle === '2') {
                // 不同意申请
                this.$('div[data-flow="cn_receiveStyleBook"]').show();
            } else if (handle === '1') {
                // 同意申请
                this.$('div[data-flow="cn_leaderExamine"]').show();
            }
        },

        /**
         * 生成参数
         */
        getFormData: function () {
            var params = this._super();
            params.stylebookGetId=$("input[name='stylebookGetId']").val();
            params.stylebookGetNum=$("input[name='stylebookGetNum']").val();

            // 部门领导审核
            if (this.data.info.flowId === "cn_departmentExamine") {
                params.taskUsers = this.$("input[name='handleState']:checked").val() === "1" ?
                    this.$("div[data-flow='cn_leaderExamine']").find("input[name='taskUsers'][type='hidden']").attr("data-value") :
                    this.$("div[data-flow='cn_receiveStyleBook']").find("input[name='taskUsers'][type='hidden']").attr("data-value");
            }
            return params;
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

