define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');

    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 保存/提交接口
        // saveAction: 'cipEditionApply/doSaveOrSubmitIssued.action',

        // 查询接口
        detailAction: 'cipEditionApply/doVersionIssued.action',

        onHandleChange: function ()  {

        },



        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;

            //下载事件
            that.$container.on('click', '#btnDownloadBook',function(){
                var cipApplyName=$('.cip-name').html();
                var arr=[],ids;
                that.$('#selectBookTable tr').each(function () {
                    var $el=$(this);
                    arr.push($el.attr('data-id'));
                })
                ids=arr.join(',')
                if(ids){
                    var url = util.getServerBase() + 'cipEditionApply/doDownload.action?';
                    url += 'bookIds=' + ids;
                    url += '&isbncipApplyName='+encodeURIComponent(cipApplyName);
                    window.open(url, '_blank');
                }
            });
            //查看事件
            that.$container.on('click', '#btnDetailBook',function () {
                var arr=[],ids;
                that.$('#selectBookTable tr').each(function () {
                    var $el=$(this);
                    arr.push($el.attr('data-id'));
                })
                ids=arr.join(',')
                if(ids){
                    util.sendRequest({
                        data: {
                            bookIds:ids
                        },
                        action: 'cipEditionApply/searchBookInfoList.action',
                        success: function (resp) {
                            console.log(resp);
                            if (resp.code === 0) {
                                util.openPage('manage/cip-version/cip-version-search',resp);
                            } else {
                                // 业务执行失败
                                util.showAlert(resp.message || '查询出错，请稍后重试！');
                            }
                        },
                        error: function (xhr) {
                            // XHR错误
                            console.log(xhr);
                            util.showAlert( '查询出错，请稍后重试！');
                        }
                    });
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

