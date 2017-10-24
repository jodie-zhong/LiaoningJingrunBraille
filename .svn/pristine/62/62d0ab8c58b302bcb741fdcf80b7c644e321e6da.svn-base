define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var PageBase = require('../../../common/base-dialog');
    var listTpl = require('./select-conference-list.tpl');

    var Module = PageBase.extend(new function () {
        var that;
        var info = null;
        var currentConferenceId = '';
        var onOffOne=true;
        /**
         * 确定添加
         */
        function selectReportCheck() {
            var ids = [],number=0;
            // 遍历所有TR
            that.$('#selectReportTable').find('.fa-check-square-o').each(function () {
                var $el = $(this);
                var $parent=$el.parent().parent();
                ids.push($parent.attr("data-id"));
            });
            number=ids.length;
            var data = {
                topicReportIds: ids.join(','),
                operationNum: number
            };
            data.topicMeetingId=currentConferenceId;
            data.operationType='1';
            if(number > 0){
                util.sendRequest({
                    data:data,
                    action: 'meeting/addOrRemoveReport.action',
                    success: function (resp) {
                        util.hideLoading();
                        if (resp.code === 0) {
                            setTimeout(function () {
                                onOffOne=true;
                            },500);
                            util.showAlert('添加上报成功',function () {
                                //刷新页面
                                that.close({renovate:true});
                            });
                        } else {
                            util.showAlert(resp.message || '查询上报出错，请稍后重试！');
                        }
                    },
                    error: function (xhr) {
                        // XHR错误
                        util.hideLoading();
                        console.log(xhr);
                        util.showAlert('查询上报出错，请稍后重试！');
                    }
                });
            }else {
                onOffOne=true;
                util.showAlert('请选择上报');
            }
        }

        /**
         * 查询事件
         */
        function selectReportSearch() {
            util.showLoading('正在查询选题列表……');
            that.$('#selectTopicReportTable i').removeClass('fa-check-square-o').addClass('fa-square-o');
            var $serachele=$("#formSearchTopic")
            var params=that.buildFormParams($serachele.find('input'));
            util.sendRequest({
                type: 'POST',
                data:params,
                action: 'report/windowListReport.action',
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        that.$('#selectReportTable').html(util.template(listTpl, {list: resp.data.records}));
                    } else {
                        util.showAlert(resp.message || '查询列表出错，请稍后重试！');
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('查询列表出错，请稍后重试！');
                }
            });
        }
        //查看事件
        function bottomSearch() {
            var $el=$(this);
            var $parent=$el.parent().parent();
            var params={
                topicReportId:$parent.attr('data-id')
            };
            util.sendRequest({
                data: params,
                action: 'report/listTopicReport.action',
                success: function(resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        // util.showAlert(resp.message || '查看上报列表成功！');
                        that.openPage('topic/topic-conference/topic-conference-bottom-search', resp.data.records);
                    } else{
                        util.showAlert(resp.message || '查看上报列表出错，请稍后重试！');
                    }
                },
                error: function(xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('查看上报列表出错，请稍后重试！');
                }
            });
        }

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            //添加选题选中事件
            // 列头全选按钮
            that.$container.on('click', '#selectTopicReportTable thead i[data-action="check"]', function() {
                var $el = $(this);
                var $tbody=that.$('#selectReportTable');
                if($el.hasClass('fa-check-square-o')) {
                    // 取消全选
                    $el.removeClass('fa-check-square-o').addClass('fa-square-o');
                    $tbody.find('tr i[data-action="check"]').removeClass('fa-check-square-o').addClass('fa-square-o');
                } else {
                    // 全选
                    $el.removeClass('fa-square-o').addClass('fa-check-square-o');
                    $tbody.find('tr i[data-action="check"]').removeClass('fa-square-o').addClass('fa-check-square-o');
                }
            });

            // 勾选行
            that.$container.on('click', '#selectReportTable td:not(.reportSearch)',function() {
                var $el = $(this);
                var $table=that.$('#selectTopicReportTable');
                // 设置选择状态
                if($el.find('i[data-action="check"]').hasClass('fa-check-square-o')) {
                    $el.find('i[data-action="check"]').removeClass('fa-check-square-o').addClass('fa-square-o');
                } else {
                    $el.find('i[data-action="check"]').removeClass('fa-square-o').addClass('fa-check-square-o');
                }

                // 判断全选状态
                if($el.parents('tbody').find('i[data-action="check"]:not(.fa-check-square-o)').length === 0) {
                    $table.find('thead i[data-action="check"]').removeClass('fa-square-o').addClass('fa-check-square-o');
                } else {
                    $table.find('thead i[data-action="check"]').removeClass('fa-check-square-o').addClass('fa-square-o');
                }
            });
            //查询按钮
            that.$container.on('click', '#btnSearchReport', selectReportSearch);
            // 添加按钮
            that.$container.on('click', '#btnReportCheckSelect', function () {
                if(onOffOne){
                    onOffOne=false;
                    selectReportCheck();
                }
            });
            // 查看
            that.$container.on('click', '#selectReportTable .reportSearch',bottomSearch);
        }
        /**
         * 初始化页面数据
         */
        function initPageData() {

        }

        /**
         * 初始化时被调用
         */
        this.onInit = function ($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);
            that = this;
            info = data;
            onOffOne=true;
            that.initTemplate(tpl, {});
            that.$('input.date-time').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: 'zh-cn',
                sideBySide: true
            });
            //生成添加选题列表
            that.$('#selectReportTable').html(util.template(listTpl,{
                list: data.records
            }));
            currentConferenceId=data.topicReportId;


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