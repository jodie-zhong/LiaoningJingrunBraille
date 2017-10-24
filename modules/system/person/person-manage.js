define(function(require, exports, module) {
	"use strict";

	var util = require('../../../common/util');
	var PageBase = require('../../../common/base-page');
	// jstree组件依赖
	require('../../../assets/plugins/jstree/jstree.min');
	require('../../../assets/plugins/jstree/src/themes/default/style.min.css');

	var listTpl = require('./person-manage-list.tpl');
	var infoTpl = require('./person-manage-info.tpl');

	var Module = PageBase.extend(new function() {
		var that;
		// 当前选中的页数
		var currentPage = 1;
		// 当前选中的部门ID
		var currentDepartmentId = '';
		// 当前选中的人员ID
		var currentPersonId = '';
		// 当前选中的人员是否在职
		var currentPersonUse = '';
		// 当前选中人员信息
		var currentUserInfo = null;
		// 搜索部门名称
		var currentDepartmentName = '';

		var departmentTree = null;
		var userIds = '';
		var userNames = '';
		var searchParams = {};
		// 导入文件
		var currentFile = '';

		/**
		 * 查询部门列表 树
		 */
		function searchDepartmentTree() {
			var params = {};
			util.sendRequest({
				type: 'POST',
				action: 'department/listDepartmentNoPage.action',
				data: params,
				success: function(resp) {
					if(resp.code === 0) {
						if(departmentTree) {
							departmentTree.jstree().destroy();
							departmentTree.empty();
							departmentTree = null;
						}
						// 生成树的基础数据
						var treeData = {
							'core': {
								'data': [{
									'text': '部门',
									'icon': 'fa fa-sitemap',
									'state': {
										'opened': true,
										'selected': false
									},
									'children': []
								}]
							}
						};
						// 部门列表
						var list = treeData.core.data[0].children;
						for(var i = 0; i < resp.data.length; i++) {
							list.push({
								'text': resp.data[i].departmentName + '（' + resp.data[i].departmentUserNum + '）',
								'icon': 'fa fa-bookmark-o',
								'data': {
									'id': resp.data[i].departmentId,
									'name': resp.data[i].departmentName
								}
							});
						}
						// 生成树，并绑定切换事件
						departmentTree = that.$('#treeView').jstree(treeData).bind('changed.jstree', function(src, evt) {
							// 点击树节点后重新检索人员列表
							var data = evt.node.data;
							if(data && data.id) {
								currentDepartmentId = data.id;
								currentDepartmentName = data.name;
								currentPage = 1;
								that.$('input,select').val('');
								that.$('#selUserOptionRole option').remove();
								searchParams = {};
								searchRoleList()
								searchPersonList();
							} else {
								currentDepartmentId = '';
								currentDepartmentName = '';
								currentPage = 1;
								that.$('input,select').val('');
								that.$('#selUserOptionRole option').remove();
								searchParams = {};
								searchRoleList()
								searchPersonList();
							}
						});
					} else {
                        console.log(resp);
						util.showAlert(resp.message || '查询部门列表出错，请稍后重试！');
					}
				},
				error: function(xhr) {
					// XHR错误
                    console.log(xhr);
                    util.hideLoading();
                    util.showAlert('查询部门列表出错，请稍后重试！');
				}
			});
		}
		
		/**
		 * 搜索角色列表
		 */
		function searchRoleList() {
			var params = {};
			params.searchDepartmentId = currentDepartmentId;
			util.sendRequest({
				type: 'POST',
				action: 'role/listRoleNoPage.action',
				data: params,
				success: function(resp) {
					if(resp.code === 0) {
						var $select = that.$('#selUserOptionRole');
						var $option;
						$option = $('<option></option>');
						$option.text('全部');
						$option.attr('value', '');
						$select.append($option);
						for(var i = 0; i < resp.data.length; i++) {
							$option = $('<option></option>');
							$option.text(resp.data[i].roleName);
							$option.attr('value', resp.data[i].roleId);
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
		 * 查询人员列表
		 */
		function searchPersonList() {
			that.$('#btnPersonModify').attr('disabled', 'disabled');
			that.$('#btnPersonResume').attr('disabled', 'disabled');
			that.$('#btnPersonLeave').attr('disabled', 'disabled');
			that.$('i[data-action="check"]').removeClass('fa-check-square-o').addClass('fa-square-o');
			// 清空个人信息
			searchPersonInfo('');

			var params = $.extend({}, searchParams);
			params.page = currentPage;
			params.searchDepartmentId = currentDepartmentId;
			params.searchDepartmentName = currentDepartmentName;
			util.showLoading();
			util.sendRequest({
				type: 'POST',
				data: params,
				action: 'user/listUser.action',
				success: function(resp) {
					util.hideLoading();
					if(resp.code === 0) {
						that.$('#personListTable').html(util.template(listTpl, {
							list: resp.data.records,
							action: true
						}));
						// 分页数据
						that.$('#personListPaging').html(that.buildPagination(resp.data.pageNow, resp.data.pageCount));
					} else {
						util.showAlert(resp.message || '查询人员列表出错，请稍后重试！');
					}
				},
				error: function(xhr) {
					// XHR错误
                    console.log(xhr);
					util.hideLoading();
					util.showAlert('查询人员列表出错，请稍后重试！');
				}
			});
		}

		/**
		 * 根据人员ID查询人员信息
		 */
		function searchPersonInfo(id, isModify) {
			if(id) {
				var params = {
					userId: id
				};
				util.showLoading();
				util.sendRequest({
					data: params,
					action: 'user/detailUser.action',
					success: function(resp) {
						util.hideLoading();
						if(resp.code === 0) {
							if(isModify) {
								that.openPage('system/person/person-manage-edit', resp.data);
							} else {
								if(resp.data.userHead) {
									resp.data.userHead = util.getResourceRoot() + resp.data.userHead;
								}
								that.$('#personInfoTable').html(util.template(infoTpl, {
									info: resp.data,
									action: true
								}));
							}
						} else {
							util.showAlert(resp.message || '查询人员信息出错，请稍后重试！');
						}
					},
					error: function(xhr) {
						// XHR错误
                        console.log(xhr);
						util.hideLoading();
						util.showAlert('查询人员信息出错，请稍后重试！');
					}
				});
			} else {
				// 默认展示空列表
				var infoHtml = util.template(infoTpl, {
					info: [],
					action: false
				});
				that.$('#personInfoTable').html(infoHtml);
			}
		}

		/**
		 * 人员离职恢复
		 */
		function setPersonReturn() {
			util.showConfirm('确定要将“' + userNames + '”复职吗？', function() {
				var params = {
					isUse: '1',
					userId: userIds,
					userName: userNames
				};
				util.showLoading();
				util.sendRequest({
					type: 'POST',
					data: params,
					action: 'user/modifyUserIsUse.action',
					success: function(resp) {
						util.hideLoading();
						if(resp.code === 0) {
							// 成功之后直接刷新列表
							currentPage = 1;
							searchPersonList();
						} else {
							util.showAlert(resp.message || '人员复职出错，请稍后重试！');
						}
					},
					error: function(xhr) {
						// XHR错误
                        console.log(xhr);
						util.hideLoading();
						util.showAlert('人员复职出错，请稍后重试！');
					}
				});
			});
		}

		/**
		 * 人员离职
		 */
		function setPersonLeave() {
			util.showConfirm('确定要将“' + userNames + '”离职吗？', function() {
				var params = {
					isUse: '2',
					userId: userIds,
					userName: userNames
				};
				util.showLoading();
				util.sendRequest({
					type: 'POST',
					data: params,
					action: 'user/modifyUserIsUse.action',
					success: function(resp) {
						util.hideLoading();
						if(resp.code === 0) {
							// 成功之后直接刷新列表
							currentPage = 1;
							searchPersonList();
						} else {
                            console.log(resp);
							util.showAlert(resp.message || '人员离职出错，请稍后重试！');
						}
					},
					error: function(xhr) {
						// XHR错误
                        console.log(xhr);
						util.hideLoading();
						util.showAlert('人员离职出错，请稍后重试！');
					}
				});
			});
		}

		/**
		 * 跳转页面
		 */
		function jumpPage() {
			var $el = $(this);
			var page = $el.attr('data-page');
			if(page) {
				// 修改页面后重新刷新页面数据
				currentPage = page;
				searchPersonList();
				that.$('#btnPersonModify,#btnPersonResume,#btnPersonLeave').attr('disabled', 'disabled');
			}
		}
		
		/**
		 * 导入文件
		 */
		function importFile() {
			var params = {
				filePath: currentFile
			}
			
			util.showLoading();
			util.sendRequest({
				type: 'POST',
				data: params,
				action: 'user/importUserExcel.action',
				success: function(resp) {
					util.hideLoading();
						if(resp.code === 0) {
							util.showAlert('人员导入成功');
							// 成功之后直接刷新列表
							currentPage = 1;
							searchPersonList();
						} else {
                            console.log(resp);
							util.showAlert(resp.message || '人员离职出错，请稍后重试！');
						}
				},
				error: function(xhr) {
					// XHR错误
                    console.log(xhr);
					util.hideLoading();
					util.showAlert('人员导入出错，请稍后重试！');
				}
			});
		}

		/**
		 * 初始化页面事件
		 */
		function initPageEvent() {
			// 人员列表选中
			that.makeSelectableTable('#personListTableContainer',
				function() {
					var id = that.$('#personListTable').find('tr.info').attr('data-id');
					searchPersonInfo(id);
				},
				function() {
					// 默认先禁用所有按钮
					that.$('#btnPersonModify').attr('disabled', 'disabled');
					that.$('#btnPersonResume').attr('disabled', 'disabled');
					that.$('#btnPersonLeave').attr('disabled', 'disabled');

					var $row, count = 0;
					var ids = [],
						names = [],
						use = [];
					that.$('#personListTable tr').each(function() {
						$row = $(this);
						if($row.find('i[data-action="check"]').hasClass('fa-check-square-o')) {
							ids.push($row.attr('data-id'));
							names.push($row.attr('data-name'));
							use.push($row.attr('data-use'));
							currentPersonId = $row.attr('data-id');
							currentPersonUse = $row.attr('data-use');
							count++;
						}
					});
					// 当选中的人均为在职时，离职按钮可用， 均为离职时在职按钮可用
					if(use.indexOf('1') !== -1 && use.indexOf('2') === -1) {
						that.$('#btnPersonLeave').removeAttr('disabled');
					} else if(use.indexOf('2') !== -1 && use.indexOf('1') === -1) {
						that.$('#btnPersonResume').removeAttr('disabled');
					}
					userIds = ids.join(',');
					userNames = names.join(',');
					// 只勾选了一个人员，并且为在职，修改可用
					if(count === 1 && currentPersonUse === '1') {
						that.$('#btnPersonModify').removeAttr('disabled');
					} else {
						currentPersonId = '';
					}
				});
			// 人员列表查询
			that.$container.on('click', '#btnSearchUser', function() {
				searchParams = that.buildSearchParams(that.$('#formSearchUser input[data-search],select[data-search]'));
				currentPage = 1;
				searchPersonList();
			});
			// 新增
			that.$container.on('click', '#btnPersonAdd', function() {
				that.openPage('system/person/person-manage-edit', {
					departmentName: currentDepartmentName,
					departmentId: currentDepartmentId
				});
			});
			// 修改
			that.$container.on('click', '#btnPersonModify', function() {
				searchPersonInfo(currentPersonId, true);
			});
			// 复职
			that.$container.on('click', '#btnPersonResume', setPersonReturn);
			// 离职
			that.$container.on('click', '#btnPersonLeave', setPersonLeave);
			// 人员导入
			that.$container.on('click', '#btnPersonImport', function() {
				that.openPage('public/file/file-upload', {"type": "*.xls;*.xlsx"});
			});
			// 分页
			that.$container.on('click', '#personListPaging a', jumpPage);
		}

		/**
		 * 初始化页面数据
		 */
		function initPageData() {
			// 左侧部门树
			searchDepartmentTree();
			// 右侧人员列表
			searchPersonList();
			// 查询角色
			searchRoleList();
		}

		/**
		 * 初始化时被调用
		 */
		this.onInit = function($el, tpl, data, indexRef) {
			this._super($el, tpl, data, indexRef);
			that = this;
			that.initTemplate(tpl, {});
			// 重新初始化数据
			currentPage = 1;
			currentDepartmentId = '';
			currentPersonId = '';
			currentPersonUse = '';
			currentUserInfo = null;
			currentDepartmentName = '';
			departmentTree = null;
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
		this.onBack = function(data) {
			this._super(data);

			if(data && data.refresh === true) {
				currentPage = 1;
				searchPersonList();
				searchDepartmentTree();
			}
			var excal = data.id;
			if (data && data.id) {
				currentFile = excal;
				importFile();
			}
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