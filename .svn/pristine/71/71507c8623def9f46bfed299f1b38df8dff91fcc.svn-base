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
         * 生成参数
         */
        getFormData: function () {
            var params = this._super();
            params.fileList = [];
            // table数据
            this.$('#dataTBody').children().each(function () {
                params.fileList.push({
                    bookFascicleId: $(this).attr('data-bookFascicleId'),
                    hBookFileName: $(this).find(".uploadFile").val(),
                    hBookFileAddress: $(this).find(".uploadFile").attr('data-value')
                });
            });
            // 下一流程信息
            if (this.data.info.userTaskEntities && this.data.info.userTaskEntities.length > 0) {
                params.flowId = this.data.info.userTaskEntities[0].flowId;
            }
            return params;
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            // 在线设计
            this.$container.on("click", ".design-online", function () {
                var $designBtn = $(this);
                window.designerCallback = function (resp) {
                    if (resp.code === 0) {
                        var $input = $designBtn.parents("tr").find(".uploadFile");
                        $input.attr("data-value", resp.data.address);
                        $input.attr("title", resp.data.name);
                        $input.val(resp.data.name);
                        var $downloadBtn = $designBtn.parents("tr").find(".downloadFile");
                        $downloadBtn.attr("data-download-address", resp.data.address);
                        $downloadBtn.removeAttr("disabled");
                        var $previewBtn = $designBtn.parents("tr").find(".preview");
                        $previewBtn.attr("data-download-address", resp.data.address);
                        $previewBtn.removeAttr("disabled");
                    }
                };
                window.open('designer/designer.html', '_blank');
            });
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