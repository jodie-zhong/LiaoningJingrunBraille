define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');
    var printDialogTpl = require('./print-dialog.tpl');

    /**
     * Workflow Item
     */
    module.exports = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'quality/saveOrSubmitQuality.action',
        // 批量保存/提交接口
        batchSaveAction: 'quality/batchQuality.action',
        // 查询接口
        detailAction: 'quality/searchQualityTestDetail.action',

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
                    console.log(xhr);
                    // XHR错误
                    util.hideLoading();
                    util.showAlert('信息出错，请稍后重试！');
                }
            });
        },

        /**
         * 预览
         */
        preview: function () {
            util.showLoading();
            util.sendRequest({
                data: {filePath: $(this).attr('data-download-address')},
                action: 'common/coverPreview.action',
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        util.openPage('public/preview/html-preview', {url: util.getServerBase() + resp.data});
                    } else {
                        console.log(resp);
                        util.showAlert(resp.message || '预览出错，请稍后重试！');
                    }
                },
                error: function (xhr) {
                    console.log(xhr);
                    // XHR错误
                    util.hideLoading();
                    util.showAlert('预览出错，请稍后重试！');
                }
            });
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
            // 打印发稿单
            this.$container.on('click', '.printManuscript', this.printInfo.bind(this));
            // 下载分册
            this.$container.on('click', '.downloadSeparated', function () {
                var $el=$(this);
                var str=$el.parents('tr').find('.bookFileName').text();
                if(str.indexOf('.') > 0){ //表明含有格式后缀
                    str=str.split('.')[0];
                }
                window.open(util.getServerBase() + 'common/downloadFile.action?path=' + encodeURIComponent($(this).attr('data-download-address')) + '&bookFileName=' + encodeURIComponent(str), '_blank');
            });
            // 下载发稿单
            this.$container.on('click', '.downloadManuscript', function () {
                window.open(util.getServerBase() + 'clearManage/buildWord.action?bookId=' + that.data.info.bookId, '_blank');
            });
            // 预览
            this.$container.on("click", ".preview", this.preview);
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
});