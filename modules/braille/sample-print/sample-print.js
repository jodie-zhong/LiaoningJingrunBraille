define(function(require, exports, module) {
	"use strict";

	var util = require('../../../common/util');
	// 工作流类窗口继承自工作流Base
	var Base = require('../../other/base/book-base');

	var topicManageListTpl = require('./sample-print-list.tpl');

	var FLOW_ISSUED = 'BrailleIssued'; 			// 下发
	var FLOW_CARVE = 'BrailleEngraving'; 		// 刻印
	var FLOW_TAILOR = 'BrailleCuttingEdge'; 	// 裁边
	var FLOW_FOLDOUT = 'BrailleFolding'; 		// 折页
	var FLOW_GRAB = 'BrailleGrabPage'; 			// 抓页
	var FLOW_WIRE = 'BrailleCableLine'; 		// 索线
	var FLOW_CHECK = 'BrailleCheckPage'; 		// 查页
	var FLOW_BIND = 'BrailleBinding'; 			// 装订
	var FLOW_ASSORT = 'BrailleBundleOfBooks'; 	// 捆书配套
	var FLOW_DELIVER = 'BrailleDeliver'; 		// 交付
	var FLOW_OTHERSEND = 'otherSend';			// 其他流程交付

	var Module = Base.extend(new function() {
		var that;

		this.deployKey = 'BraillePressReleaseIssued';
		// 与我相关
		this.searchTaskAbout = '1';
		// 其他搜索选项
		this.searchParams = {};
		this.searchFlowListId = 'searchBookId';
		this.flowInfoAction = 'clear/searchListFlowInfo.action';
		/**
		 * 搜索任务列表的接口(覆盖父级)
		 */
		this.taskListAction = 'clear/searchClearList.action';

		this.treeName='图书';
		/**
		 * 选择行变更事件回调
		 */
		this.onSelectRowChanged = function() {
			// 暂时啥也不做
		};

		this.onCheckRowChanged = function() {
			// 默认全部禁用
			// BrailleIssued		下发
			// BrailleEngraving		刻印
			// BrailleCuttingEdge	裁边
			// BrailleFolding		折页
			// BrailleGrabPage		抓页
			// BrailleCableLine		索线
			// BrailleCheckPage		查页
			// BrailleBinding		装订
			// BrailleBundleOfBooks 捆书配套
			// BrailleDeliver 		交付
			this.$('#btnSampleHandle').attr('disabled', 'disabled'); // 处理
			this.$('#btnSampleCheck').attr('disabled', 'disabled'); // 查看

			var count = 0, flowId = null, users = null, bookIds = [], bookTopicIds = [], taskIds = [];
			var allIssued = true, allCarve = true, allTailor = true, allFoldout = true, allGrab = true, allWire = true, 
				allCheck = true, allBind = true, allAssort = true, allDeliver = true, allOther = true, allMe = true, allUnfinished = true;
			var userId = util.getUserInfo().userId;
			that.$('#workListTBody').find('tr[checked]').each(function() {
				flowId = $(this).attr('data-flowId');
				users = $(this).attr('data-users') || '';
				users = users ? users.split(',') : [];
				// 包含非下发
				if(flowId !== FLOW_ISSUED) {
					allIssued = false;
				}
				// 包含非刻印
				if(flowId !== FLOW_CARVE){
					allCarve = false;
				} 
				// 包含非裁边
				if(flowId !== FLOW_TAILOR){
					allTailor = false;
				}
				// 包含非折页
				if(flowId !== FLOW_FOLDOUT) {
					allFoldout = false;
				}
				// 包含非抓页
				if(flowId !== FLOW_GRAB){
					allGrab = false;
				} 
				// 包含非索线
				if(flowId !== FLOW_WIRE){
					allWire = false;
				}
				// 包含非查页
				if(flowId !== FLOW_CHECK) {
					allCheck = false;
				}
				// 包含非装订
				if(flowId !== FLOW_BIND){
					allBind = false;
				} 
				// 包含非捆书配套
				if(flowId !== FLOW_ASSORT){
					allAssort = false;
				}
				// 包含非交付
				if(flowId !== FLOW_DELIVER){
					allDeliver = false;
				}
				// 包含非其他流程交付
				if(flowId !== FLOW_OTHERSEND){
					allOther = false;
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
				taskIds.push($(this).attr('data-taskId'));
				count++;
			});
			this.currentBookId = bookIds.join(',');
			this.currentTaskId = taskIds.join(',');

			// 只选择了一条，查看可用
			if(count === 1) {
				if (flowId !== FLOW_ISSUED) {
					this.$('#btnSampleCheck').removeAttr('disabled');
				}           
				if((allIssued || allCarve || allTailor || allFoldout || allGrab || allWire ||allCheck ||allBind || allAssort ||allDeliver || allOther) && allMe && allUnfinished) {
					this.$('#btnSampleHandle').removeAttr('disabled');
				}
			}
		}
		/**
		 * 初始化页面事件
		 */
		function initPageEvent() {
//			that.openPage('public/workflow/workflow-dialog', {
//			    debug: true,
//			    flowTemplate: 'sample-print/sample-print-carve',
//			    isEdit: true
//			});

			// 下发、刻印、裁边、折页、抓页、索线、查页、装订、捆书配套、交付 处理
			that.$container.on('click', '#btnSampleHandle', function() {
				var btnText=$(this).text();
				that.openPage('public/workflow/workflow-dialog', {
					flowInfoAction: that.flowInfoAction,
					bookId: that.currentBookId,
					bookTopicId: that.currentBookTopicId,
					taskId: that.currentTaskId,
					deployId: that.deployKey,
					btnText:btnText
				});
			});

			// 下发、刻印、裁边、折页、抓页、索线、查页、装订、捆书配套、交付 查看
			that.$container.on('click', '#btnSampleCheck', function() {
				that.openPage('public/workflow/workflow-dialog', {
					flowInfoAction: that.flowInfoAction,
					bookId: that.currentBookId,
					bookTopicId: that.currentBookTopicId,
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