define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');

    /**
     * Workflow Item
     */
    module.exports = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'cost/saveOrSubmitCost.action',
        // 批量保存/提交接口
        batchSaveAction: '',
        // 查询接口
        detailAction: 'cost/searchCostDetail.action',

        /**
         * 是否有问题切换显示
         */
        changeNextFlow: function () {
            this.$("div[data-area='nextFlow']").hide();
            if (this.$('input[name="handleState"]:checked').val() === '2') {
                this.$("div[data-index='1']").show();
            }
        },

        /**
         * 生成参数
         */
        getFormData: function () {
            var params = this._super();
            if (params.handleState === '1') {
                var entities = this.data.info.userTaskEntities;
                if (entities && entities.length > 0) {
                    params.flowId = entities[0].flowId;
                    params.flowName = entities[0].flowName;
                    params.nextCategory = entities[0].nextCategory;
                    params.deptIds = entities[0].deptIds;
                    params.roleIds = entities[0].roleIds;
                }
            }
            return params;
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            // 确认结果切换
            this.$container.on("change", "input[name='handleState']", this.changeNextFlow.bind(this));
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
            // 默认设置下一流程显示
            this.changeNextFlow();
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