define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var PageBase = require('../../../common/base-dialog');
    var listTpl = require('./select-topic-list.tpl');

    var Module = PageBase.extend(new function () {
        var that;
        var info = null;
        var currentReportId = '';
        var currentReportName = '';
        var a;
        var b;
        /**
         * 确定选择
         */
        function selectTopicCheck() {
            var ids = [],number=0;
            // 遍历所有TR
            that.$('#selectTopicTable').find('.fa-check-square-o').each(function () {
                var $el = $(this);
                var $parent=$el.parent().parent();
                ids.push($parent.attr("data-id"));
            });
            number=ids.length;
            var data = {
                topicIds: ids.join(','),
                operationTopicNum: number
            };
            data.topicReportId=currentReportId;
            data.topicReportName=currentReportName;
            if(number > 0 ){
                util.showLoading();
                util.sendRequest({
                    data:data,
                    action: 'report/addBookReport.action',
                    success: function (resp) {
                        util.hideLoading();
                        if (resp.code === 0) {
                            util.showAlert('添加选题成功!', function(){
                                that.close({renovate: true});
                            });
                        } else {
                            util.showAlert(resp.message || '添加选题出错，请稍后重试！');
                        }
                    },
                    error: function (xhr) {
                        // XHR错误
                        util.hideLoading();
                        console.log(xhr);
                        util.showAlert('查询选题列表出错，请稍后重试！');
                    }
                });
            }else {
                util.showAlert('请选择选题！');
            }
        }
        /**
         * 查询事件
         */
        function selectTopicSearch() {
            util.showLoading('正在查询权限列表……');
            var $queryConditions=$("#queryConditions");
            var params = {
                searchTopicDetailName: $queryConditions.val()
            };
            if(a){
                params[a]=b;
                params.sort='1';
            }
            util.sendRequest({
                data:params,
                action: 'report/searchTopicListNoPage.action',
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        that.$('#selectTopicContentTable i').removeClass('fa-check-square-o').addClass('fa-square-o');
                        that.$('#selectTopicTable').html(util.template(listTpl, {list: resp.data}));
                    } else {
                        util.showAlert(resp.message || '查询权限列表出错，请稍后重试！');
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('查询权限列表出错，请稍后重试！');
                }
            });
        }

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            // 排序
            that.makeSorting("#selectTopicContentTable",function () {
                that.$('#selectTopicContentTable .sorts').each(function () {
                    if ($(this).hasClass('sorting_desc')) {
                        a = $(this).attr('data-name');
                        b = '1';
                    } else if ($(this).hasClass('sorting_asc')) {
                        a = $(this).attr('data-name');
                        b = '2';
                    }
                });
                selectTopicSearch();
            });

            //添加选题选中事件
            // 列头全选按钮
            that.$container.on('click', '#selectTopicContentTable thead i[data-action="check"]', function() {
                var $el = $(this);
                var $tbody=that.$('#selectTopicTable');
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
            that.$container.on('click', '#selectTopicTable tr',function() {
                var $el = $(this);
                var $table=that.$('#selectTopicContentTable');
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
            that.$container.on('click', '#btnSearchTopic', selectTopicSearch);
            // 添加按钮
            that.$container.on('click', '#btnTopicCheckSelect', selectTopicCheck);
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
            that.initTemplate(tpl, {});
            //生成添加选题列表
            that.$('#selectTopicTable').html(util.template(listTpl,{
                list: data.data
            }));
            currentReportId=data.topicReportId;
            currentReportName=data.topicReportName;

            // var ids = [];
            // if(data && data.id){
            //     ids = data.id.split(',');
            // }

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