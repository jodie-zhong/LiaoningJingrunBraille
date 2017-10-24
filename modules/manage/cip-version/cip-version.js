define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    // 工作流类窗口继承自工作流Base
    var Base = require('../../other/base/book-base');

    var topicCipListTpl = require('./cip-version-list.tpl');


    var FLOW_FINISHED='已完成';                                                        // 针对版署下发完状态
    var FLOW_APPLY='versionApply' ;                                                   // 版署申请
    var FLOW_ISBN='uploadISBNAndBarcode' ;                                            // 书号和条形码上传
    var FLOW_CLASS='uploadClassNumber' ;                                              // 分类号上传
    var FLOW_CIP='uploadCIPInfo' ;                                                    // CIP信息上传

    var Module = Base.extend(new function () {
        var that;

        var currentNames=null;
        this.deployKey = 'EditionApplyCIP';

        // 与我相关
        this.searchTaskAbout = '1';
        // 其他搜索选项
        this.searchParams = {};

        this.staticParams={
            searchBottomApply:''
        };

        // this.searchFlowListKey='bookId';

        this.flowInfoAction='cipEditionApply/listFlowInfo.action';


        /**
         * 搜索任务列表的接口(覆盖父级)
         */
        this.taskListAction= 'cipEditionApply/searchApplyList.action';

        this.treeName='申请';

        // 查询任务树中未完成任务数的接口
        // this.untreatedTaskAction = 'topic/unreadTopicCount.action';
        // // 选题任务列表接口
        // this.taskListActoin = 'topic/topicList.action';
        this.bookDate=null;

        /**
         * 树节点变更事件
         */
        this.onTreeNodeChanged = function(){
            var date = new Date();
            this.$('#btnCipAdd').attr('disabled', 'disabled');
            if(this.currentYear === date.getFullYear()){
                if(!this.currentMonth || this.currentMonth === (date.getMonth() + 1)){
                    this.$('#btnCipAdd').removeAttr('disabled');
                }
            }
        };

        /**
         * 选择行变更事件回调
         */
        this.onSelectRowChanged = function(){

        };

        this.onCheckRowChanged = function () {
            // 默认全部禁用
            this.$('#btnCipModify').attr('disabled', 'disabled');       // 修改
            this.$('#btnCipDelete').attr('disabled', 'disabled');       // 删除
            this.$('#btnCipSend').attr('disabled', 'disabled');         // 版署下发
            this.$('#btnCipSearch').attr('disabled', 'disabled');       // 删除

            var count = 0, flowId = null, users = null,finishedSend=null, bookIds = [],taskIds=[],names=[],applyIds=[];
            var apply = true, isbn = true,classNumber=true, CIPInfo = true, allMe = true, allUnfinished = true,finished=true;
            var userId = util.getUserInfo().userId;
            that.$('#workListTBody').find('tr[checked]').each(function () {
                flowId = $(this).attr('data-flowId');
                users = $(this).attr('data-users') || '';
                users = users? users.split(','): [];
                finishedSend= $(this).attr('data-isbncipApplyState');
                // 包含非版署申请
                if(flowId !== FLOW_APPLY){
                    apply = false;
                }
                // 包含非书号和条形码上传
                if(flowId !== FLOW_ISBN){
                    isbn = false;
                }
                // 包含非分类号上传
                if(flowId !== FLOW_CLASS){
                    classNumber = false;
                }
                // 包含非CIP信息上传
                if(flowId !== FLOW_CIP){
                    CIPInfo = false;
                }
                // 包含非已完成状态
                if(finishedSend !== FLOW_FINISHED){
                    finished = false;
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
                applyIds.push($(this).attr('data-isbncipApplyId'));
                taskIds.push($(this).attr('data-taskId'));
                names.push($(this).attr('data-bookName'));
                count++;
            });

            this.currentBookId = bookIds.join(',');
            this.currentApplyId = applyIds.join(',');
            this.currentTaskId = taskIds.join(',');
            currentNames=names.join(',');

            // 只选择了一条，修改、删除和版署下发可用
            if(count === 1) {
                if (apply && allMe && allUnfinished) {
                    this.$('#btnCipModify').removeAttr('disabled');       // 修改
                    this.$('#btnCipDelete').removeAttr('disabled');       // 删除
                }
                if (isbn || classNumber || CIPInfo ) {
                    this.$('#btnCipSearch').removeAttr('disabled');
                }
                if ((isbn || classNumber || CIPInfo) && (!finished) && allMe && allUnfinished ) {
                    this.$('#btnCipSend').removeAttr('disabled');
                }
            }

            // 选择一条或多条
            if(count >1){

                // 全部都是待申请状态
                // if(allMe && allUnfinished){
                //     // 删除可用
                //     this.$('#btnCipDelete').removeAttr('disabled');
                // }

                // 全部都是待申请状态
                if( apply && allUnfinished && allMe){
                    // 删除可用
                    this.$('#btnCipDelete').removeAttr('disabled');
                }
            }
        };

        /**
         * 初始化页面事件
         */
        function initPageEvent() {

            // 新增
            that.$container.on('click','#btnCipAdd',function () {
                util.showLoading();
                util.sendRequest({
                    data: {},
                    action: 'cipEditionApply/createOrModifyApplicationBefore.action',
                    success: function (resp) {
                        util.hideLoading();
                        if (resp.code === 0) {
                            that.openPage('manage/cip-version/cip-version-create', {});
                        } else {
                            console.log(resp);
                            util.showAlert(resp.message || '出错，请稍后重试！');
                        }
                    },
                    error: function (xhr) {
                        // XHR错误
                        util.hideLoading();
                        console.log(xhr);
                        util.showAlert('出错，请稍后重试！');
                    }
                });
            });

            // 修改
            that.$container.on('click','#btnCipModify',function () {
                that.openPage('manage/cip-version/cip-version-create', {info:that.currentApplyId});
            });

            // 删除
            that.$container.on('click','#btnCipDelete',function () {
                util.showConfirm('确定要将“' + currentNames + '”删除吗？', function(){
                    var params = {
                        isbncipApplyId: that.currentApplyId
                    };
                    util.showLoading();
                    util.sendRequest({
                        data: params,
                        action: 'cipEditionApply/removeApplication.action',
                        success: function(resp) {
                            util.hideLoading();
                            console.log(resp);
                            if (resp.code === 0) {
                                util.showAlert(resp.message || '上报删除成功！');
                                that.searchUntreatedTask();
                            } else{
                                util.showAlert(resp.message || '上报删除出错，请稍后重试！');
                            }
                        },
                        error: function(xhr) {
                            // XHR错误
                            util.hideLoading();
                            console.log(xhr);
                            util.showAlert('上报删除出错，请稍后重试！');
                        }
                    });
                });
            });

            // 版署下发
            that.$container.on('click','#btnCipSend',function () {
                var btnText=$(this).text();
                that.openPage('public/workflow/workflow-dialog', {
                    flowInfoAction: that.flowInfoAction,
                    bookId: that.currentBookId,
                    taskId: that.currentTaskId,
                    deployId: that.deployKey,
                    isbncipApplyId:that.currentApplyId,
                    btnText:btnText
                });
            });

            // 查看
            that.$container.on('click','#btnCipSearch',function () {
                that.openPage('public/workflow/workflow-dialog', {
                    flowInfoAction: that.flowInfoAction,
                    bookId: that.currentBookId,
                    taskId: that.currentTaskId,
                    deployId: that.deployKey,
                    isbncipApplyId:that.currentApplyId,
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
            this.baseTpl = topicCipListTpl;

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
            if(data && data.refresh === true){
                this.$('#btnCipModify').attr('disabled', 'disabled');       // 修改
                this.$('#btnCipDelete').attr('disabled', 'disabled');       // 删除
                this.$('#btnCipSend').attr('disabled', 'disabled');         // 版署下发
                this.$('#btnCipSearch').attr('disabled', 'disabled');         //查看
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