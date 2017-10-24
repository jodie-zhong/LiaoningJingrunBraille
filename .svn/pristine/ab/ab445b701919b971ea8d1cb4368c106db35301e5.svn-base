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
         * 生成参数
         */
        getFormData: function () {
            var params = this._super();
            params.flag = this.data.info.flag;
            params.fileList = [];
            // table数据
            this.$('#dataTBody').children().each(function () {
                params.fileList.push({
                    bookFascicleId: $(this).attr('data-fasciculeId'),
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
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
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