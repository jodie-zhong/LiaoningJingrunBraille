define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    // 工作流类窗口继承自工作流Base
    var Base = require('../../other/base/book-base');

    // var topicManageListTpl = require('./registration-records-list.tpl');

    var FLOW_COLLECT = 'collectFiles';                       // 收集文件
    var FLOW_RECORD = 'recordAudit';                         // 审核
    var FLOW_REGISTER = 'registration';	                     // 备案登记
    var FLOW_NO_RECORD = '备案登记书稿审核未通过';	         // 备案登记书稿审核未通过


    var Module = Base.extend(new function () {
        var that;

        this.deployKey = 'BrailleRegistration';

        // 与我相关
        this.searchTaskAbout = '1';
        // 其他搜索选项
        this.searchParams = {};

        this.flowInfoAction='common/searchBookFlowList.action';

        /**
         * 搜索任务列表的接口(覆盖父级)
         */
        // this.taskListAction= 'registration/searchRegistrationBookList.action';

        // 查询任务树中未完成任务数的接口
        // this.untreatedTaskAction = 'topic/unreadTopicCount.action';
        // // 选题任务列表接口
        // this.taskListActoin = 'topic/topicList.action';
        this.bookDate=null;

        /**
         * 选择行变更事件回调
         */
        this.onSelectRowChanged = function () {
            // 暂时啥也不做
        };

        this.onCheckRowChanged = function () {

            this.$('#btnRecordsSingle').attr('disabled', 'disabled');      // 处理
            this.$('#btnRecordsBatch').attr('disabled', 'disabled');       // 批量处理
            this.$('#btnReviewSearch').attr('disabled', 'disabled');       // 查看


            var count = 0, flowId = null, users = null, bookIds = [],taskIds=[],state=null;
            var collect = true, record = true, register=true,allMe = true,allUnfinished=true,stateFlow=true;
            var userId = util.getUserInfo().userId;
            that.$('#workListTBody').find('tr[checked]').each(function () {
                flowId = $(this).attr('data-flowId');
                state = $(this).find('td').last().text();
                users = $(this).attr('data-users') || '';
                users = users? users.split(','): [];
                // 包含非收集文件
                if(flowId !== FLOW_COLLECT){
                    collect = false;
                }
                // 包含非审核
                if(flowId !== FLOW_RECORD){
                    record = false;
                }
                // 包含非备案登记
                if(flowId !== FLOW_REGISTER){
                    register = false;
                }

                // 包含非备案登记书稿审核未通过
                if(state !== FLOW_NO_RECORD){
                    stateFlow = false;
                }

                // 待我处理
                if(users.indexOf(userId) <0){
                    allMe = false;
                }
                // 任务状态未完成
                if($(this).attr('data-taskState') === '2'){
                    allUnfinished = false;
                }

                bookIds.push($(this).attr('data-bookId'));
                taskIds.push($(this).attr('data-taskId'));
                count++;
            });

            this.currentBookId = bookIds.join(',');
            this.currentTaskId = taskIds.join(',');

            // 只选择了一条，处理和查看可用
            if(count === 1) {
                if((collect || record ||register ) && allUnfinished && allMe){
                    this.$('#btnRecordsSingle').removeAttr('disabled');
                }
                if(record ||register || stateFlow){
                    this.$('#btnReviewSearch').removeAttr('disabled');
                }
            }
            // 选择一条或多条
            if(count > 1 && allUnfinished && allMe){
                // 全部都是审核阶段
                if(record){
                    this.$('#btnRecordsBatch').removeAttr('disabled');
                }

            }
        };

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            // that.openPage('public/workflow/workflow-dialog', {
            //     debug: true,
            //     flowTemplate: 'review/review-first',
            //     isEdit: true
            // });

            // 处理
            that.$container.on('click', '#btnRecordsSingle', function() {
                var btnText=$(this).text();
                that.openPage('public/workflow/workflow-dialog', {
                    flowInfoAction: 'registration/searchFlowInfoList.action',
                    bookId: that.currentBookId,
                    bookTopicId: that.currentBookTopicId,
                    taskId: that.currentTaskId,
                    deployId: that.deployKey,
                    btnText:btnText
                });
            });

            // 批量处理
            that.$container.on('click', '#btnRecordsBatch', function() {
                var btnText=$(this).text();
                that.openPage('public/workflow/workflow-dialog', {
                    flowInfoAction: 'registration/searchFlowInfoList.action',
                    bookId: that.currentBookId,
                    bookTopicId: that.currentBookTopicId,
                    taskId: that.currentTaskId,
                    deployId: that.deployKey,
                    btnText:btnText
                });
            });

            // 查看
            that.$container.on('click', '#btnReviewSearch', function() {
                that.openPage('public/workflow/workflow-dialog', {
                    flowInfoAction: 'registration/searchFlowInfoList.action',
                    bookId: that.currentBookId,
                    taskId: that.currentTaskId,
                    deployId: that.deployKey,
                    isView: true
                });
            });
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
            // that.initTemplate(tpl, {});

            // 初始化数据前需要设置列表模板
            // this.listTpl = topicManageListTpl;

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