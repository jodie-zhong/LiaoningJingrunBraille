define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var Base = require('../../../common/base-dialog');

    var Module = Base.extend(new function () {
        var that;

        /**
         * 初始化页面事件
         */
        function initPageEvent() {

        }

        /**
         * 初始化页面数据
         */
        function initPageData(data) {
            if (data && data.flowId) {
                var params = {
                    flowId: data.flowId,
                    taskId: data.taskId,
                    deploymentKey: data.deployKey,
                    searchBookId: data.bookId,
                    searchTopicId: data.topicId,
                };
                if(typeof data.searchFlowId !== 'undefined'){
                    params.searchFlowId=data.searchFlowId;
                }
                if(typeof data.searchIsbncipApplyId !== 'undefined'){
                    params.searchIsbncipApplyId=data.searchIsbncipApplyId;
                }
                if(typeof data.searchReprintBookAuditId !== 'undefined'){
                    params.searchReprintBookAuditId=data.searchReprintBookAuditId;
                }
                //样书
                if(typeof data.styleBookGetId !== 'undefined'){
                    params.styleBookGetId = data.styleBookGetId;
                }
                // 出版计划上报
                if(data.deployKey === 'Publication') {
                	params = {
                		taskId: data.taskId,
                		searchZPublishPlanReportId: data.bookId
                	}
                }
                util.showLoading();
                util.sendRequest({
                    data: params,
                    action: 'common/searchTaskDetail.action',
                    success: function (resp) {
                        if (resp.code === 0) {
                            setTimeout(function(){
                                util.hideLoading();
                                that.initTemplate(that.tpl, {info: resp.data});
                            }, 500);
                        } else {
                            util.hideLoading();
                            console.log(resp);
                            util.showAlert(resp.message || '查询流程详情出错，请稍后重试！');
                        }
                    },
                    error: function (xhr) {
                        // XHR错误
                        util.hideLoading();
                        console.log(xhr);
                        util.showAlert('查询流程详情出错，请稍后重试！');
                    }
                });
            }
        }

        /**
         * 初始化时被调用
         */
        this.onInit = function ($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);
            that = this;
            that.initTemplate(that.tpl, {info: {}});
            // 初始化页面事件
            initPageEvent();

            // 初始化页面数据
            initPageData(data);
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

    module.exports = Module;
});