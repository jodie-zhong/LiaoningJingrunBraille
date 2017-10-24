define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');

    /**
     * Workflow Item
     */
    module.exports = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'CNQuality/saveOrSubmitCNQuality.action',
        // 批量保存/提交接口
        batchSaveAction: '',
        // 查询接口
        detailAction: 'CNQuality/searchCNQualityDetail.action',

        /**
         * 印刷方式改变时界面切换
         */
        changeFlow: function () {
            this.$("div[data-area='nextFlow']").hide();
            if (this.$("input[name='handleState']:checked").val() === '1') {
                this.$("div[data-index='1']").show();
            } else {
                this.$("div[data-index='0']").show();
            }
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            // 印制方式切换
            this.$container.on("click", "input[name='handleState']", this.changeFlow.bind(this));
            // 预览
            this.$container.on("click", ".preview", function () {
                var address = $(this).attr("data-download-address");
                // 图片预览
                if (address.slice(-4) === '.png') {
                    // 预览
                    util.openPage('public/preview/html-preview', {url: util.getServerBase() + address});
                }
                // 文件预览
                else {
                    util.showLoading();
                    util.sendRequest({
                        data: {filePath: address},
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
                }
            });
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
            // 初始化印刷方式相关界面显示
            this.changeFlow();
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