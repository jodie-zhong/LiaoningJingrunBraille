define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var DialogBase = require('../../../common/base-dialog');
    var SUBMIT_ACTION = 'tpr/saveOrSubmitTaskLead.action';

    module.exports = DialogBase.extend(new function () {
        var that;
        var info;

        /**
         * 保存或提交数据
         */
        function saveOrSubmitData(isSave) {
            // 表单验证
            var $form = that.$('#formDiv');
            // 没有错误开始处理
            if (that.validate($form)) {
                // 通过公共方法生成表单参数
                var params = that.buildFormParams($form.find('input'));
                params.operationType = isSave ? '1' : '2';
                params.taskStateName = '无';
                params.bookId = info.bookId;
                params.taskId = info.taskId;
                if (params.tprTaskGetState === '1' && info.userTaskEntities && info.userTaskEntities.length > 0) {
                    params.flowId = info.userTaskEntities[0].flowId;
                    params.flowName = info.userTaskEntities[0].flowName;
                } else if (info.userTaskEntities && info.userTaskEntities.length > 1) {
                    params.flowId = info.userTaskEntities[1].flowId;
                    params.flowName = info.userTaskEntities[1].flowName;
                }
                params.handleState = params.tprTaskGetState;
                params.handleStateName = params.handleState === '1' ? '接受' : '拒绝';
                params.tprTaskId = info.tprTaskId;
                params.tprTaskGetId = info.tprTaskGetId;
                params.tprTaskFlow = params.flowId;
                params.tprTaskFlowName = params.flowName;
                params.tprTaskContent = info.tprTaskContent;
                util.showLoading();
                util.sendRequest({
                    type: 'POST',
                    data: params,
                    action: SUBMIT_ACTION,
                    success: function (resp) {
                        // 请求成功（200）
                        util.hideLoading();
                        if (resp.code === 0) {
                            // 业务执行成功
                            util.showAlert('操作成功!', function () {
                                that.close({refresh: true});
                            });
                        } else {
                            // 业务执行失败
                            util.showAlert(resp.message || '操作失败!');
                        }
                    },
                    error: function (xhr) {
                        // XHR错误
                        util.hideLoading();
                        console.log(xhr);
                        util.showAlert('任务处理出错，请稍后重试!');
                    }
                });
            }
        }

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            // 保存
            that.$container.on('click', '#btnSave', function () {
                saveOrSubmitData(true);
            });
            // 提交
            that.$container.on('click', '#btnSubmit', function () {
                util.showConfirm('确定要提交么？', function () {
                    saveOrSubmitData(false);
                });
            });
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
            info = data;
            that.initTemplate(tpl, {info: data});
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