define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    // 工作流类窗口继承自工作流Base
    var Base = require('../../other/base/book-base');
    var topicManageListTpl = require('./contract-input-list.tpl');
    
    var FLOW_ISSUED = 'cn_contractIssued'; 			// 下发
    var FLOW_ENTRY = 'cn_contractEntry'; 			// 合同录入
    var FLOW_AUDIT = 'cn_deptHeadAudit';  			// 部门负责人审核合同
    var FLOW_REPORT = 'cn_uploadLegalReport'; 		// 上传法律评估报告
    var FLOW_CONTRACT = 'cn_generateContractNum';	// 生成合同编号
    var FLOW_REGISTER = 'cn_signContract'; 			// 签署合同
    var FLOW_ENDITOR = 'cn_fileRegister'; 			// 归档登记

    var Module = Base.extend(new function () {
        var that;

        this.deployKey = 'CNContractEntry';
        
        // 与我相关
        this.searchTaskAbout = '1';
        // 其他搜索选项
        this.searchParams = {};
        
        this.treeName='合同';

        this.searchFlowListId = 'searchBookId';

        /**
         * 选择行变更事件回调
         */
        this.onSelectRowChanged = function(){
        	// 暂时啥也不做
        };
        
        this.onCheckRowChanged = function() {
        	that.$('#btnInputHandle').attr('disabled', 'disabled');
			that.$('#btnInputCheck').attr('disabled', 'disabled');
			
			var count = 0, flowId = null, users = null, bookIds = [], bookTopicIds = [], taskIds = [];
			var allIssued = true, allEntry = true, allAudit = true, allSign = true, allContract = true, allEwcord = true, allInEnter = true, allMe = true, allUnfinished = true;
			var userId = util.getUserInfo().userId;
			that.$('#workListTBody').find('tr[checked]').each(function() {
				flowId = $(this).attr('data-flowId');
				users = $(this).attr('data-users') || '';
				users = users ? users.split(',') : [];
				// 包含非下发
				if(flowId !== FLOW_ISSUED) {
					allIssued = false;
				}
				// 包含非合同录入
				if(flowId !== FLOW_ENTRY) {
					allEntry = false;
				}
				// 包含非部门负责人审核合同
				if (flowId !== FLOW_AUDIT) {
					allAudit = false;
				}
				// 包含非上传法律评估报告
				if(flowId !== FLOW_REPORT) {
					allSign = false;
				}
				// 包含非生成合同编号
				if (flowId !== FLOW_CONTRACT) {
					allContract = false;
				}
				// 包含非签署合同
				if(flowId !== FLOW_REGISTER) {
					allEwcord = false;
				}
				// 包含非归档登记
				if(flowId !== FLOW_ENDITOR) {
					allInEnter = false;
				}
				// 待我处理
				if(users.indexOf(userId) < 0) {
					allMe = false;
				}
				// 任务状态未完成
				if($(this).attr('data-taskState') === '2') {
					allUnfinished = false;
				}
				bookIds.push($(this).attr('data-bookId'));
				bookTopicIds.push($(this).attr('data-bookTopicId'));
				taskIds.push($(this).attr('data-taskId'));
				count++;
			});
			
			this.currentBookId = bookIds.join(',');
			this.currentBookTopicId = bookTopicIds.join(',');
			this.currentTaskId = taskIds.join(',');
			
			if(count === 1) {
				// 除下发外，其余查看可用
				if (!allIssued) {
					this.$('#btnInputCheck').removeAttr('disabled');
				}
				// 下发、合同录入、上传法律评估报告、签署合同、归档登记可用
				if(allMe && allUnfinished && (allIssued || allEntry || allAudit || allSign || allContract || allEwcord || allInEnter)) {
					this.$('#btnInputHandle').removeAttr('disabled');
				}
			}
        };

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
        	
//			that.openPage('public/workflow/workflow-dialog', {
//				debug: true,
//				flowTemplate: 'chinese-contract-input/contract-input-register',
//				isEdit: true
//			});        	
//      	
        	// 合同录入处理
			that.$container.on('click', '#btnInputHandle', function() {
				var btnText=$(this).text();
				that.openPage('public/workflow/workflow-dialog', {
					flowInfoAction : 'common/searchBookFlowList.action',
					bookId: that.currentBookId,
					bookTopicId: that.currentBookTopicId,
					taskId: that.currentTaskId,
					deployId: that.deployKey,
					btnText:btnText
				});
			});

			// 查看
			that.$container.on('click', '#btnInputCheck', function() {
				that.openPage('public/workflow/workflow-dialog', {
					flowInfoAction : 'common/searchBookFlowList.action',
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
        	that.$('#btnInputHandle').attr('disabled', 'disabled');
			that.$('#btnInputCheck').attr('disabled', 'disabled');
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