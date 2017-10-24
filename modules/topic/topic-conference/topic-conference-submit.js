define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var PageBase = require('../../../common/base-dialog');
    var Module = PageBase.extend(new function () {
        var that;
        var info=null;

        function onFlowSelectChange(){
            var $select = $(this);
            var deptIds = $select.val();

            // 全部隐藏
            $select.parents('tr').find('div[data-flow]').hide();
            $select.parents('tr').find('div[data-flow="'+ deptIds +'"]').show();
        }

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            // 点击提交按钮
            that.$container.on('click', '#btnConRegSubmit', function(){
                var $form = that.$('#formMeetingCreateEdit');
                if (that.validate($form) === true) {
                    util.showConfirm('确定要提交吗？', function () {
                        var obj = {};
                        var arrData = [];
                        // 把相同的数据设置相同的class
                        var noSameLength=that.$('#conSubListTable tr').last().attr('class');
                        var noArr=noSameLength.split('book-topic')[1];
                        var length = parseFloat(noArr)+1;
                        for (var i = 0; i < length; i++) {
                            var datas = [];
                            that.$('#conSubListTable').find('.book-topic' + i).each(function () {
                                var $el = $(this);
                                var params = {};
                                params.bookId = $el.find('td[data-bookId]').attr('data-bookId');
                                params.operationType = '2';
                                params.taskUsers = $el.find('input:visible').attr('data-value');
                                if ($el.find('select').length > 0) {// 用selece做判断
                                    params.deptIds = $el.find('select').val();
                                    params.bookDeploymentKey = 'CNContractEntry';
                                    params.flowId = 'cn_contractIssued';
                                    params.flowName = '下发';
                                } else {
                                    params.deptIds = $el.find('input').attr('data-ds');
                                    params.flowId = $el.find('input').attr('data-flowId');
                                    params.flowName = $el.find('input').attr('data-flowName');
                                }
                                params.roleIds = $el.find('input').attr('data-rs');
                                params.handleStateName = '通过';
                                datas.push(params);
                            });
                            var $bookTopic = that.$('.book-topic' + i);// 默认一个tr的class，把他数据作为依据
                            var params1 = {};
                            params1.topicId = $bookTopic.attr('data-id');
                            params1.taskId = $bookTopic.attr('data-taskId');
                            params1.topicMeetingId = info.topicMeetingId;
                            params1.meetingEntities = datas;
                            arrData.push(params1);
                        }
                        obj.submitMeetingEntities = arrData;
                        util.showLoading();
                        util.sendRequest({
                            data: obj,
                            action: 'meeting/submitMeeting.action',
                            success: function (resp) {
                                util.hideLoading();
                                if (resp.code === 0) {
                                    util.showAlert(resp.message || '提交会议成功！', function () {
                                        that.close({refresh: true});
                                    });
                                } else {
                                    console.log(resp);
                                    util.showAlert(resp.message || '提交会议出错，请稍后重试！');
                                }
                            },
                            error: function (xhr) {
                                // XHR错误
                                util.hideLoading();
                                console.log(xhr);
                                util.showAlert('提交会议出错，请稍后重试！');
                            }
                        });
                    });
                }
            });
            // 下一流程选择切换事件
            that.$container.on('change', 'select[name="deptIds"]',onFlowSelectChange);

        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
            // that.initValidate(that.$('#formMeetingCreateEdit'));
            that.$('select[name="deptIds"]').each(onFlowSelectChange);
        }

        /**
         * 初始化时被调用
         */
        this.onInit = function ($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);
            that = this;
            info=data;
            that.initTemplate(tpl, {list:data.records});
            that.initValidate(that.$('#formMeetingCreateEdit'));
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

