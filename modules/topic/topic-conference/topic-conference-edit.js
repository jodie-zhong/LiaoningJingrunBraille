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
        function saveConferenceInfo() {
            // 表单验证
            var $form = that.$('#formConferenceCreateEdit');
            // 没有错误开始处理
            if (that.validate($form) === true) {
                // 通过公共方法生成表单参数
                var params = that.buildFormParams($form.find('input'));
                var action = 'meeting/createMeeting.action';
                var actionName = '新增';

                if (info && info.topicMeetingId) {
                    action = 'meeting/modifyMeeting.action';
                    actionName = '修改';
                    params.topicMeetingId=info.topicMeetingId;
                }
                // 下发请求
                util.showLoading();
                util.sendRequest({
                    data: params,
                    action: action,
                    success: function (resp) {
                        util.hideLoading();
                        if (resp.code === 0) {
                            util.showAlert(actionName + '会议成功!',function () {
                                that.close({refresh:true});
                            });
                        } else {
                            // 业务执行失败
                            console.log(resp);
                            util.showAlert(resp.message || actionName + '会议出错，请稍后重试！');
                        }
                    },
                    error: function (xhr) {
                        // XHR错误
                        util.hideLoading();
                        console.log(xhr);
                        util.showAlert(actionName + '会议出错，请稍后重试！');
                    }
                });
            }
        }

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            // 保存
            that.$container.on('click', '#btnConferenceSave', saveConferenceInfo);
        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
            // 手动清空
            var firstdate,day,lastdate;
            var arr=[];
            // 限制当前月及下个月（修改时）
            if (info && info.topicMeetingId) {
                var str=info.topicMeetingDatetime
                arr=str.split("-");
                firstdate = arr[0] + '-' + arr[1] +'-' + '01'+ ' 00:00:00';
                day = new Date(arr[0],arr[1],0);
                lastdate = arr[0] + '-' + arr[1] + '-' + day.getDate() + ' 23:59:59';
            }else{  // 限制当前月及下个月（新增时）
                firstdate = info.year + '-' + info.month +'-' + '01'+ ' 00:00:00';
                day = new Date(info.year,info.month,0);
                lastdate = info.year + '-' + info.month + '-' + day.getDate() + ' 23:59:59';
            }
            that.$('input.date-time').datetimepicker({
                format: 'YYYY-MM-DD HH:mm:ss',
                locale: 'zh-cn',
                sideBySide: true,
                maxDate:lastdate,
                minDate:firstdate
            });
            if(!(info && info.topicMeetingId)){
                that.$('input.date-time').val('');
            }else {
                that.$('input.date-time').val(that.$('input.date-time').attr('data-timeValue'));
            }
            that.initValidate(that.$('#formConferenceCreateEdit'));
        }

        /**
         * 初始化时被调用
         */
        this.onInit = function ($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);
            that = this;
            info = data;
            console.log(info);
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

            if(data && data.name){
                this.$('input[name="taskUsers"]').attr('title',data.name);
            }
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
