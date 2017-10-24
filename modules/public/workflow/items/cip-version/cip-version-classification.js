define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');

    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'cipEditionApply/doSaveOrSubmitIssued.action',

        // 查询接口
        detailAction: 'cipEditionApply/doVersionIssued.action',

        onHandleChange: function ()  {

        },

        getFormData:function () {
            var $form = this.$('#formCioIssuedEdit');
            // 先调用父类生成基本的数据结构
     	    // var params = {};
            var params = this._super();
            var CipApplyList=[];
            this.$('#selectIssuedTable tr').each(function () {
                var $el=$(this);
                var cipList = {};
                cipList.bookDetailClassNum=$el.find('input[name="bookDetailClassNum"]').val();
                cipList.bookId=$el.attr('data-id');
                cipList.taskId=$el.attr('data-taskId');
                cipList.bookTypeCode=$el.attr('data-bookTypeCode');
                CipApplyList.push(cipList);
            });
            params.bookNameList=CipApplyList;
            return params;
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;

            that.$container.on('click','button',function () {
                if($(this).attr('data-download')){
                    window.open(util.getServerBase() + 'common/downloadFile.action?path=' + encodeURIComponent($(this).attr('data-download')), '_blank');
                }
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


    module.exports = Item;

});

