define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');

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
         * 生成参数
         */
        getFormData: function () {
            var params = {bookFascicleEntities: []};
            // table数据
            this.$('#dataTBody').children().each(function () {
                params.bookFascicleEntities.push({
                    bookFascicleId: $(this).attr('data-fascicule-id'),
                    tprQualityWordNum: $(this).find("input[name='tprQualityWordNum']").val(),
                    bookFascicleVersionNum: $(this).find("input[name='bookFascicleVersionNum']").val(),
                    bookFileName: $(this).find("input[name='uploadFile']").val(),
                    bookFileAddress: $(this).find("input[name='uploadFile']").attr('data-value')
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
            // 下载盲文文稿分册
            this.$container.on('click', '.downloadSeparated', function () {
                window.open(util.getServerBase() + 'common/downloadFile.action?path=' + encodeURIComponent($(this).attr('data-download-address')), '_blank');
            });
            // 文稿上传监听
            this.$container.on('change', "input[name='uploadFile']", function () {
                var address = $(this).attr("data-value");
                var downBtn = $(this).parents("tr").find(".downloadSeparated");
                if (address === '') {
                    downBtn.attr("disabled", "disabled");
                } else {
                    downBtn.removeAttr("disabled");
                }
                downBtn.attr("data-download-address", address);
            });
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