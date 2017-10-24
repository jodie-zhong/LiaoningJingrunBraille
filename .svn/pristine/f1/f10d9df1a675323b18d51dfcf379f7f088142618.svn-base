define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util.js');
    // 工作流类窗口继承自工作流Base
    var Base = require('../../other/base/task-base');

    var topicManageListTpl = require('./reprint-audit-list.tpl');

    var FLOW_ADD_REPRINT = 'rpt_addReprint';                               // 新增重印
    var FLOW_ED_HEAD = 'rpt_editDeptHeadAudit';                            // 盲文编译部部门负责人审核
    var FLOW_ED_LEADER = 'rpt_editDeptLeaderAudit';	                       // 盲文编译部分管社领导审核
    var FLOW_RE_HEAD = 'rpt_readDeptHeadAudit';	                           // 读者服务部部门负责人审核
    var FLOW_RE_LEADER = 'rpt_readDeptLeaderAudit';	                       // 读者服务部分管社领导审核
    var FLOW_LI_HEAD = 'rpt_libraryDeptHeadAudit';	                       // 典藏借阅部部门负责人审核
    var FLOW_LI_LEADER = 'rpt_libraryDeptLeaderAudit';                     // 典藏借阅部分管社领导审核
    var FLOW_CH_HEAD = 'rpt_chiefDeptHeadAudit';	                       // 总编室部门负责人审核
    var FLOW_CH_LEADER = 'rpt_chiefDeptLeaderAudit';	                   // 总编室分管社领导审核
    var FLOW_PR_HEAD = 'rpt_printDeptHeadAudit';	                       // 盲文印制部部门负责人审核
    var FLOW_PR_LEADER = 'rpt_printDeptLeaderAudit';	                   // 盲文印制部分管社领导审核


    var Module = Base.extend(new function () {
        var that;


        this.deployKey = 'ReprintAuditBraille';

        // 与我相关
        this.searchTaskAbout = '1';
        // 其他搜索选项
        this.searchParams = {};
        this.staticParams={
            searchReprintBookAuditId:''
        };

        this.flowInfoAction = 'common/searchBookFlowList.action';

        /**
         * 搜索任务列表的接口(覆盖父级)
         */
        // this.taskListAction= 'cipApply/searchBookList.action';

        this.treeName = '重印图书';

        /**
         * 树节点变更事件
         */
        this.onTreeNodeChanged = function () {
            var date = new Date();
            this.$('#btnTopicAdd').attr('disabled', 'disabled');
            if (this.currentYear === date.getFullYear()) {
                if (this.currentMonth === (date.getMonth() + 1)) {
                    this.$('#btnTopicAdd').removeAttr('disabled');
                }
            }
        };
        /**
         * 选择行变更事件回调
         */
        this.onSelectRowChanged = function () {

        };

        this.onCheckRowChanged = function () {
            // 默认全部禁用
            this.$('#btnTopicDelete').attr('disabled', 'disabled');// 删除
            this.$('#btnTopicModify').attr('disabled', 'disabled');// 修改
            this.$('#btnTopicView').attr('disabled', 'disabled');// 查看
            this.$('#btnTopicHandle').attr('disabled', 'disabled');// 处理

            var count = 0, flowId = null, users = null, bookIds = [], reprintId = [], taskIds = [], names = [];
            var addReprint = true, edHead = true, edLeader = true, reHead = true, reLeader = true, liHead = true, liHeader = true, chHead = true, chHeader = true, prHead = true, prHeader = true, allMe = true, allUnfinished = true, allNum = true;
            var userId = util.getUserInfo().userId;
            that.$('#workListTBody').find('tr[checked]').each(function () {
                flowId = $(this).attr('data-flowId');
                users = $(this).attr('data-users') || '';
                users = users ? users.split(',') : [];
                // 包含非新增重印
                if (flowId !== FLOW_ADD_REPRINT) {
                    addReprint = false;
                }
                // 包含非盲文编译部部门负责人审核
                if (flowId !== FLOW_ED_HEAD) {
                    edHead = false;
                }
                // 包含非盲文编译部分管社领导审核
                if (flowId !== FLOW_ED_LEADER) {
                    edLeader = false;
                }
                // 包含非读者服务部部门负责人审核
                if (flowId !== FLOW_RE_HEAD) {
                    reHead = false;
                }
                // 包含非读者服务部分管社领导审核
                if (flowId !== FLOW_RE_LEADER) {
                    reLeader = false;
                }
                // 包含非典藏借阅部部门负责人审核
                if (flowId !== FLOW_LI_HEAD) {
                    liHead = false;
                }
                // 包含非典藏借阅部分管社领导审核
                if (flowId !== FLOW_LI_LEADER) {
                    liHeader = false;
                }
                // 包含非总编室部门负责人审核
                if (flowId !== FLOW_CH_HEAD) {
                    chHead = false;
                }
                // 包含非总编室部门负责人审核
                if (flowId !== FLOW_CH_LEADER) {
                    chHeader = false;
                }
                // 包含非盲文印制部部门负责人审核
                if (flowId !== FLOW_PR_HEAD) {
                    prHead = false;
                }
                // 包含非盲文印制部分管社领导审核
                if (flowId !== FLOW_PR_LEADER) {
                    prHeader = false;
                }

                // 待我处理
                if (users.indexOf(userId) < 0) {
                    allMe = false;
                }
                // 任务状态未完成
                if ($(this).attr('data-taskState') === '2') {
                    allUnfinished = false;
                }

                // 是否为第一个节点
                if ($(this).attr('data-reNum') === '1') {
                    allNum = false;
                }
                bookIds.push($(this).attr('data-bookId'));
                taskIds.push($(this).attr('data-taskId'));
                names.push($(this).attr('data-name'));
                reprintId.push($(this).attr('data-reprintBookAuditId'));
                count++;
            });

            this.currentBookId = bookIds.join(',');
            this.currentTaskId = taskIds.join(',');
            this.currentName = names.join(',');
            this.currentreprintId = reprintId.join(',');
            // 选择一条或多条删除可用
            if (count >= 1 && addReprint && allUnfinished && allMe) {
                this.$('#btnTopicDelete').removeAttr('disabled');
            }
            // 只选择了一条，处理（对应该模块所有的flowid状态）可用
            if (count === 1) {
                if (( edHead || edLeader || reHead || reLeader || liHead || liHeader || chHead || chHeader || prHead || prHeader) && allUnfinished && allMe) {
                    this.$('#btnTopicHandle').removeAttr('disabled');
                }
                // 查看可用
                if (edHead || edLeader || reHead || reLeader || liHead || liHeader || chHead || chHeader || prHead || prHeader || (allNum && addReprint)) {
                    this.$('#btnTopicView').removeAttr('disabled');
                }
                // 修改可用
                if (addReprint && allUnfinished && allMe) {
                    this.$('#btnTopicModify').removeAttr('disabled');
                }
                // 只有新增成功后才能查看
                if (allNum && allUnfinished && allMe) {
                    this.$('#btnTopicHandle').removeAttr('disabled');//处理
                    this.$('#btnTopicView').removeAttr('disabled');// 查看
                    this.$('#btnTopicDelete').attr('disabled', 'disabled');// 删除
                    this.$('#btnTopicModify').attr('disabled', 'disabled');// 修改
                }
            }
        };

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            // that.openPage('public/workflow/workflow-dialog', {
            //     debug: true,
            //     flowTemplate: 'cip-apply/cip-apply-create',
            //     isEdit: false
            // });
            // 新增
            that.$container.on('click', '#btnTopicAdd', function () {
                util.showLoading();
                util.sendRequest({
                    data: {},
                    action: 'reprintAudit/searchAddReprintAuditDetail.action',
                    success: function (resp) {
                        util.hideLoading();
                        if (resp.code === 0) {
                            that.openPage('braille/reprint-audit/reprint-audit-add', {});
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
            that.$container.on('click', '#btnTopicModify', function () {
                that.openPage('braille/reprint-audit/reprint-audit-add', {
                    info: that.currentreprintId,
                    taskId: that.currentTaskId
                });
            });

            // 删除
            that.$container.on('click', '#btnTopicDelete', function () {
                util.showConfirm('确定要将“' + that.currentName + '”删除吗？', function () {
                    var params = {
                        reprintBookAuditId: that.currentreprintId,
                        taskId: that.currentTaskId
                    };
                    util.showLoading();
                    util.sendRequest({
                        data: params,
                        action: 'reprintAudit/removeReprintAudit.action',
                        success: function (resp) {
                            util.hideLoading();
                            console.log(resp);
                            if (resp.code === 0) {
                                util.showAlert(resp.message || '删除成功！');
                                that.searchUntreatedTask();
                            } else {
                                util.showAlert(resp.message || '删除出错，请稍后重试！');
                            }
                        },
                        error: function (xhr) {
                            // XHR错误
                            util.hideLoading();
                            console.log(xhr);
                            util.showAlert('删除出错，请稍后重试！');
                        }
                    });
                });
            });

            // 处理
            that.$container.on('click', '#btnTopicHandle', function () {
                var btnText = $(this).text();
                that.openPage('public/workflow/workflow-dialog', {
                    flowInfoAction: that.flowInfoAction,
                    bookId: that.currentBookId,
                    taskId: that.currentTaskId,
                    deployId: that.deployKey,
                    reprintBookAuditId: that.currentreprintId,
                    btnText: btnText
                });
            });

            // 查看
            that.$container.on('click', '#btnTopicView', function () {
                that.openPage('public/workflow/workflow-dialog', {
                    flowInfoAction: that.flowInfoAction,
                    bookId: that.currentBookId,
                    taskId: that.currentTaskId,
                    deployId: that.deployKey,
                    reprintBookAuditId: that.currentreprintId,
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
            this.listTpl = topicManageListTpl;

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
            if (data && data.refresh === true) {
                this.$('#btnTopicDelete').attr('disabled', 'disabled');// 删除
                this.$('#btnTopicModify').attr('disabled', 'disabled');// 修改
                this.$('#btnTopicView').attr('disabled', 'disabled');// 查看
                this.$('#btnTopicHandle').attr('disabled', 'disabled');// 处理
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