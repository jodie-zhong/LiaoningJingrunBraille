define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var PageBase = require('../../../common/base-page');
    //编辑界面模板
    var listTpl = require('./contract-template-list.tpl');
    
    var Module = PageBase.extend(new function () {
        var that;
        var currentPage = 1;
        // 当前选中的模板ID
        var currentTemplateId = '';
        // 当前选中模板信息
        var currentTemplateInfo = null;
        
        /*
         * 查询模板列表 
         */
        function searchTemplateList() {
        	var params = {},$el;
        	that.$('#formSearchTemplate input[data-search]').each(function() {
        		$el = $(this);
        		params[$el.attr('data-search')] = $el.val();
        	});
        	params.page = currentPage;
			util.showLoading();
			util.sendRequest({
				type: 'POST',
				data: params,
				action: 'template/searchTemplateList.action',
				success: function(resp) {
					util.hideLoading();
					console.log(resp);
					if (resp.code === 0) {
						that.$('#templateListTable').html(util.template(listTpl,{
							list:resp.data.records
						}));
						// 分页数据
						that.$('#templateListPaging').html(that.buildPagination(resp.data.pageNow, resp.data.pageCount));
					} else {
						util.showAlert(resp.message || '查询模板列表出错，请稍后重试！');
					}
				},
				error: function(xhr) {
					// XHR错误
					util.hideLoading();
					console.log(xhr);
					util.showAlert('查询模板列表出错，请稍后重试！');
				}
			});
        } 
        
        /*
         * 根据模板ID查询合同模板详情
         */
        function searchTemplateInfo(id) {
        	if (id) {
        		currentTemplateId = id;
        		
        		var params = {
        			contractTemplateId: currentTemplateId
        		};
        		util.showLoading();
        		util.sendRequest({
        			type: 'POST',
        			data: params,
        			action: 'template/searchTemplateDetail.action',
        			success: function(resp) {
        				util.hideLoading();
        				console.log(resp);
        				if (resp.code === 0) {
        					currentTemplateInfo = resp.data;
        				} else{
        					util.showAlert(resp.message || '查询模板信息出错，请稍后重试！');
        				}
        			},
        			error: function(xhr) {
        				// XHR错误
						util.hideLoading();
						console.log(xhr);
						util.showAlert('查询模板信息出错，请稍后重试！');
        			}
        		});
        	}
        }
        
        /*
         * 删除模板
         */
        function setTemplateDel() {
        	util.showConfirm('确定要将“' + currentTemplateInfo.contractTemplateName + '”删除吗？', function() {
        		var params = {
        			contractTemplateId: currentTemplateInfo.contractTemplateId
        		};
        		
        		util.showLoading();
        		util.sendRequest({
        			type: 'POST',
        			data: params,
        			action: 'template/removeTemplate.action',
        			success: function(resp) {
        				util.hideLoading();
        				console.log(resp);
        				if (resp.code === 0) {
        					// 成功删除后直接刷新列表
        					searchTemplateList();
        					that.$('#btnTemplateModify, #btnTemplateDel').attr('disabled','disabled');
        				} else {
        					util.showAlert(resp.message || '模板删除出错，请稍后重试！');
        				}
        			},
        			error: function(xhr) {
        				// XHR错误
						util.hideLoading();
						console.log(xhr);
						util.showAlert('模板删除出错，请稍后重试！');
        			}
        		});
        	});
        }
        
        /**
		 * 跳转页面
		 */
		function jumpPage(){
			var $el = $(this);
			var page = $el.attr('data-page');
			if(page){
				// 修改页面后重新刷新页面数据
				currentPage = page;
				searchTemplateList();
			}
		}
       
        /**
         * 初始化页面事件
         */
        function initPageEvent() {
        	// 模板列表选中
        	that.$container.on('click','#templateListTable tr', function() {
        		that.$('#templateListTable').find('tr').removeClass('info');
        		$(this).addClass('info');
        		var id = $(this).attr('data-id');
        		if (id) {
        			searchTemplateInfo(id);
        		}
        		
        		that.$('#btnTemplateModify, #btnTemplateDel').removeAttr('disabled');
        	});
        	// 查询
        	that.$container.on('click','#btnSearchTemplate',function() {
        		currentPage = 1;
        		searchTemplateList();
        	});
        	// 新增
        	that.$container.on('click','#btnTemplateAdd',function() {
        		that.openPage('topic/contract-template/contract-template-edit',{});
        	});
        	// 修改
        	that.$container.on('click','#btnTemplateModify',function() {
        		that.openPage('topic/contract-template/contract-template-edit',currentTemplateInfo);
        	});
        	// 删除
        	that.$container.on('click','#btnTemplateDel', setTemplateDel);
        	// 分页
        	that.$container.on('click','#templateListPaging a',jumpPage);

        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
        	searchTemplateList();

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
            
            if(data && data.refresh === true) {
                currentPage = 1;
				searchTemplateList();
			}

        };

        /**
         * 窗口缩放事件
         */
        this.onResize = function(){
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