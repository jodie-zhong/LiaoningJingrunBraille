define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');

    /**
     * Workflow Item
     */
    module.exports = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'composing/submitOrUpdateComposing.action',
        // 批量保存/提交接口
        batchSaveAction: 'composing/batchComposing.action',
        // 查询接口
        detailAction: 'composing/searchComposingDetail.action',

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            // 文件上传监听
            this.$container.on('change', ".uploadFile", function () {
                var address = $(this).attr("data-value");
                var $downBtn = $(this).parent().find(".downloadFile");
                var $previewBtn = $(this).parent().find(".preview");
                if (address && address !== '') {
                    $downBtn.attr("data-download-address", address);
                    $downBtn.removeAttr("disabled");
                    $previewBtn.attr("data-download-address", address);
                    $previewBtn.removeAttr("disabled");
                } else {
                    $downBtn.removeAttr("data-download-address");
                    $downBtn.attr("disabled", "disabled");
                    $previewBtn.removeAttr("data-download-address");
                    $previewBtn.attr("disabled", "disabled");
                }
            });
            // 预览
            this.$container.on("click", ".preview", function () {
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
});