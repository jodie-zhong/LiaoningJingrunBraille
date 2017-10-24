define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var DialogBase = require('../../../common/base-dialog');
    var listOut = require('./labor-management-edit-outList.tpl');
    var Module = DialogBase.extend(new function () {
        var that;
        var info;

        /**
         * 列表
         */
        function listDetail() {
            var params = {};
            if (info && info.currentId) {
                params.jobOutsideId = info.currentId;
            }
            util.showLoading();
            util.sendRequest({
                data: params,
                action: 'job/detailJobOutside.action',
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        that.$('#formJob').html(util.template(listOut, {list: resp.data}));
                        that.$('#formJob input').each(function () {
                            that.addValidateField($('#formJob'), $(this));
                        });
                    } else {
                        util.showAlert(resp.message || '查询人员出错，请稍后重试！');
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('查询人出错，请稍后重试！');
                }
            });
        }

        /**
         * 保存数据
         */
        function saveInfo() {
            // 表单验证
            var $form = that.$('#formJob');
            // 没有错误开始处理
            if (that.validate($form) === true) {
                // 通过公共方法生成表单参数
                var params = that.buildFormParams($form.find('input'));
                var action = 'job/createJobOutside.action';
                if (info && info.currentYear && info.currentMonth) {
                    params.jobOutsideYear = info.currentYear;
                    params.jobOutsideMonth = info.currentMonth;
                } else {
                    // 修改
                    action = 'job/modifyJobOutside.action';
                    params.jobOutsideId = info.currentId;
                }
                // 下发请求
                util.showLoading();
                util.sendRequest({
                    data: params,
                    action: action,
                    success: function (resp) {
                        util.hideLoading();
                        if (resp.code === 0) {
                            util.showAlert(resp.message || '录入成功!', function () {
                                that.close({refresh: true});
                            });
                        } else {
                            // 业务执行失败
                            console.log(resp);
                            util.showAlert(resp.message || '录入出错，请稍后重试！');
                        }
                    },
                    error: function (xhr) {
                        // XHR错误
                        util.hideLoading();
                        console.log(xhr);
                        util.showAlert('录入出错，请稍后重试！');
                    }
                });
            }
        }

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            // 保存
            that.$container.on('click', '#btnSave', saveInfo);
            that.$container.on('change', 'input[name="jobOutsideMoney"],input[name="jobOutsideTax"],input[name="jobOutsideRealMoney"]', function () {
                var $el = $(this)
                var price = $el.val();
                var bPrice = parseFloat(price).toFixed(2);
                if (isNaN(bPrice)) {
                    bPrice = '0.00';
                }
                $el.val(bPrice);
                var num = parseFloat(that.$('input[name="jobOutsideMoney"]').val()) - parseFloat(that.$('input[name="jobOutsideTax"]').val());
                that.$('input[name="jobOutsideRealMoney"]').val(num.toFixed(2));
            });
        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
            if (info && info.currentId) {
                listDetail();
            }
            that.initValidate(that.$('#formJob'));
        }

        /**
         * 初始化时被调用
         */
        this.onInit = function ($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);
            that = this;
            info = data;
            that.initTemplate(tpl, {});
            var obj = {};
            that.$('#formJob').html(util.template(listOut, {list: obj}));
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
