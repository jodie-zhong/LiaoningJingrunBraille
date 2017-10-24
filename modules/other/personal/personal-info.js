define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var Base = require('../../../common/base-dialog');

    //调渲染数据模板
    var infoTpl = require('./personal-info-list.tpl');
    var trainingList=require('./personal-info-training.tpl');

    var Module = Base.extend(new function () {
        var that;
        var info = null;
        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            // 个人信息修改
            that.$container.on('click', '#changeInfo', function() {
                that.$("#personInfos").hide();
                util.openPage('other/personal/personal-info-edit', {open: true});
            });
        }

        function personalInfoList() {
            util.showLoading('正在查询人员信息……');
            util.sendRequest({
                type: 'POST',
                data: {},
                action: 'user/detailLoginUser.action',
                success: function (resp) {
                    util.hideLoading();
                    console.log(resp);
                    if (resp.code === 0) {
                        if(resp.data.userHead){
                            resp.data.userHead = util.getResourceRoot() + resp.data.userHead;
                        }
                        that.$('#panelPersonInfo').html(util.template(infoTpl, {
                            info: resp.data
                        }));

                    } else {
                        util.showAlert(resp.message || '个人信息出错，请稍后重试！');
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('个人信息出错，请稍后重试！');
                }
            });
        }
        /**
         * 初始化页面数据
         */
        function initPageData() {
            personalInfoList();
            initPageDataTraining();
        }
        function initPageDataTraining() {
            util.sendRequest({
                type: 'POST',
                data: {},
                action: 'train/trainByUserList.action',
                success: function (resp) {
                    console.log(resp);
                    if (resp.code === 0) {
                         that.$('#panelPersonInfoTraining').html(util.template(trainingList, {
                         list: resp.data,
                         action: true
                         }));
                    } else {
                        util.showAlert(resp.message || '个人培训信息出错，请稍后重试！');
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('个人培训信息出错，请稍后重试！');
                }
            });

        }

        /**
         * 初始化时被调用
         */
        this.onInit = function ($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);
            that = this;
            that.initTemplate(tpl, {});

            // 初始化页面事件
            initPageEvent();

            // 初始化页面数据
            initPageData();

        };

        /**
         * 页面返回事件
         * @param data
         */
        this.onBack = function (data) {
            this._super(data);
            if(data && data.refresh === true) {
                $('#personInfos').show();
                personalInfoList();

                // 如果修改了用户信息，同时刷新主界面内容
                if(util.refreshUserInfo){
                    util.refreshUserInfo();
                }
            }

        };

        /**
         * 窗口缩放事件
         */
        this.onResize = function(){
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