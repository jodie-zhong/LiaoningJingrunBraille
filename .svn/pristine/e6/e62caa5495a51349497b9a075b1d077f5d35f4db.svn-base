define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var DialogBase = require('../../../common/base-dialog');

    var Module = DialogBase.extend(new function () {
        var that;
        var info = null;


        /**
         * 执行保存或提交操作
         */
        function doSave(params) {
            // 下发请求
            util.showLoading();
            util.sendRequest({
                data: params,
                action: 'editing/saveOrSubmitExamine.action',
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        util.showAlert(resp.message || '提交成功',function () {
                            that.close({refresh:true});
                        });
                    } else {
                        // 业务执行失败
                        console.log(resp);
                        util.showAlert(resp.message || '提交出错，请稍后重试！');
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('提交出错，请稍后重试！');
                }
            });
        }

        /**
         * 保存数据
         */
        function saveConferenceInfo(isTrue) {
            // 表单验证
            var $form = that.$('#formEdit');
            // 没有错误开始处理
            if (that.validate($form) === true) {
                // 通过公共方法生成表单参数
                var params = that.buildFormParams($form.find('input,textarea'));
                params.operationType=isTrue ? '2':'1';
                params.bookEditTprStatisticsId=info.bookEditTprStatisticsId;
                params.taskId=$form.find('input[name="taskId"]').val();
                params.taskUsers=$form.find('input[name="taskUsers"]').val();
                params.submitUserId=$form.find('input[name="submitUserId"]').val();
                if (isTrue) {
                    // 确认是否下发
                    util.showConfirm('确定要将本月所有数据提交么？', function () {
                      doSave(params);
                    });
                } else {
                      doSave(params);
                }
            }
        }


        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            // 保存
            that.$container.on('click', '#btnSave',function () {
                saveConferenceInfo(false);
            });

            // 提交
            that.$container.on('click', '#btnSubmit',function () {
                saveConferenceInfo(true);
            });
        }

        /**
         * 初始化页面数据
         */

        function initPageData() {
            that.initValidate(that.$('#formEdit'));
        }

        /**
         * 初始化时被调用
         */
        this.onInit = function ($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);

            that = this;
            info = data;
            that.initTemplate(tpl, {info:data.infoData});

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
