define(function(require, exports, module) {
	"use strict";

	var util = require('../../../common/util');
	// 工作流类窗口继承自工作流Base
	var Base = require('../../other/base/book-base');

	var topicManageListTpl = require('./produce-manage-list.tpl');

	var FLOW_ADVICE = 'cn_PrintedNotice'; 				// 图书印制通知单
	var FLOW_REVIEW = 'cn_ChineseRoomReview'; 			// 汉文编室审核
	var FLOW_ISSUE = 'cn_IssueReview';	 				// 发行部审核
	var FLOW_OFFICE = 'cn_OfficeReview'; 				// 总编室审核
	var FLOW_PUBLISH = 'cn_PublishingReview';			// 出版部审核
	var FLOW_EDITOR = 'cn_EditorReview';				// 总编辑/副总编辑审核
	var FLOW_PRODUCTION = 'cn_production';				// 图书生产通知单
	var FLOW_PUBAUDIT = 'cn_publishingAudit';			// 出版部审核
	var FLOW_LEADER = 'cn_leadershipAudit'; 			// 社领导审核
	var FLOW_UNDER = 'cn_underPrinting'; 				// 下印场
	var FLOW_BLUEPAPER = 'cn_printingBluePaper'			// 打印蓝纸
	var FLOW_LOOKBLUE = 'cn_lookingBluePaper'; 			// 看蓝纸
	var FLOW_PAPER = 'cn_lookBluePaperHandle';			// 看蓝纸处理
	var FLOW_PRINT = 'cn_printingBook'; 				// 打印样书
	var FLOW_FIRSTBOOK = 'cn_firstBookReview';			// 样书初审
	var FLOW_FIRSTREVIEW = 'cn_firstBookReviewHandle';	// 样书初审处理
	var FLOW_LASTBOOK = 'cn_lastBookReview';			// 样书终审
	var FLOW_LASTREVIEW = 'cn_lastBookReviewHandle';	// 样书终审处理
	var FLOW_BATCH = 'cn_batchBind';					// 批量装订

	var Module = Base.extend(new function() {
		var that;

		this.deployKey = 'CNPrintingAndProduction';
		// 与我相关
		this.searchTaskAbout = '1';
		// 其他搜索选项
		this.searchParams = {};
		/**
		 * 搜索任务列表的接口(覆盖父级)
		 */
		this.taskListAction = 'publishing/searchPrintingList.action';

		/**
		 * 选择行变更事件回调
		 */
		this.onSelectRowChanged = function() {
			// 暂时啥也不做
		};

		this.onCheckRowChanged = function() {
			// 默认全部禁用
			// cn_PrintedNotice 			图书印制通知单
	    	// cn_ChineseRoomReview 		汉文编室审核
			// cn_IssueReview 				发行部审核
			// cn_OfficeReview 				总编室审核
			// cn_PublishingReview 			出版部审核
			// cn_EditorReview				总编辑/副总编辑审核
			// cn_production				图书生产通知单
			// cn_publishingAudit			出版部审核
			// cn_leadershipAudit 			社领导审核
			// cn_underPrinting 			下印场
			// cn_printingBluePaper			打印蓝纸
			// cn_lookingBluePaper			看蓝纸
		 	// cn_lookBluePaperHandle		看蓝纸处理
			// cn_printingBook				打印样书
		 	// cn_firstBookReview			样书初审
		 	// cn_firstBookReviewHandle		样书初审处理
			// cn_lastBookReview			样书终审
			// cn_lastBookReviewHandle		样书终审处理
			// cn_batchBind					批量装订			
			this.$('#btnReviewHandle').attr('disabled', 'disabled'); // 处理
			this.$('#btnReviewBatch').attr('disabled', 'disabled'); // 批量处理
			this.$('#btnReviewCheck').attr('disabled', 'disabled'); // 查看
	
			var count = 0, flowId = null, users = null, bookIds = [], bookTopicIds = [], taskIds = [];
			var allAdvice = true, allReview = true, allIssue = true, allOffice = true, allPublish = true, allEditor = true, allProduce = true,
				allPubaudit = true, allLeader = true, allUnder = true, allBluePaper = true, allLookBlue = true, allLookBlueHandle = true,
				allPrintBook = true, allFirstBook = true, allFirstReview = true, allLastBook = true, allLastReview = true, allBatch = true, allMe = true, allUnfinished = true, allTheFirst = true;
			var userId = util.getUserInfo().userId;
			that.$('#workListTBody').find('tr[checked]').each(function() {
				flowId = $(this).attr('data-flowId');
				users = $(this).attr('data-users') || '';
				users = users ? users.split(',') : [];
				// 包含非图书印制通知单
				if(flowId !== FLOW_ADVICE) {
					allAdvice = false;
				}
				// 包含非汉文编室审核
				if(flowId !== FLOW_REVIEW) {
					allReview = false;
				}
				// 包含非发行部审核
				if(flowId !== FLOW_ISSUE) {
					allIssue = false;
				}
				// 包含非总编室审核
				if(flowId !== FLOW_OFFICE) {
					allOffice = false;
				}
				// 包含非出版部审核
				if(flowId !== FLOW_PUBLISH) {
					allPublish = false;
				}
				// 包含非总编辑/副总编辑审核
				if(flowId !== FLOW_EDITOR) {
					allEditor = false;
				}
				// 包含非图书生产通知单
				if(flowId !== FLOW_PRODUCTION) {
					allProduce = false;
				}
				// 包含非出版部审核
				if(flowId !== FLOW_PUBAUDIT) {
					allPubaudit = false;
				}
				// 包含非社领导审核
				if(flowId !== FLOW_LEADER) {
					allLeader = false;
				}
				// 包含非下印场
				if(flowId !== FLOW_UNDER) {
					allUnder = false;
				}	
				// 包含非打印蓝纸
				if(flowId !== FLOW_BLUEPAPER) {
					allBluePaper = false;
				}
				// 包含非看蓝纸
				if(flowId !== FLOW_LOOKBLUE) {
					allLookBlue = false;
				}
				// 包含非看蓝纸处理
				if(flowId !== FLOW_PAPER) {
					allLookBlueHandle = false;
				}
				// 包含非打印样书
				if(flowId !== FLOW_PRINT) {
					allPrintBook = false;
				}
				// 包含非样书初审
				if(flowId !== FLOW_FIRSTBOOK) {
					allFirstBook = false;
				}
				// 包含非样书初审处理
				if(flowId !== FLOW_FIRSTREVIEW) {
					allFirstReview = false;
				}
				// 包含非样书终审
				if(flowId !== FLOW_LASTBOOK) {
					allLastBook = false;
				}
				// 包含非样书终审处理
				if(flowId !== FLOW_LASTREVIEW) {
					allLastReview = false;
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
				// 是否为第一次进入
				if ($(this).attr('data-isInFirst') === '1') {
					allTheFirst = false;
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
				if (allTheFirst) {
					this.$('#btnReviewCheck').removeAttr('disabled');
				}
				// 图书印制通知单、汉文编室审核、发行部审核、总编室审核、出版部审核、总编辑/副总编辑审核可用
				if(allMe && allUnfinished && (allAdvice || allReview || allIssue || allOffice || allPublish || allEditor || allProduce || allPubaudit || allLeader ||
				allUnder || allBluePaper || allLookBlue || allLookBlueHandle || allPrintBook || allFirstBook || allFirstReview || allLastBook || allLastReview || allBatch)) {
					this.$('#btnReviewHandle').removeAttr('disabled');
				}
			}
			// 选择一条或多条
			if(count > 1) {
				// 全部都是汉文编室审核、发行部审核、总编室审核、出版部审核、总编辑/副总编辑审核可用
				if((allReview || allIssue || allOffice || allPublish || allEditor) && allMe && allUnfinished) {
					this.$('#btnReviewBatch').removeAttr('disabled');
				}
			}
		};

		/**
		 * 初始化页面事件
		 */
		function initPageEvent() {

//			that.openPage('public/workflow/workflow-dialog', {
//				debug: true,
//				flowTemplate: 'chinese-produce-manage/produce-manage-advice',
//				isEdit: true
//			});

			// 处理
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