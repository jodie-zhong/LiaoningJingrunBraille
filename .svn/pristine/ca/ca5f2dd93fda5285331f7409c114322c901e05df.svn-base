define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util.js');
    // 工作流类窗口继承自工作流Base
    var Base = require('../../other/base/book-base');

    var topicManageListTpl = require('./cip-apply-list.tpl');

    var FLOW_ISDN_CIP = 'cn_applyCIP';                               // 提交申请
    var FLOW_SIGN = 'cn_cipSign';                                    // 签发
    var FLOW_INFO = 'cn_cipInfo';	                                // 书号和CIP号信息
    var FLOW_ISSUED = 'cn_cipIssued';	                            // 下发
    var FLOW_FAILURE = 'cn_failureApply';	                        // 未通过处理
    var FLOW_REGISTER = 'cn_changeRecord';	                        // 备案登记确认

    var Module = Base.extend(new function () {
        var that;

        // 查询任务树中未完成任务数的接口
        // this.untreatedTaskAction = 'topic/unreadTopicCount.action';

        this.deployKey = 'CNCIP';

        // 与我相关
        this.searchTaskAbout = '1';
        // 其他搜索选项
        this.searchParams = {};


        this.flowInfoAction='common/searchBookFlowList.action';

        /**
         * 搜索任务列表的接口(覆盖父级)
         */
        // this.taskListAction= 'cipApply/searchBookList.action';

        this.treeName='图书';

        /**
         * 选择行变更事件回调
         */
        this.onSelectRowChanged = function(){
            // params[this.searchFlowListKey] = this.currentId;
        };

        this.onCheckRowChanged = function () {
            // 默认全部禁用

            this.$('#btnCipSingle').attr('disabled', 'disabled');        // 处理
            this.$('#btnCipBatch').attr('disabled', 'disabled');         // 批量处理
            this.$('#btnCipSearch').attr('disabled', 'disabled');        // 查看

            var count = 0, flowId = null, users = null, bookIds = [],taskIds=[];
            var cipApply = true,cipSign=true,cIPInfo=true, issued=true,failure=true,changeRecord=true,allMe = true, allUnfinished = true;
            var userId = util.getUserInfo().userId;
            that.$('#workListTBody').find('tr[checked]').each(function () {
                flowId = $(this).attr('data-flowId');
                users = $(this).attr('data-users') || '';
                users = users? users.split(','): [];
                // 包含非提交申请
                if(flowId !== FLOW_ISDN_CIP ){
                    cipApply=false;
                }
                // 包含非签发
                if(flowId !==FLOW_SIGN ){
                    cipSign=false;
                }
                // 包含非书号和CIP号信息
                if(flowId !== FLOW_INFO){
                    cIPInfo=false;
                }
                // 包含非下发
                if(flowId !== FLOW_ISSUED ){
                    issued=false;
                }
                // 包含非未通过处理
                if(flowId !== FLOW_FAILURE ){
                    failure=false;
                }
                // 包含非备案登记确认
                if(flowId !== FLOW_REGISTER){
                    changeRecord=false;
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

            // 只选择了一条，处理（对应该模块所有的flowid状态）可用
            if(count === 1 ) {
                if((cipApply || cipSign|| issued || cIPInfo|| failure|| changeRecord ) && allUnfinished && allMe){
                    this.$('#btnCipSingle').removeAttr('disabled');
                }

                // 查看可用
                if(  cipSign|| issued || cIPInfo|| failure|| changeRecord ){
                    this.$('#btnCipSearch').removeAttr('disabled');
                }
            }
            // 选择一条或多条
            if (count > 1 && allUnfinished && allMe) {
                if (( cipSign ) && allUnfinished && allMe ) {
                    this.$('#btnCipBatch').removeAttr('disabled');
                }
            }
        };

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            // that.openPage('public/workflow/workflow-dialog', {
            //     debug: true,
            //     flowTemplate: 'cn-cip-apply/cip-apply-issuance',
            //     isEdit: true
            // });

            // 处理
            that.$container.on('click', '#btnCipSingle,#btnCipBatch', function () {
                var btnText=$(this).text();
                that.openPage('public/workflow/workflow-dialog', {
                    flowInfoAction: that.flowInfoAction,
                    bookId: that.currentBookId,
                    taskId: that.currentTaskId,
                    deployId: that.deployKey,
                    btnText:btnText
                });
            });

            // 查看
            that.$container.on('click', '#btnCipSearch', function () {
                that.openPage('public/workflow/workflow-dialog', {
                    flowInfoAction: that.flowInfoAction,
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
            this.baseTpl = topicManageListTpl;

            // 初始化页面事件
            initPageEvent();

            // 初始化页面数据
            initPageData();

            // TODO: 测试
            // that.openPage('public/workflow/workflow-dialog', {});
            // that.openPage('public/file/file-upload', {});
        };

        /**
         * 页面返回事件
         * @param data
         */
        this.onBack = function (data) {
            this._super(data);
            if(data && data.refresh===true){
                this.$('#btnCipSingle').attr('disabled', 'disabled');        // 处理
                this.$('#btnCipBatch').attr('disabled', 'disabled');         // 批量处理
                this.$('#btnCipSearch').attr('disabled', 'disabled');        // 查看
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