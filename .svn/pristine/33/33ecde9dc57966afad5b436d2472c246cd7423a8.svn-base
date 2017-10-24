define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var DialogBase = require('../../../common/base-dialog');

    module.exports = DialogBase.extend(new function () {
        var that;
        var inParams;

        /**
         * 提交数据
         */
        function submitData() {
            // 表单验证
            var $form = that.$('#formDiv');
            // 没有错误开始处理
            if (that.validate($form)) {
                util.showConfirm('确定要提交么？', function () {
                    var params = {statisticsReportName: $("input[name='reportName']").val()};
                    if (!inParams.isAdd) {
                        params.statisticsReportId = inParams.reportId;
                    }
                    util.showLoading();
                    util.sendRequest({
                        type: 'POST',
                        data: params,
                        action: inParams.isAdd ? "statistics/addStatisticsReport.action" : "statistics/modifyStatisticsReport.action",
                        success: function (resp) {
                            // 请求成功（200）
                            util.hideLoading();
                            if (resp.code === 0) {
                                // 业务执行成功
                                util.showAlert(inParams.isAdd ? "新增成功！" : "修改成功！", function () {
                                    that.close({refreshReport: true});
                                });
                            } else {
                                // 业务执行失败
                                util.showAlert(resp.message || '操作失败，请稍后重试!');
                            }
                        },
                        error: function (xhr) {
                            // XHR错误
                            util.hideLoading();
                            console.log(xhr);
                            util.showAlert('操作失败，请稍后重试!');
                        }
                    });
                });
            }
        }

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            // 提交
            that.$container.on('click', '#btnSubmit', submitData);
        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
            that.initValidate(that.$('#formDiv'));
        }

        /**
         * 初始化时被调用
         */
        this.onInit = function ($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);
            that = this;
            inParams = $.extend({}, data);
            that.initTemplate(tpl, {inParams: inParams});
            // 初始化页面数据
            initPageData();
            // 初始化页面事件
            initPageEvent();
        };

        /**
         * 页面返回事件
         * @param data
         */
        this.onBack = function (data) {
            this._super(data);
        };

        /**
         * 窗口缩放事件
         */
        this.onResize = function () {
            this._super();
        };

        /**
         * 页面销毁
         */
        this.onDestroy = function () {
            this._super();
        };
    }());
});