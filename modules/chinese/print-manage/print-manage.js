define(function(require, exports, module) {
	"use strict";

	var util = require('../../../common/util');
	// 工作流类窗口继承自工作流Base
	var Base = require('../../other/base/book-base');

	var topicManageListTpl = require('./print-manage-list.tpl');

	var FLOW_PRINT = 'cn_fillQuickPrint'; 			// 快印通知单填写
	var FLOW_EDIT = 'cn_editDeptOpinion'; 			// 编辑部门意见
	var FLOW_ISSUE = 'cn_issueDeptOpinion'; 		// 发行部门意见
	var FLOW_PUBLISH = 'cn_publishDeptOpinion'; 	// 出版部意见
	var FLOW_CHIEF= 'cn_chiefOfficeOpinion'; 		// 总编室意见
	var FLOW_LEADER = 'cn_deptLeaderOpinion'; 		// 主管领导意见
	var FLOW_BLUEPAPER = 'cn_printBluePaper'; 		// 打印蓝纸
	var FLOW_LOOKBLUE = 'cn_lookBluePaper'; 		// 看蓝纸
	var FLOW_BOOK = 'cn_printBook'; 				// 打印样书
	var FLOW_FIRST = 'cn_bookFirstExamine'; 		// 样书初审
	var FLOW_FINAL = 'cn_bookFinalExamine'; 		// 样书终审
	var FLOW_BATCH = 'cn_batchBinding'; 			// 批量装订
	
	var Module = Base.extend(new function() {
		var that;

		this.deployKey = 'CNQuickPrint';
		// 与我相关
		this.searchTaskAbout = '1';

		/**
		 * 选择行变更事件回调
		 */
		this.onSelectRowChanged = function() {
			// 暂时啥也不做
		};

		this.onCheckRowChanged = function() {
			// 默认全部禁用
			// cn_fillQuickPrint		快印通知单填写
			// cn_editDeptOpinion      	编辑部门意见
			// cn_issueDeptOpinion      发行部门意见
			// cn_publishDeptOpinion 	出版部意见
			// cn_chiefOfficeOpinion 	总编室意见
			// cn_deptLeaderOpinion		主管领导意见
			// cn_printBluePaper		打印蓝纸
			// cn_lookBluePaper			看蓝纸
			// cn_printBook				打印样书
			// cn_bookFirstExamine		样书初审
			// cn_bookFinalExamine		样书终审	
			// cn_batchBinding			批量装订
			this.$('#btnReviewHandle').attr('disabled', 'disabled'); // 处理
			this.$('#btnReviewCheck').attr('disabled', 'disabled');  // 查看

			var count = 0, flowId = null, users = null, bookIds = [], bookTopicIds = [], taskIds = [];
			var allQuick = true, allEdit = true, allIssue = true, allPublish = true, allChief = true, allLeader = true, allBluePaper = true, allLookBlue = true, allPrintBook = true,
				allFirstExamine = true, allFinalExamine = true, allBatch = true, allMe = true, allUnfinished = true, allNum = true;
			var userId = util.getUserInfo().userId;
			that.$('#workListTBody').find('tr[checked]').each(function() {
				flowId = $(this).attr('data-flowId');
				users = $(this).attr('data-users') || '';
				users = users ? users.split(',') : [];
				// 包含非快印通知单填写
				if(flowId !== FLOW_PRINT) {
					allQuick = false;
				}
				// 包含非编辑部门意见
				if(flowId !== FLOW_EDIT) {
					allEdit = false;
				}
				// 包含非发行部门意见
				if(flowId !== FLOW_ISSUE) {
					allIssue = false;
				}
				// 包含非出版部意见
				if(flowId !== FLOW_PUBLISH) {
					allPublish = false;
				}
				// 包含非总编室意见
				if(flowId !== FLOW_CHIEF) {
					allChief = false;
				}
				// 包含非主管领导意见
				if(flowId !== FLOW_LEADER) {
					allLeader = false;
				}
				// 包含非打印蓝纸
				if(flowId !== FLOW_BLUEPAPER) {
					allBluePaper = false;
				}
				// 包含非看蓝纸
				if(flowId !== FLOW_LOOKBLUE) {
					allLookBlue = false;
				}
				// 包含非打印样书
				if(flowId !== FLOW_BOOK) {
					allPrintBook = false;
				}
				// 包含非样书初审
				if(flowId !== FLOW_FIRST) {
					allFirstExamine = false;
				}
				// 包含非样书终审
				if(flowId !== FLOW_FINAL) {
					allFinalExamine = false;
				}
				// 包含非批量装订
				if(flowId !== FLOW_BATCH) {
					allBatch = false;
				}
				// 待我处理
				if(users.indexOf(userId) < 0) {
					allMe = false;
				}
				// 任务状态未完成
				if($(this).attr('data-taskState') === '2') {
					allUnfinished = false;
				}
				// 是否为第一个节点
                if ($(this).attr('data-num') === '1') {
                	allNum = false;
                }
				bookIds.push($(this).attr('data-bookId'));
				bookTopicIds.push($(this).attr('data-bookTopicId'));
				taskIds.push($(this).attr('data-taskId'));
				count++;
			});

			this.currentBookId = bookIds.join(',');
			this.currentBookTopicId = bookTopicIds.join(',');
			this.currentTaskId = taskIds.join(',');

			// 只选择了一条，查看可用
			if(count === 1) {
				// 查看可用
				if (allNum) {
					this.$('#btnReviewCheck').removeAttr('disabled');
				}
				// 快印通知单填写、编辑部门意见、发行部门意见、出版部意见、总编室意见、主管领导意见、打印蓝纸、看蓝纸、打印样书、样书初审、样书终审、批量装订可用
				if(allMe && allUnfinished && (allQuick || allEdit || allIssue || allPublish || allChief || allLeader || allBluePaper || allLookBlue || allPrintBook || allFirstExamine || allFinalExamine || allBatch)) {
					this.$('#btnReviewHandle').removeAttr('disabled');
				}
			}
		};

		/**
		 * 初始化页面事件
		 */
		function initPageEvent() {

//			that.openPage('public/workflow/workflow-dialog', {
//				debug: true,
//				flowTemplate: 'chinese-print-manage/print-manage-advice',
//				isEdit: true
//			});

			// 部门负责人下发
			that.$container.on('click', '#btnReviewHandle', function() {
				var btnText=$(this).text();
				that.openPage('public/workflow/workflow-dialog', {
					flowInfoAction: 'common/searchBookFlowList.action',
					bookId: that.currentBookId,
					bookTopicId: that.currentBookTopicId,
					taskId: that.currentTaskId,
					deployId: that.deployKey,
					btnText:btnText
				});
			});

			// 查看
			that.$container.on('click', '#btnReviewCheck', function() {
				that.openPage('public/workflow/workflow-dialog', {
					flowInfoAction: 'common/searchBookFlowList.action',
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
		this.onInit = function($el, tpl, data, indexRef) {
			this._super($el, tpl, data, indexRef);
			that = this;
			// that.initTemplate(tpl, {});

			// 初始化数据前需要设置列表模板
			this.baseTpl = topicManageListTpl;

			// 初始化页面事件
			initPageEvent();

			// 初始化页面数据
			initPageData();
		};

		/**
		 * 页面返回事件
		 * @param data
		 */
		this.onBack = function(data) {
			this._super(data);

		};

		/**
		 * 窗口缩放事件
		 */
		this.onResize = function() {
			this._super();
		};

		/**
		 * 页面销毁
		 */
		this.onDestroy = function() {
			this._super();
		};

	}());

	module.exports = Module;
});