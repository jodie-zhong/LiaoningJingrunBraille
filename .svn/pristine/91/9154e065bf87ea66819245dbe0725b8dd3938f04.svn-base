define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');

    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'bookPrinted/doSaveOrSubmitBookPrint.action',

        // 查询接口
        detailAction: 'bookPrinted/searchFlowInfoList.action',

        confirmMessage: '确定要将所有的数据都提交吗？',

        getFormData:function () {
            var $form = this.$('#formEdit');
            // 先调用父类生成基本的数据结构
//      	var params = {};
            var params = this._super();
            var arrPrint=[];
            $form.find('tr').each(function(){
                var $el=$(this);
                var obj={};
                obj.readersServiceneedNum=$el.find('input').val();
                obj.bookPrintDetailId=$el.attr("data-bookPrintDetailId");
                obj.bookId=$el.attr("data-bookId");
                arrPrint.push(obj);
            });
            if($('input[name="handleState"]:checked').val()==='1'){ // 通过
                params.taskUsers=$('input[name="roleIds"]').val();
            }else{
                params.taskUsers=$('input[name="roleIds"]').eq(1).val(); // 不通过
            }
            params.bookPrintList=arrPrint;
            params.handleState=$('input[name="handleState"]:checked').val();
            params.handleContentOne=$('textarea[name="handleContentOne"]').val();
            console.log(params);
            return params;
        },



        onHandleChange: function () {

            var handle = this.$('input[name="handleState"]:checked').val();

            this.$('div[data-area="nextFlow"]').hide();

            if (handle === '2') {
                // 不通过
                this.$('div[data-flow="submitAudit"]').show();
                // this.$('div[data-flow="submitAudit"]').show();

                this.$('#needNumber').hide();
            } else if (handle === '1') {
                // 通过
                this.$('div[data-flow="readerServicesCommunityLeaderAudit"]').show();
                this.$('#needNumber').show();
            }
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
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

