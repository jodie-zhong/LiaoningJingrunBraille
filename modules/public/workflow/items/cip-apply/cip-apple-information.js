define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');

    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'cipApply/saveOrSubmitApply.action',

        // 查询接口
        detailAction: 'cipApply/searchApplyDetail.action',

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
            that.$container.on('click','button.address',function () {
                if($(this).attr('data-address')){
                    window.open(util.getServerBase() + 'common/downloadFile.action?path=' + encodeURIComponent($(this).attr('data-address')), '_blank');
                }
            });

            that.$container.on('click','button.cip-address',function () {
                var $el=$(this);
                if($el.attr('data-id')){
                    window.open(util.getServerBase() + 'cipApply/downloadCipInfo.action?bookId=' + encodeURIComponent($el.attr('data-id')), '_blank');
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

