define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var DialogBase = require('../../../common/base-dialog');

    var Module = DialogBase.extend(new function () {
        var that;
        var info = null;

        /**
         * 保存数据
         */
        function saveRoleInfo() {
            // 表单验证
            var $form = that.$('#formRoleCreateEdit');
            // 没有错误开始处理
            if(that.validate($form) === true) {
                // 通过公共方法生成表单参数
                var params = that.buildFormParams($form.find('input'));
                var action = 'role/createRole.action';
                var actionName = '新增';

                if (info && info.roleId) {
                    action = 'role/modifyRole.action';
                    params.roleId = info.roleId;
                    actionName = '修改';
                }
                // 下发请求
                util.showLoading();
                util.sendRequest({
                    data: params,
                    action: action,
                    success: function (resp) {
                        util.hideLoading();
                        if (resp.code === 0) {
                            util.showAlert(actionName + '角色成功!', function () {
                                that.close({refresh: true});
                            });
                        } else {
                            // 业务执行失败
                            console.log(resp);
                            util.showAlert(resp.message || actionName + '角色出错，请稍后重试！');
                        }
                    },
                    error: function (xhr) {
                        // XHR错误
                        util.hideLoading();
                        console.log(xhr);
                        util.showAlert(actionName + '角色出错，请稍后重试！');
                    }
                });
            }
        }

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            // 保存
            that.$container.on('click', '#btnRoleSave', saveRoleInfo);

        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
            that.initValidate(that.$('#formRoleCreateEdit'));
        }

        /**
         * 初始化时被调用
         */
        this.onInit = function ($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);
            that = this;
            info = data;
            that.initTemplate(tpl, {info: data});
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