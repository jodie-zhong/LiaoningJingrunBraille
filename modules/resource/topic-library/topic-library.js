define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var PageBase = require('../../../common/base-page');
    //列表界面模板
    var listTpl = require('./topic-library-list.tpl');
    // require('../../../assets/plugins/icheck/icheck.min');
    // require('../../../assets/plugins/icheck/skins/minimal/blue.css');

    module.exports = PageBase.extend(new function () {
        var that;
        // 当前页数
        var currentPage = 1;
        var topId = null;
        var taskId = null;
        var flowInfoAction = 'topic/listFlowInfo.action';
        var params = {};
        var topicSP = '0';

        /**
         *  列表
         */
        function CrowdSourceList() {
            that.$('#btnFlow').attr('disabled', 'disabled');
            that.$('#btnRecord').attr('disabled', 'disabled');
            util.showLoading();
            params.page = currentPage;
            util.sendRequest({
                data: params,
                action: 'topicLibrary/searchTopicLibraryList.action',
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        that.$('#crowdSourceList').html(util.template(listTpl, {
                            list: resp.data.records
                        }));
                        // 分页数据
                        that.$('#crowdSourceListPaging').html(that.buildPagination(resp.data.pageNow, resp.data.pageCount));
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

        /**
         * 跳转页面
         */
        function jumpPage() {
            var $el = $(this);
            var page = $el.attr('data-page');
            if (page) {
                // 修改页面后重新刷新页面数据
                currentPage = page;
                CrowdSourceList();
            }
        }

        function makeCheckTable(tableId, checkCallback) {
            that.$container.on('click', tableId + ' tbody td', function () {
                var $el = $(this);
                if ($el.attr('data-check')) {
                    // 单选
                    // 去掉所有选择状态
                    $el.parents('tbody').find('i[data-action="check"]').removeClass('fa-dot-circle-o').addClass('fa-circle-o');
                    $el.parents('tbody').find('tr').removeAttr('checked');
                    // 增加当前行选择状态
                    $el.find('i[data-action="check"]').removeClass('fa-circle-o').addClass('fa-dot-circle-o');
                    $el.parent().attr('checked', 'checked');
                }
                if (checkCallback) {
                    checkCallback();
                }
            });
        }

        /**
         * 选中事件
         */
        function checkFn() {
            var numOne,numTwo,numThree ;
            that.$('#crowdSourceList').find('tr[checked]').each(function () {
                topId = $(this).attr('data-topicid');
                topicSP = $(this).attr('data-topicSelectProperty');
                numOne=$(this).attr('data-overTaskNumTopic');
                numTwo=$(this).attr('data-overTaskNumBig');
                numThree=$(this).attr('data-overTaskNumImported');
            });
            if ( numOne && numOne !== '0') {
                that.$('#btnFlow').removeAttr('disabled');
            }else {
                that.$('#btnFlow').attr('disabled','disabled');
            }
            if ( (numTwo && numTwo !== '0') ||( numThree && numThree !== '0' ) ) {
                that.$('#btnRecord').removeAttr('disabled');
            }else {
                that.$('#btnRecord').attr('disabled','disabled');
            }

        }

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            // 选中事件
            makeCheckTable("#crowdSourceTable", checkFn);
            // 流程信息
            that.$container.on('click', '#btnFlow', function () {
                that.openPage('public/workflow/workflow-dialog', {
                    flowInfoAction: flowInfoAction,
                    topicId: topId,
                    taskId: taskId,
                    deployId: 'BrailleTopic',
                    isView: true
                });
            });
            // 备案信息
            that.$container.on('click', '#btnRecord', function () {
                var depKey = topicSP;
                if (depKey === '2') {
                    depKey = 'BrailleBigTopicRecord';
                } else if (depKey === '3') {
                    depKey = 'BrailleImportedTopicRecord';
                }
                that.openPage('public/workflow/workflow-dialog', {
                    flowInfoAction: flowInfoAction,
                    topicId: topId,
                    taskId: taskId,
                    deployId: depKey,
                    isView: true
                });
            });
            // 分页
            that.$container.on('click', '#crowdSourceListPaging a', jumpPage);

            // 列表上的搜索按钮
            that.$container.on('click', '#btnSearch', function () {
                params = that.buildSearchParams(that.$('.form-horizontal' +
                    ' input[data-search],select[data-search]'));
                currentPage = 1;
                CrowdSourceList();
            });
        }

        /**
         * 初始化选题类别
         */
        function searchBookType() {
            util.sendRequest({
                data: {
                    'code': '0003'
                },
                action: 'common/searchCodeValue.action',
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        var $typeOneElement = that.$('select[data-type = "machineBook"]'),
                            $dom;
                        for (var i in resp.data) {
                            if (resp.data.hasOwnProperty(i)) {
                                $dom = $('<option></option>');
                                $dom.text(resp.data[i]);
                                $dom.val(i);
                                $typeOneElement.append($dom);
                            }
                        }
                    } else {
                        console.log(resp);
                        util.showAlert(resp.message || '查询选题类别出错，请稍后重试！');
                    }
                },
                error: function (xhr) {

                }
            });
        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
            // 选题类别字典表
            searchBookType();
            // 众包列表
            CrowdSourceList();
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