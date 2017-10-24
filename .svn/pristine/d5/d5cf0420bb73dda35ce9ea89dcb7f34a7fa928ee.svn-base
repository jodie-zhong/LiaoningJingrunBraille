define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');

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
                var obj = {
                    bookFascicleId: $(this).attr('data-fascicule-id'),
                    bookFascicleVersionNum: $(this).attr("data-bookFascicleVersionNum"),
                    bookFascicleCheckPage: $(this).find("input[name='bookFascicleCheckPage']").val(),
                    bookFascicleCheckProportion: $(this).find("input[name='bookFascicleCheckProportion']").val()
                };
                obj.bookFascicleCheckVersion = (obj.bookFascicleVersionNum / 100 * obj.bookFascicleCheckProportion).toFixed(2);
                params.bookFascicleEntities.push(obj);
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
            // 抽查比例输入监听
            this.$container.on("input", "input[name='bookFascicleCheckProportion']", function () {
                var $this = $(this);
                var $tr = $this.parents("tr");
                var r = $this.val() / 100 * $tr.attr("data-bookFascicleVersionNum");
                $tr.find("td[data-name='bookFascicleCheckVersion']").text(r.toFixed(2));
            });
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
            // 初始化抽查版数
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