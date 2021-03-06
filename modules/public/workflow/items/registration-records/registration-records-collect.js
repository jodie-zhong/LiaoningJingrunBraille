define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');
    var printDialogTpl = require('./print-dialog.tpl');
    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'registration/saveOrSubmitRegistration.action',

        // 查询接口
        detailAction: 'registration/searchRegistrationDetail.action',

        /**
         * 打印发稿单
         */
        printInfo: function () {
            var that = this;
            util.showLoading('正在查询信息……');
            util.sendRequest({
                data: {bookId: that.data.info.bookId},
                action: 'clearManage/searchBill.action',
                success: function (resp) {
                    console.log(resp);
                    if (resp.code === 0) {
                        setTimeout(function () {
                            util.hideLoading();
                            util.openPage('public/print/print-preview', {
                                content: util.template(printDialogTpl, {info: resp.data}),
                                title: '打印发稿单'
                            });
                        }, 500);
                    } else {
                        util.hideLoading();
                        util.showAlert(resp.message || '信息出错，请稍后重试！');
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('信息出错，请稍后重试！');
                }
            });
        },

        getFormData:function () {
            var $form = this.$('#formEdit');
            // 先调用父类生成基本的数据结构
//      	var params = {};
            var params = this._super();
            // 处理上传部份数据结构
            var arr=[],arrId=[],arrName=[],arrAddress=[];
            $form.find('tr[data-type="ebook"]').each(function(){
                var obj={};
                var $el=$(this);
                obj.bookFascicleId=($el.attr('data-bookFascicleId'));
                obj.bookFileName=($el.find('.bookName').text());
                obj.bookFileType=($el.attr('data-bookFileType'));
                obj.bookFileAddress=($el.find('input.bookAddress').attr('data-value'));
                arr.push(obj);
            });
            params.bookFascicleEntities=arr;
            return params;
        },
        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
            // 打印发稿单
            this.$container.on('click', '.printManuscript', this.printInfo.bind(this));
            // 下载发稿单
            this.$container.on('click', '.downloadManuscript', function () {
                window.open(util.getServerBase() + 'clearManage/buildWord.action?bookId=' + that.data.info.bookId, '_blank');
            });

            this.$container.on('click','.btn-download',function () {
                var $el=$(this);
                var str=$el.parents('tr').find('.bookName').text();
                if(str.indexOf('.') > 0){ //表明含有格式后缀
                    str=str.split('.')[0];
                }
                window.open(util.getServerBase() + 'common/downloadFile.action?path=' + encodeURIComponent($el.attr('data-download')) + '&bookFileName=' + encodeURIComponent(str), '_blank');
            });

            // 预览
            this.$container.on('click','.btn-preview',function () {
                var $el=$(this);
                if($el.attr('data-preview')){
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


            this.$container.on('change', 'input.bookAddress', function(){
                var $el=$(this);
                var $parent=$el.parents('tr');
                var $btn=$el.parents('tr').find('.btn-download');
                var $preview=$el.parents('tr').find('.btn-preview');
                $btn.attr('data-download',$el.attr('data-value'));
                $preview.attr('data-preview',$el.attr('data-value'));
                if($el.val()===''){
                    $btn.attr('disabled','disabled');
                    $preview.attr('disabled','disabled');
                }else {
                    $btn.removeAttr('disabled');
                    $preview.removeAttr('disabled');
                }
               $parent.find('.bookName').text($el.val().split('.')[0]);

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

