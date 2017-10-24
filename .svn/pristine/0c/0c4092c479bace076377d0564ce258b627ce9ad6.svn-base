define(function(require, exports, module) {
	"use strict";

	var util = require('../../../common/util');
	var DialogBase = require('../../../common/base-dialog');

	var Module = DialogBase.extend(new function() {
		var that;
		var info = null;
		var levelTwo = '';
		var recordTwo = '';
		
		/**
		 * 查询字典表
		 */
		function searchFromDiction() {
			// 重点选题种类
			util.showLoading();
        	util.sendRequest({
				data: {
					'code': '0034'
				},
				action: 'common/searchCodeValue.action',
				success: function(resp) {
					util.hideLoading();
					if(resp.code === 0) {
						var $pointTopicType = that.$('#pointTopicType'),
							$dom;
						for(var i in resp.data) {
							if(resp.data.hasOwnProperty(i)) {
								$dom = $('<option></option>');
								$dom.text(resp.data[i]);
								$dom.val(i);
								if(i === info.pointTopicType) {
									$dom.attr('selected', 'selected');
								}
								$pointTopicType.append($dom);
							}
						}
					} else {
						console.log(resp);
						util.showAlert(resp.message);
					}
				}.bind(this),
				error: function(xhr) {
					console.log(xhr);
					util.showAlert(xhr.message);
				}
			});
			// 出版方式
			util.showLoading();
        	util.sendRequest({
				data: {
					'code': '0035'
				},
				action: 'common/searchCodeValue.action',
				success: function(resp) {
					util.hideLoading();
					if(resp.code === 0) {
						var $publishWayType = that.$('#publishWayType'),
							$dom;
						for(var i in resp.data) {
							if(resp.data.hasOwnProperty(i)) {
								$dom = $('<option></option>');
								$dom.text(resp.data[i]);
								$dom.val(i);
								if(i === info.publishWayType) {
									$dom.attr('selected', 'selected');
								}
								$publishWayType.append($dom);
							}
						}
					} else {
						console.log(resp);
						util.showAlert(resp.message);
					}
				}.bind(this),
				error: function(xhr) {
					console.log(xhr);
					util.showAlert(xhr.message);
				}
			});
			// 选题类型
			util.showLoading();
        	util.sendRequest({
				data: {
					'code': '0036'
				},
				action: 'common/searchCodeValue.action',
				success: function(resp) {
					util.hideLoading();
					if(resp.code === 0) {
						var $topicType = that.$('#topicType'),
							$dom;
						for(var i in resp.data) {
							if(resp.data.hasOwnProperty(i)) {
								$dom = $('<option></option>');
								$dom.text(resp.data[i]);
								$dom.val(i);
								if(i === info.topicType) {
									$dom.attr('selected', 'selected');
								}
								$topicType.append($dom);
							}
						}
					} else {
						console.log(resp);
						util.showAlert(resp.message);
					}
				}.bind(this),
				error: function(xhr) {
					console.log(xhr);
					util.showAlert(xhr.message);
				}
			});
			// 重大选题类型
			util.showLoading();
        	util.sendRequest({
				data: {
					'code': '0032'
				},
				action: 'common/searchCodeValue.action',
				success: function(resp) {
					util.hideLoading();
					if(resp.code === 0) {
						var $topicImportantType = that.$('#topicImportantType'),
							$dom;
						for(var i in resp.data) {
							if(resp.data.hasOwnProperty(i)) {
								$dom = $('<option></option>');
								$dom.text(resp.data[i]);
								$dom.val(i);
								if(i === info.topicImportantType) {
									$dom.attr('selected', 'selected');
								}
								$topicImportantType.append($dom);
							}
						}
					} else {
						console.log(resp);
						util.showAlert(resp.message);
					}
				}.bind(this),
				error: function(xhr) {
					console.log(xhr);
					util.showAlert(xhr.message);
				}
			});
			// 引进版权
			util.showLoading();
        	util.sendRequest({
				data: {
					'code': '0033'
				},
				action: 'common/searchCodeValue.action',
				success: function(resp) {
					util.hideLoading();
					if(resp.code === 0) {
						var $ntroduceCopyrightType = that.$('#ntroduceCopyrightType'),
							$dom;
						for(var i in resp.data) {
							if(resp.data.hasOwnProperty(i)) {
								$dom = $('<option></option>');
								$dom.text(resp.data[i]);
								$dom.val(i);
								if(i === info.ntroduceCopyrightType) {
									$dom.attr('selected', 'selected');
								}
								$ntroduceCopyrightType.append($dom);
							}
						}
					} else {
						console.log(resp);
						util.showAlert(resp.message);
					}
				}.bind(this),
				error: function(xhr) {
					console.log(xhr);
					util.showAlert(xhr.message);
				}
			});
		}
		
		/**
		 * 字典表 二级联动
		 */
		function searchDictionLevel() {
			// 中图分类
			util.showLoading();
        	util.sendRequest({
				data: {},
				action: 'topic/bookType.action',
				success: function(resp) {
					util.hideLoading();
					if(resp.code === 0) {
						levelTwo = resp.data.twoLevel;
						var levelOne = resp.data.oneLevel;
						var $oneLevel = that.$('#bookDetailOneKind'),
							$dom;
						for(var i in levelOne) {
							if(levelOne.hasOwnProperty(i)) {
								$dom = $('<option></option>');
								$dom.text(levelOne[i]);
								$dom.val(i);
								if(i === info.bookDetailOneKind) {
									$dom.attr('selected', 'selected');
								}
								$oneLevel.append($dom);
							}
						}
						bookDetailTwoLevel();
					} else {
						console.log(resp);
						util.showAlert(resp.message);
					}
				}.bind(this),
				error: function(xhr) {
					console.log(xhr);
					util.showAlert(xhr.message);
				}
			});
			// 主要文种类型
			util.showLoading();
        	util.sendRequest({
				data: {},
				action: 'publication/bookType.action',
				success: function(resp) {
					util.hideLoading();
					if(resp.code === 0) {
						recordTwo = resp.data.twoLevel;
						var recordOne = resp.data.oneLevel;
						var $oneRecord = that.$('#mainRecordOneKind'),
							$dom;
						for(var i in recordOne) {
							if(recordOne.hasOwnProperty(i)) {
								$dom = $('<option></option>');
								$dom.text(recordOne[i]);
								$dom.val(i);
								if(i === info.mainRecordOneKind) {
									$dom.attr('selected', 'selected');
								}
								$oneRecord.append($dom);
							}
						}
						recordTwoLevel();
					} else {
						console.log(resp);
						util.showAlert(resp.message);
					}
				}.bind(this),
				error: function(xhr) {
					console.log(xhr);
					util.showAlert(xhr.message);
				}
			});
		}
		
		/**
		 * 中图二级分类
		 */
		function bookDetailTwoLevel() {
			// 先清空二级分类
            var $bookTwoLevel = that.$('#bookDetailTwoKind');
            $bookTwoLevel.empty();
            var $dom;
            // 当前选择的一级分类
            var levelOne = that.$('#bookDetailOneKind').val();
            if (levelTwo[levelOne]) {
                // 重新添加二级分类
                for (var i in levelTwo[levelOne]) {
                    if (levelTwo[levelOne].hasOwnProperty(i)) {
                        $dom = $('<option></option>');
                        $dom.text(levelTwo[levelOne][i]);
                        $dom.val(i);
                        if (i === info.bookDetailTwoKind) {
                            $dom.attr('selected', 'selected');
                        }
                        $bookTwoLevel.append($dom);
                    }
                }
            }
		}
		
		/**
		 * 主要文种
		 */
		function recordTwoLevel() {
			// 先清空二级分类
            var $recordTwoLevel = that.$('#mainRecordTwoKind');
            $recordTwoLevel.empty();
            var $dom;
            // 当前选择的一级分类
            var recordOne = that.$('#mainRecordOneKind').val();
            if (recordTwo[recordOne]) {
                // 重新添加二级分类
                for (var i in recordTwo[recordOne]) {
                    if (recordTwo[recordOne].hasOwnProperty(i)) {
                        $dom = $('<option></option>');
                        $dom.text(recordTwo[recordOne][i]);
                        $dom.val(i);
                        if (i === info.mainRecordTwoKind) {
                            $dom.attr('selected', 'selected');
                        }
                        $recordTwoLevel.append($dom);
                    }
                }
            }
		}

		/**
		 * 保存数据
		 */
		function savePublishInfo() {
			// 表单验证
			var $form = that.$('#formPublishEdit');
			// 没有错误开始处理
			if(that.validate($form) === true) {
				// 通过公共方法生成表单参数
				var params = that.buildFormParams($form.find('input, textarea, select'));
				params.zPublishPlanReportDetailId = $form.find('input[name="zPublishPlanReportDetailId"]').val();
				// 下发请求
				util.showLoading();
				util.sendRequest({
					type: 'POST',
					data: params,
					action: 'publication/updateReport.action',
					success: function(resp) {
						util.hideLoading();
						if(resp.code === 0) {
							// 业务执行成功
							util.showAlert('数据保存成功!', function() {
								// 关闭页面
								that.close({
									refresh: true
								});
							});
						} else {
							// 业务执行失败
							util.showAlert(resp.message);
						}
					},
					error: function(xhr) {
						// XHR错误
						util.hideLoading();
						console.log(xhr);
						util.showAlert(xhr);
					}
				});
			}
		}

		/**
		 * 初始化页面事件
		 */
		function initPageEvent() {
			// 保存
			that.$container.on('click', '#btnPublishSave', savePublishInfo);
			// 中图二级分类
			that.$container.on('change', '#bookDetailOneKind', bookDetailTwoLevel);
			// 主要文种
			that.$container.on('change', '#mainRecordOneKind', recordTwoLevel);
		}

		/**
		 * 初始化页面数据
		 */
		function initPageData() {
			// 直接从前一个页面传送数据，所以此处不需要查询数据
			that.$('input.date-time-year').datetimepicker({
				format: 'YYYY',
				locale: 'zh-cn',
				sideBySide: true
			});
			that.$('input.date-time-month').datetimepicker({
				format: 'MM',
				locale: 'zh-cn',
				sideBySide: true
			});
			// 从字典表查的内容
			searchFromDiction();
			// 从字典表查的内容 二级联动
			searchDictionLevel();
			
			that.initValidate(that.$('#formPublishEdit'));
		}

		/**
		 * 初始化时被调用
		 */
		this.onInit = function($el, tpl, data, indexRef) {
			this._super($el, tpl, data, indexRef);
			that = this;
			info = data;

			that.initTemplate(tpl, {
				info: data
			});
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