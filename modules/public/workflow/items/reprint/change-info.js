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
        // 查询接口
        detailAction: 'reprint/searchReprintDetail.action',

        getFormData:function () {
            var $form = this.$('#formEdit');
            // 先调用父类生成基本的数据结构
            //var params = {};
            var params = this._super();
            // 处理上传部份数据结构
            var arr=[];
            $form.find('tr[data-type="ebook"]').each(function(){
                var $el=$(this);
                var obj={};
                // obj.bookFileId=$el.attr('data-bookFileId');
                obj.bookFascicleName=$el.find('.bookName').html();
                obj.bookFileType=$el.find('.bookFileType').html();
                obj.bookFileTypeCode=$el.find('.bookFileType').attr('data-bookFileTypeCode');
                obj.bookFileName=$el.find('.bookFileName').text();
                obj.bookFileAddress=$el.find('input.bookAddress').attr('data-value');
                arr.push(obj);
            });
            params.bookFascicleList=arr;
            return params;
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            this.$container.on('change','input.bookAddress',function () {
                var $el=$(this);
                var $parent=$el.parents('tr');
                var $btn=$parent.find('.btn-download');
                var $preview=$parent.find('.btn-preview');
                var ads=$el.attr('data-value');
                var adsName=$el.val();
                $parent.find('.bookFileName').text(adsName);
                $parent.find('.bookFileName').attr('title',adsName);
                $btn.attr('data-address',ads);
                $preview.attr('data-preview',ads);
                if($el.val()===''){
                    $btn.attr('disabled','disabled');
                    $preview.attr('disabled','disabled');
                }else {
                    $btn.removeAttr('disabled');
                    $preview.removeAttr('disabled');
                }
            });
            this.$container.on('click','.btn-download',function () {
                var $el=$(this);
                if($el.attr('data-address')){
                    var str=$el.parents('tr').find('.bookFileName').text();
                    if(str.indexOf('.') > 0){ //表明含有格式后缀
                        str=str.split('.')[0];
                    }
                    window.open(util.getServerBase() + 'common/downloadFile.action?path=' + encodeURIComponent($el.attr('data-address')) + '&bookFileName=' + encodeURIComponent(str), '_blank');
                }
            });
            this.$container.on('click','.btn-preview',function () {
                var $el=$(this);
                // 在此区分是不是.png格式的文件，是.png直接放到ifram里，不用向后台发请求，转成html的
                var $preview=$el.attr('data-preview');
                if($preview.slice(-4)==='.png' || $preview.slice(-4)==='.jpg' || $preview.slice(-5)==='.jpeg'){
                    // 预览
                    util.openPage('public/preview/html-preview', {
                        url: util.getServerBase() + $el.attr('data-preview')
                    });
                } else {
                    util.showLoading();
                    util.sendRequest({
                        data: {filePath:$el.attr('data-preview')},
                        action: 'common/coverPreview.action',
                        success: function(resp) {
                            util.hideLoading();
                            if(resp.code === 0) {
                                // 预览
                                util.openPage('public/preview/html-preview', {
                                    url: util.getServerBase() + resp.data
                                });
                            } else {
                                console.log(resp);
                                util.showAlert(resp.message || '预览出错，请稍后重试！');
                            }
                        },
                        error: function(xhr) {
                            // XHR错误
                            util.hideLoading();
                            util.showAlert('预览出错，请稍后重试！');
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

