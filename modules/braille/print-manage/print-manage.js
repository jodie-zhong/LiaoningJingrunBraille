define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    // 工作流类窗口继承自工作流Base
    var Base = require('../../other/base/book-base');

    var topicManageListTpl = require('./print-manage-list.tpl');

	var FLOW_ISSUED = 'printIssued'; 			// 下发
	var FLOW_PRESS = 'otherPieceSinglePress';	// 另件付印单录入
	var FLOW_MARK = 'engraving'; 				// 刻印
	var FLOW_PLATE = 'plate'; 					// 制版
	var FLOW_CUT = 'cuttingEdge'; 				// 裁边
	var FLOW_LITH = 'flatPrint'; 				// 平印
	var FLOW_ROTATE = 'roundRobin'; 			// 轮转
	var FLOW_FOLDOUT = 'folding'; 				// 折页
	var FLOW_CATCH = 'grabPage'; 				// 抓页
	var FLOW_BANDS = 'cableLine'; 				// 索线
	var FLOW_FIND = 'checkThePage'; 			// 查页
	var FLOW_BIND = 'binding'; 					// 装订
	var FLOW_ASSORT = 'bundleOfBooks'; 			//捆书配套
	var FLOW_CONFIRM = 'printingConfirm'		//印刷流程确认
    var Module = Base.extend(new function () {
        var that;

        this.deployKey = 'BraillePrintingManage';
        
        // 与我相关
        this.searchTaskAbout = '1';
        // 其他搜索选项
        this.searchParams = {};
        this.searchFlowListId = 'searchBookId';

		this.treeName='图书';

        /**
		 * 搜索下一流程的接口(覆盖父级)
		 */
		this.flowInfoAction = 'printing/searchBookListFlowInfo.action'; //
        /**
         * 选择行变更事件回调
         */
        this.onSelectRowChanged = function(){
        	// 暂时啥也不做
        };
        
        this.onCheckRowChanged = function () {
        	// 默认全部禁用
        	// pringtingIssued		下发
			// piecePress			另件付印单录入
			// stampMark			刻印
   			// platemaking			制版
   			// cuttingEdge			裁边
   			// lithoprint			平印
   			// rotate				轮转
   			// folding				折页
   			// catchPage			抓页
 			// cableLine			索线
 			// findPage				查页
 			// bookbinding			装订
			// bundleOfBooks		捆书配套
			this.$('#btnPrintHandle').attr('disabled', 'disabled'); // 处理
			this.$('#btnPrintCheck').attr('disabled', 'disabled'); // 查看
			
			var count = 0, flowId = null, users = null, bookIds = [], bookTopicIds = [], taskIds = [];
			var allIssued = true, allPress = true, allMark = true, allPlate = true, allCut = true, allLith = true, allRotate = true, allFoldout = true, allCatch = true, 
			allBands = true, allFind = true, allBind = true, allAssort = true, allConfirm = true, allMe = true, allUnfinished = true;
			var userId = util.getUserInfo().userId;
			that.$('#workListTBody').find('tr[checked]').each(function() {
				flowId = $(this).attr('data-flowId');
				users = $(this).attr('data-users') || '';
				users = users ? users.split(',') : [];
				// 包含非下发
				if(flowId !== FLOW_ISSUED) {
					allIssued = false;
				}
				// 包含非另件付印单录入
				if(flowId !== FLOW_PRESS) {
					allPress = false;
				}	
				// 包含非刻印
				if(flowId !== FLOW_MARK) {
					allMark = false;
				}	
				// 包含非制版
				if(flowId !== FLOW_PLATE) {
					allPlate = false;
				}	
				// 包含非裁边
				if(flowId !== FLOW_CUT) {
					allCut = false;
				}	
				// 包含非平印
				if(flowId !== FLOW_LITH) {
					allLith = false;
				}	
				// 包含非轮转
				if(flowId !== FLOW_ROTATE) {
					allRotate = false;
				}
				// 包含非折页
				if(flowId !== FLOW_FOLDOUT) {
					allFoldout = false;
				}	
				// 包含非抓页
				if(flowId !== FLOW_CATCH) {
					allCatch = false;
				}	
				// 包含非索线
				if(flowId !== FLOW_BANDS) {
					allBands = false;
				}	
				// 包含非查页
				if(flowId !== FLOW_FIND) {
					allFind = false;
				}	
				// 包含非装订
				if(flowId !== FLOW_BIND) {
					allBind = false;
				}	
				// 包含非捆书配套	
				if(flowId !== FLOW_ASSORT) {
					allAssort = false;
				}	
				// 包含非捆书配套	
				if(flowId !== FLOW_CONFIRM) {
					allConfirm = false;
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
					this.$('#btnPrintCheck').removeAttr('disabled');
				}           
				if((allIssued || allPress || allMark || allPlate || allCut || allLith || allRotate || allFoldout || allCatch || allBands || allFind || allBind || allAssort || allConfirm) && allMe && allUnfinished) {
					this.$('#btnPrintHandle').removeAttr('disabled');
				}
			}
        };
        
        /**
         * 工作量
         */
        function searchWorkload() {
        	util.showLoading();
				util.sendRequest({
					action: 'printing/searchWorkLoad.action',
					data: {},
					success: function(resp) {
						util.hideLoading();
						if(resp.code === 0) {
							that.openPage('braille/print-manage/print-manage-workload', resp.data);
						} else {
							util.showAlert(resp.message);
						}
					},
					error: function(xhr) {
						// XHR错误
                        console.log(xhr);
						util.hideLoading();
						util.showAlert('查询信息出错，请稍后重试！');
					}
				});        	
        }

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
//          that.openPage('public/workflow/workflow-dialog', {
//              debug: true,
//              flowTemplate: 'print-manage/print-manage-enter',
//              isEdit: true
//          });

            // 下发、刻印、裁边、折页、抓页、索线、查页、装订、捆书配套、交付 处理
			that.$container.on('click', '#btnPrintHandle', function() {
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
			that.$container.on('click', '#btnPrintCheck', function() {
				that.openPage('public/workflow/workflow-dialog', {
					flowInfoAction: that.flowInfoAction,
					bookId: that.currentBookId,
					bookTopicId: that.currentBookTopicId,
					taskId: that.currentTaskId,
					deployId: that.deployKey,
					isView: true
				});
			});
			
			// 工作量查询
			that.$container.on('click', '#btnPrintWork', searchWorkload);

        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
			that.$('#btnPrintHandle').attr('disabled', 'disabled');
			that.$('#btnPrintCheck').attr('disabled', 'disabled');
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