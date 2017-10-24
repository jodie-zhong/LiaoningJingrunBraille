
define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');

    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 提交接口
        saveAction: 'reprint/saveOrSubmitReprint.action',
        // 批量提交接口
        batchSaveAction: 'reprint/saveOrSubmitReprint.action',

        // 查询接口
        detailAction: 'reprint/searchReprintDetail.action',


        // // 重新生成序号
        // onWorkLoadNum: function() {
        //     var i = 1;
        //     this.$('#formEdit tr').each(function() {
        //         $(this).find('td[data-value="number"]').text(i++);
        //     });
        // },

        getFormData: function() {
            var that=this;
            // 先调用父类生成基本的数据结构
            var params = this._super();
            // 处理列表数据结构
            params.bookList = [];
            this.$('#formEdit tr').each(function() {
                if(that.data.info.sponsorDept!=='典藏借阅部'){
                    params.bookList.push({
                        bookId: $(this).attr('data-bookId'),
                        bookName: $(this).attr('data-name'),
                        libraryNeedNum: $(this).find('input[name="needNum"]').val(),
                        reprintLaunchRemarks: $(this).find('input[name="remark"]').val()
                    });
                }else{
                    params.bookList.push({
                        bookId: $(this).attr('data-bookId'),
                        bookName: $(this).attr('data-name'),
                        readersServiceNeedNum: $(this).find('input[name="needNum"]').val(),
                        reprintLaunchRemarks: $(this).find('input[name="remark"]').val()
                    });
                }
            });
            return params;
        },
        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            // var that = this;
            //删除（暂时去掉）
            // this.$container.on('click', 'button.delete', function () {
            //    $(this).parents('tr').remove();
            // //  重新生成序号
            //     that.onWorkLoadNum();
            // });
            this.workflowDialog.changeBtnState(1);
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

