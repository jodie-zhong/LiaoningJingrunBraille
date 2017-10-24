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
         * 生成参数
         */
        getFormData: function () {
            var params = this._super();
            params.bookPath = undefined;
            params.bookFileName = undefined;
            // 文件列表
            params.fascicleList = [];
            this.$(".fileList").children().each(function () {
                var $em = $(this).find(".uploadFile");
                if ($em.val() && $em.attr("data-value")) {
                    params.fascicleList.push({
                        bookFileName: $em.val(),
                        bookPath: $em.attr("data-value")
                    });
                }
            });
            return params;
        },

        /**
         * 添加行
         */
        addTableRow: function () {
            var pt = this.$(".fileList");
            // 添加行
            pt.append(
                "<div class='row'>" +
                "  <div class='col-xs-12'>" +
                "    <div class='form-group'>" +
                "      <label class='col-xs-2 control-label'>录排文件</label>" +
                "      <div class='col-xs-6'>" +
                "        <div class='input-group with-clear'>" +
                "          <input class='form-control uploadFile' name='bookPath' placeholder='请选择文件' data-file='bookFileName' readonly>" +
                "          <span class='input-group-btn'>" +
                "            <button class='btn btn-clear' type='button' data-action='clear'><i class='fa fa-remove box'></i></button>" +
                "            <button style='padding-left: 15px;' class='btn btn-default' type='button' data-open='public/file/file-upload' data-data='{\"type\": \"*.doc;*.docx;*.pdf\"}'><i class='fa fa-file-o'></i></button>" +
                "          </span>" +
                "          <button style='margin: -25px 0 0 0;' class='btn btn-xs btn-default downloadFile' disabled>下载</button>" +
                "          <button style='margin: -25px 0 0 5px;' class='btn btn-xs btn-default preview' disabled>预览</button>" +
                "        </div>" +
                "      </div>" +
                "      <button style='margin: 7px 0 0 0;' class='removeRow btn btn-xs btn-danger'><i class='fa fa-minus box'></i></button>" +
                "    </div>" +
                "  </div>" +
                "</div>"
            );
            this.addValidateField(pt.find(".uploadFile:last-child"));
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
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
            // 是否打样切换监听
            this.$container.on('change', "input[name='isProofing']", function () {
                if (that.$("input[name='isProofing']:checked").val() === '1') {
                    that.$("#pageNumDiv").show();
                } else {
                    that.$("#pageNumDiv").hide();
                }
            });
            // 添加行
            this.$container.on('click', '.addRow', this.addTableRow.bind(this));
            // 删除行
            this.$container.on('click', '.removeRow', function () {
                $(this).parents('.row').remove();
            });
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
            // 是否打样初始化时显示切换
            if (this.$("input[name='isProofing']:checked").val() === '1') {
                this.$("#pageNumDiv").show();
            } else {
                this.$("#pageNumDiv").hide();
            }
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