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
            if (data && data.taskId) {
                util.showLoading();
                util.sendRequest({
                    data: {
                        statisticsType:data.statisticsType,
                        searchYear:data.searchYear,
                        bookEditTprStatisticsId:data.bookEditTprStatisticsId,
                        bookId:data.bookId,
                        taskId: data.taskId
                    },
                    action: 'editing/searchStatisticsTaskDetail.action',
                    success: function (resp) {
                        if (resp.code === 0) {
                            setTimeout(function(){
                                util.hideLoading();
                                that.initTemplate(that.tpl, {info: resp.data});
                            }, 500);
                        } else {
                            util.hideLoading();
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