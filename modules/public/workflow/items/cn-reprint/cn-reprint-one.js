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
        getFormData:function () {
            var $form = this.$('#formEdit');
            var params = {};
            // 审稿初审
            var handle=this.$('input[name="handleState"]:checked').val();
            params.handleState=handle;
            if(handle==='1'){
                $form.find('div[data-flow="cn_first"]').each(function () {
                    var $el=$(this);
                    params.handleContentTwo=$el.find('input[name="taskUsers"]').attr('data-value');
                });
            }
            $form.find('div[data-flow="rpt_firstTaskAllocation"]').each(function () {
                var $el=$(this);
                params.flowId=$el.find('input[name="flowId"]').val();
                params.flowName=$el.find('input[name="flowName"]').val();
                params.deptIds=$el.find('input[name="deptIds"]').val();
                params.roleIds=$el.find('input[name="roleIds"]').val();
                params.taskUsers=$el.find('input[name="taskUsers"]').attr('data-value');
                params.nextCategory=$el.find('input[name="nextCategory"]').val();
            });
            return params;
        },
        onHandleChange: function () {
            var handle = this.$('input[name="handleState"]:checked').val();
             if (handle === '2') {
                // 否
                 this.$('div[data-flow="cn_first"]').hide();
            }else{
                 this.$('div[data-flow="cn_first"]').show();
             }
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
            var $input=this.$('div[data-flow="cn_first"]').find('input[type="text"]');
            console.log(this.data.info)
            if(this.data.info.otherUserName){
                $input.val(this.data.info.otherUserName);
            }
            if(this.data.info.handleContentTwo){
                $input.attr('data-value',this.data.info.handleContentTwo);
            }
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

