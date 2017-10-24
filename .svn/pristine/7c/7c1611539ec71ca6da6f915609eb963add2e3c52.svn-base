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
         * 是否打样切换显示
         */
        changeIsProofing: function () {
            if (this.$("input[name='isProofing']:checked").val() === '2') {
                this.$("#pageNumDiv").show();
            } else {
                this.$("#pageNumDiv").hide();
            }
        },

        /**
         * 生成参数
         */
        getFormData: function () {
            var params = this._super();
            params.fileList = [];
            // table数据
            this.$('#dataTBody').children().each(function () {
                params.fileList.push({
                    bookFascicleId: $(this).attr('data-fasciculeId'),
                    hTaskPageNum: $(this).find("input[name='hTaskPageNum']").val(),
                    hBookFileName: $(this).find(".uploadFile").val(),
                    hBookFileAddress: $(this).find(".uploadFile").attr('data-value')
                });
            });
            return params;
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            // 是否打样切换监听
            this.$container.on('change', "input[name='isProofing']", this.changeIsProofing.bind(this));
            // 文件上传监听
            this.$container.on('change', ".uploadFile", function () {
                var address = $(this).attr("data-value");
                var $downBtn = $(this).parents("tr").find(".downloadFile");
                var $previewBtn = $(this).parents("tr").find(".preview");
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
            // 初始化是否打样显示
            this.changeIsProofing();
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