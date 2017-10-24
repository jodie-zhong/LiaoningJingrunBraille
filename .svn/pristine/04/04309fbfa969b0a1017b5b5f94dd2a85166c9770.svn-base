define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');

    /**
     * Workflow Item
     */
    module.exports = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'cnproof/saveOrSubmitProof.action',
        // 查询接口
        detailAction: 'cnproof/searchProofDetail.action',

        /**
         * 是否打样切换显示
         */
        changeIsProofing: function () {
            if (this.$("input[name='isProofing']:checked").val() === '1') {
                this.$("#pageNumDiv").show();
            } else {
                this.$("#pageNumDiv").hide();
            }
        },

        /**
         * 生成参数
         */
        getFormData: function () {
            var params = this._super();
            params.inputEntities = [];
            // table数据
            this.$('#dataTBody').children().each(function () {
                params.inputEntities.push({
                    bookFascicleId: $(this).attr('data-bookFascicleId'),
                    hTaskPageNum: $(this).find("input[name='hTaskPageNum']").val(),
                    hBookFileName: $(this).find(".uploadFile").val(),
                    hBookFileAddress: $(this).find(".uploadFile").attr('data-value')
                });
            });


            return params;
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
            // 是否打样切换监听
            this.$container.on('change', "input[name='isProofing']", this.changeIsProofing.bind(this));
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
            // 初始化是否打样显示
            this.changeIsProofing();
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