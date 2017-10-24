define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var PageBase = require('../../../common/base-page');
    
    // 日志列表模板
    var listTpl = require('./work-record-list.tpl');
    
    // 日期组件
    require('../../../assets/plugins/bootstrap-datetimepicker/js/bootstrap-datatimepicker');
    require('../../../assets/plugins/bootstrap-datetimepicker/js/moment-with-locales');
    require('../../../assets/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css');

    var Module = PageBase.extend(new function () {
        var that;
        
        var currentPage = 1;
        var searchParams = {};
        
        /**
		 * 搜索部门列表
		 */
		function searchDepartmentList() {
			var params = {
				searchDepartmentName: ""
			};
			util.sendRequest({
				type: 'POST',
				action: 'department/listDepartmentNoPage.action',
				data: params,
				success: function(resp) {
					if(resp.code === 0) {
						var $select = that.$('#selUserOptionDept');
						var $option;
						for(var i = 0; i < resp.data.length; i++) {
							$option = $('<option></option>');
							$option.text(resp.data[i].departmentName);
							$option.attr('value', resp.data[i].departmentId);
							$select.append($option);
						}
					} else {
						console.log(resp);
					}
				},
				error: function(xhr) {
					// XHR错误
					console.log(xhr);
				}
			});
		}

		/**
		 *  查询工作记录列表
		 */
		function searchLogs(){
            var params = $.extend({},searchParams);
            params.page = currentPage;

            util.showLoading('');
            util.sendRequest({
                type: 'POST',
                data: params,
                action: 'workFactory/searchWorkFactoryDetail.action', 
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        that.$('#logListTable').html(util.template(listTpl, {list:resp.data.records}));
						if(resp.data.records.length === 0) {
							util.showAlert('没有符合条件的查询结果。');
						}
                        // 分页数据
                        that.$('#logManagePaging').html(that.buildPagination(resp.data.pageNow, resp.data.pageCount));
                    } else {
                        util.showAlert(resp.message || '查询日志列表出错，请稍后重试！');
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('查询日志列表出错，请稍后重试！');
                }
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
				searchLogs();
			}
		}

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
        	// 时间组件
            that.$('#datetimeStart').datetimepicker({
                format: 'YYYY-MM-DD HH:mm:ss',
                locale: 'zh-cn',
                showClose: true,
                sideBySide: true,
                showClear: true,
                toolbarPlacement: 'bottom',
                maxDate:new Date()
            });

			that.$('#datetimeEnd').datetimepicker({
                format: 'YYYY-MM-DD HH:mm:ss',
                locale: 'zh-cn',
                sideBySide: true,
                useCurrent: false,
                showClear: true,
                showClose: true,
                toolbarPlacement: 'bottom',
                maxDate:new Date()
            });

            $("#datetimeStart").on("dp.change", function(e) {
                $('#datetimeEnd').data("DateTimePicker").minDate(e.date);
            });
            $("#datetimeEnd").on("dp.change", function(e) {
                $('#datetimeStart').data("DateTimePicker").maxDate(e.date);
            });
            
            // 查询
			that.$container.on('click', '#btnSearchLogs', function(){
            	searchParams = that.buildSearchParams(that.$('#formSearchLog input[data-search],select[data-search]'));
				currentPage = 1;
				searchLogs();
			});
			
			// 分页
			that.$container.on('click', '#logManagePaging a', jumpPage);

        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
        	// 搜索部门列表
			searchDepartmentList();
			searchLogs();
        }

        /**
         * 初始化时被调用
         */
        this.onInit = function ($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);
            that = this;
            that.initTemplate(tpl, {});
			// 重新初始化数据
			currentPage = 1;
			searchParams = {};
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
            this._super();

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