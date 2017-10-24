define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');

    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'cnReprint/saveOrSubmitCNReprint.action',

        // 查询接口
        detailAction: 'cnReprint/searchCNReprintDetail.action',

        onHandleChange: function () {
            var handle = this.$('input[name="handleState"]:checked').val();
            console.log(this.$('input[name="handleState"]:checked'));
            this.$('div[data-area="nextFlow"]').hide();
            console.log(handle);
            if (handle === '2') {
                // 放弃
                this.$('div[data-flow="rpt_copyrightPageAssignment"]').hide();
                this.$('div[data-flow="rpt_topicDeclaration"]').hide();
            } else if (handle === '1') {
                // 同意
                this.$('div[data-flow="rpt_copyrightPageAssignment"]').show();
                this.$('div[data-flow="rpt_topicDeclaration"]').show();
            }
        },
        getFormData:function () {
            var $form = this.$('#formEdit');
            var params = {};
            $form.find('div[data-area="nextFlow"]').each(function () {
                var $el=$(this);
                params.currentFlowId = 'rpt_departmentHeadAudit';
                params.deptIds=$el.find('input[name="deptIds"]').val();
                params.roleIds=$el.find('input[name="roleIds"]').val();
                params.taskUsers=$el.find('input[name="taskUsers"]').attr('data-value');
                params.nextCategory=$el.find('input[name="nextCategory"]').val();
            });
            params.bookList=[];
            params.bookList.push({
                taskUsers: $form.find('input[name="taskUsers"]').attr('data-value'),
                flowId: $form.find('input[name="flowId"]').val(),
                flowName: $form.find('input[name="flowName"]').val(),
                bookId: $form.find('input[name="bookId"]').val(),
                taskId: $form.find('input[name="taskId"]').val(),
                handleState: $form.find('input[name="handleState"]:checked').val(),
                auditContent: $form.find('textarea[name="auditContent"]').val(),
                deptDiscussContent: $form.find('textarea[name="deptDiscussContent"]').val(),
                hReprintBookAnditId: $form.find('input[name="hReprintBookAnditId"]').val(),
                inputState: '2',// 永远都传2
                hBookPrintState: $form.find('input[name="hBookPrintState"]').val(),
                parentBookId: $form.find('input[name="parentBookId"]').val(),
            });

            // if( params.bookList[0].handleState==='2'){// 表示放弃
            //     params.bookList[0].flowId='abandoned';
            // }
            return params;
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
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

