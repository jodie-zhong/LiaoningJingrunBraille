define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');

    /**
     * Workflow Item
     */
    module.exports = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'reprintAudit/saveOrSubmitReprintAudit.action',
        // 查询接口
        detailAction: 'reprintAudit/searchReprintAuditDetail.action',

        /**
         * 生成参数
         */
        getFormData: function () {
            var params = this._super();
            // 盲文编译部部门负责人审核
            if (this.data.info.flowId === "rpt_editDeptHeadAudit") {
                params.taskUsers = this.$("input[name='handleState']:checked").val() === "1" ?
                    this.$("div[data-flow='rpt_editDeptLeaderAudit']").find("input[name='taskUsers'][type='hidden']").attr("data-value") :
                    this.$("div[data-flow='rpt_addReprint']").find("input[name='taskUsers'][type='text']").attr("data-value");
            }
            return params;
        },

        /**
         * 更改下一流程显示
         */
        changeNextFlow: function () {
            // 盲文编译部部门负责人审核
            if (this.data.info.flowId === "rpt_editDeptHeadAudit") {
                this.$("div[data-area='nextFlow']").hide();
                if (this.$("input[name='handleState']:checked").val() === "1") {
                    this.$("div[data-flow='rpt_editDeptLeaderAudit']").show();
                    this.$("div[data-task-user-area='unEditable']").show();
                    this.$("div[data-task-user-area='editable']").hide();
                } else {
                    this.$("div[data-flow='rpt_addReprint']").show();
                    this.$("div[data-task-user-area='unEditable']").hide();
                    this.$("div[data-task-user-area='editable']").show();
                }
            }
            // 盲文编译部分管社领导审核
            else if (this.data.info.flowId === "rpt_editDeptLeaderAudit") {
                this.$("div[data-area='nextFlow']").hide();
                if (this.$("input[name='handleState']:checked").val() === "1") {
                    this.$("div[data-flow='rpt_readDeptHeadAudit']").show();
                } else {
                    this.$("div[data-flow='rpt_editDeptHeadAudit']").show();
                }
                this.$("div[data-task-user-area='editable']").show();
                this.$("div[data-task-user-area='unEditable']").remove();// 直接删除，防止数据影响
            }
            // 读者服务部部门负责人审核
            else if (this.data.info.flowId === "rpt_readDeptHeadAudit") {
                this.$("div[data-area='nextFlow']").hide();
                if (this.$("input[name='handleState']:checked").val() === "1") {
                    this.$("div[data-flow='rpt_readDeptLeaderAudit']").show();
                } else {
                    this.$("div[data-flow='rpt_editDeptLeaderAudit']").show();
                }
                this.$("div[data-task-user-area='unEditable']").show();
                this.$("div[data-task-user-area='editable']").remove();// 直接删除，防止数据影响
            }
            // 读者服务部分管社领导审核
            else if (this.data.info.flowId === "rpt_readDeptLeaderAudit") {
                this.$("div[data-area='nextFlow']").hide();
                if (this.$("input[name='handleState']:checked").val() === "1") {
                    this.$("div[data-flow='rpt_libraryDeptHeadAudit']").show();
                } else {
                    this.$("div[data-flow='rpt_readDeptHeadAudit']").show();
                }
                this.$("div[data-task-user-area='editable']").show();
                this.$("div[data-task-user-area='unEditable']").remove();// 直接删除，防止数据影响
            }
            // 典藏借阅部部门负责人审核
            else if (this.data.info.flowId === "rpt_libraryDeptHeadAudit") {
                this.$("div[data-area='nextFlow']").hide();
                if (this.$("input[name='handleState']:checked").val() === "1") {
                    this.$("div[data-flow='rpt_libraryDeptLeaderAudit']").show();
                } else {
                    this.$("div[data-flow='rpt_readDeptLeaderAudit']").show();
                }
                this.$("div[data-task-user-area='unEditable']").show();
                this.$("div[data-task-user-area='editable']").remove();// 直接删除，防止数据影响
            }
            // 典藏借阅部分管社领导审核
            else if (this.data.info.flowId === "rpt_libraryDeptLeaderAudit") {
                this.$("div[data-area='nextFlow']").hide();
                if (this.$("input[name='handleState']:checked").val() === "1") {
                    this.$("div[data-flow='rpt_chiefDeptHeadAudit']").show();
                } else {
                    this.$("div[data-flow='rpt_libraryDeptHeadAudit']").show();
                }
                this.$("div[data-task-user-area='editable']").show();
                this.$("div[data-task-user-area='unEditable']").remove();// 直接删除，防止数据影响
            }
            // 总编室部门负责人审核
            else if (this.data.info.flowId === "rpt_chiefDeptHeadAudit") {
                this.$("div[data-area='nextFlow']").hide();
                if (this.$("input[name='handleState']:checked").val() === "1") {
                    this.$("div[data-flow='rpt_chiefDeptLeaderAudit']").show();
                } else {
                    this.$("div[data-flow='rpt_libraryDeptLeaderAudit']").show();
                }
                this.$("div[data-task-user-area='unEditable']").show();
                this.$("div[data-task-user-area='editable']").remove();// 直接删除，防止数据影响
            }
            // 总编室分管社领导审核
            else if (this.data.info.flowId === "rpt_chiefDeptLeaderAudit") {
                this.$("div[data-area='nextFlow']").hide();
                if (this.$("input[name='handleState']:checked").val() === "1") {
                    this.$("div[data-flow='rpt_printDeptHeadAudit']").show();
                } else {
                    this.$("div[data-flow='rpt_chiefDeptHeadAudit']").show();
                }
                this.$("div[data-task-user-area='editable']").show();
                this.$("div[data-task-user-area='unEditable']").remove();// 直接删除，防止数据影响
            }
            // 盲文印制部部门负责人审核
            else if (this.data.info.flowId === "rpt_printDeptHeadAudit") {
                this.$("div[data-area='nextFlow']").hide();
                if (this.$("input[name='handleState']:checked").val() === "1") {
                    this.$("div[data-flow='rpt_printDeptLeaderAudit']").show();
                } else {
                    this.$("div[data-flow='rpt_chiefDeptLeaderAudit']").show();
                }
                this.$("div[data-task-user-area='unEditable']").show();
                this.$("div[data-task-user-area='editable']").remove();// 直接删除，防止数据影响
            }
            // 盲文印制部分管社领导审核
            else if (this.data.info.flowId === "rpt_printDeptLeaderAudit") {
                this.$("div[data-area='nextFlow']").hide();
                if (this.$("input[name='handleState']:checked").val() === "1") {
                    this.$("div[data-flow='rpt_modifyCoverAndBook']").show();
                } else {
                    this.$("div[data-flow='rpt_printDeptHeadAudit']").show();
                }
                this.$("div[data-task-user-area='editable']").show();
                this.$("div[data-task-user-area='unEditable']").remove();// 直接删除，防止数据影响
            }
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            // 审核结果
            this.$container.on("change", "input[name='handleState']", this.changeNextFlow.bind(this));

        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
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