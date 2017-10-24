define(function(require, exports, module) {
	"use strict";

	var ItemBase = require('../item-base');
	var util = require('../../../../../common/util.js');
	require('./validInput.js');
	var info = [];

	/**
	 * Workflow Item
	 */
	var Item = ItemBase.extend({
		// 保存/提交接口
		saveAction: 'examine/saveOrSubmitExamine.action',
		// 查询接口
		detailAction: 'examine/searchExamineDetail.action',

		levelTwo: {},

		/**
		 * 自动生成
		 */
		onAutoPage: function($auto) {
			var params = {};
			params.bookId = this.$('input[name="bookId"]').val();
			params.bookDetailName = this.$('input[name="bookDetailName"]').val();
			params.bookDetailOldAuthor = this.$('input[name="bookDetailOldAuthor"]').val();
			params.bookFileType = $auto.parent().parent().find('input[name="bookFileType"]').val();
			params.bookFileTypeName = $auto.parent().parent().find('input[name="bookFileTypeName"]').val();
			if(!params.bookDetailName) {
				util.showAlert('请填写图书名称');
			} else if(!params.bookDetailOldAuthor) {
				util.showAlert('请填写作者');
			} else {
				util.sendRequest({
					data: params,
					action: 'common/buildWord.action',
					success: function(resp) {
						util.hideLoading();
						if(resp.code === 0) {
							$auto.parent().parent().find('input[name="bookFileName"]').val(resp.data.backName);
							$auto.parent().parent().find('input[name="bookFileName"]').attr('data-value', resp.data.wordPath);
							$auto.parent().parent().find('input[name="bookFileName"]').change();
						} else {
							console.log(resp);
							util.showAlert(resp.message);
						}
						// 预览
						util.openPage('public/preview/html-preview', {
							url: util.getServerBase() + resp.data.htmlPath
						});
					}
				});
			}
		},

		onAutoPageFascicle: function($auto) {
			var params = {};
			params.bookId = this.$('input[name="bookId"]').val();
			params.bookDetailName = this.$('input[name="bookDetailName"]').val();
			params.bookDetailOldAuthor = this.$('input[name="bookDetailOldAuthor"]').val();
			params.bookFileType = $auto.parent().parent().find('input[name="bookFascicleType"]').val();
			params.bookFileTypeName = $auto.parent().parent().find('input[name="bookFascicleTypeName"]').val();
			params.bookFascicleBookName = $auto.parents('div[data-area="fascicle"]').find('input[name="bookFascicleBookName"]').val();
			if(!params.bookDetailName) {
				util.showAlert('请填写图书名称');
			} else if(!params.bookDetailOldAuthor) {
				util.showAlert('请填写作者');
			} else if (!params.bookFascicleBookName) {
				util.showAlert('请填写分册序号');
			} else{
				util.sendRequest({
					data: params,
					action: 'common/buildWord.action',
					success: function(resp) {
						util.hideLoading();
						if(resp.code === 0) {
							$auto.parent().parent().find('input[name="bookFascicleName"]').val(resp.data.backName);
							$auto.parent().parent().find('input[name="bookId"]').val(resp.data.bookId);
							$auto.parent().parent().find('input[name="bookFascicleName"]').attr('data-value', resp.data.wordPath);
							$auto.parent().parent().find('input[name="bookFascicleName"]').change();
						} else {
							console.log(resp);
							util.showAlert(resp.message);
						}
						util.openPage('public/preview/html-preview', {
							url: util.getServerBase() + resp.data.htmlPath
						});
					}
				});
			}
		},

		/**
		 * 初始化盲文形式
		 */
		searchBookForm: function() {
			util.sendRequest({
				data: {
					'code': '0010'
				},
				action: 'common/searchCodeValue.action',
				success: function(resp) {
					util.hideLoading();
					if(resp.code === 0) {
						var $typeOneElement = this.$('#bookDetailBrailleForm'),
							$dom;
						for(var i in resp.data) {
							if(resp.data.hasOwnProperty(i)) {
								$dom = $('<option></option>');
								$dom.text(resp.data[i]);
								$dom.val(i);
								if(i === this.data.info.bookDetailBrailleForm) {
									$dom.attr('selected', 'selected');
								}
								$typeOneElement.append($dom);
							}
						}
						this.buildLevel2Type();
					} else {
						console.log(resp);
						util.showAlert(resp.message || '查询图书分类出错，请稍后重试！');
					}
				}.bind(this),
				error: function(xhr) {
					console.log(xhr);
					util.showAlert(resp.message || '查询图书分类出错，请稍后重试！');
				}
			});
		},

		/**
		 * 初始化图书类别
		 */
		searchBookType: function() {
			util.sendRequest({
				data: {},
				action: 'topic/bookType.action',
				success: function(resp) {
					util.hideLoading();
					if(resp.code === 0) {
						this.levelTwo = resp.data.twoLevel;
						var levelOne = resp.data.oneLevel;
						var $typeOneElement = this.$('#bookTopicOne'),
							$dom;
						for(var i in levelOne) {
							if(levelOne.hasOwnProperty(i)) {
								$dom = $('<option></option>');
								$dom.text(levelOne[i]);
								$dom.val(i);
								if(i === this.data.info.bookDetailOneKind) {
									$dom.attr('selected', 'selected');
								}
								$typeOneElement.append($dom);
							}
						}
						this.buildLevel2Type();
					} else {
						console.log(resp);
						util.showAlert(resp.message || '查询图书分类出错，请稍后重试！');
					}
				}.bind(this),
				error: function(xhr) {
					console.log(xhr);
					util.showAlert(resp.message || '查询图书分类出错，请稍后重试！');
				}
			});
		},

		/**
		 * 生成选题类型子类
		 */
		buildLevel2Type: function() {
			// 先清空二级分类
			var $typeTwoElement = this.$('#bookTopicTwo');
			$typeTwoElement.empty();
			var $dom;
			// 当前选择的一级分类
			var levelOne = this.$('#bookTopicOne').val();
			if(this.levelTwo[levelOne]) {
				// 重新添加二级分类
				for(var i in this.levelTwo[levelOne]) {
					if(this.levelTwo[levelOne].hasOwnProperty(i)) {
						$dom = $('<option></option>');
						$dom.text(this.levelTwo[levelOne][i]);
						$dom.val(i);
						if(i === this.data.info.bookDetailTwoKind) {
							$dom.attr('selected', 'selected');
						}
						$typeTwoElement.append($dom);
					}
				}
			}
		},
		
		/**
		 * 预览
		 */
		onPresee: function($btn) {
			var html = $btn.parents('tr[data-area="cover"]').find('input[name="bookFileName"]').attr('data-value') || $btn.parents('div[data-area="fascicle"]').find('input[name="bookFascicleName"]').attr('data-value');
			var Id = $btn.parents('tr[data-area="cover"]').find('input[name="bookId"]').val();
			if (html) {
				util.showLoading();
				util.sendRequest({
					action: 'common/coverPreview.action',
//					data: {wordPath:html, bookId: Id},
					data: {filePath:html},
					success: function(resp) {
						util.hideLoading();
						if (resp.code === 0) {
							// 预览
							util.openPage('public/preview/html-preview', {
								url: util.getServerBase() + resp.data
							});
						} else{
							console.log(resp);
							util.showAlert(resp.message || '预览出错，请稍后重试！');
						}
					},
					error: function(xhr) {
						// XHR错误
                        util.hideLoading();
                        util.showAlert('预览出错，请稍后重试！');
					}
				})
			}
		},
		
		/**
		 * 预览查看
		 */
		onPreview: function($btn) {
			var html = $btn.attr('data-address');
			if (html) {
				util.showLoading();
				util.sendRequest({
					action: 'common/coverPreview.action',
					data: {filePath:html},
					success: function(resp) {
						util.hideLoading();
						if (resp.code === 0) {
							util.openPage('public/preview/html-preview', {
								url: util.getServerBase() + resp.data
							});
						} else{
							console.log(resp);
							util.showAlert(resp.message || '预览出错，请稍后重试！');
						}
					},
					error: function(xhr) {
						// XHR错误
                        util.hideLoading();
                        util.showAlert('预览出错，请稍后重试！');
					}
				})
			}
		},

		// 是否分册判断
		onPagination: function() {
			var pagination = this.$('input[name="bookIsFascicle"]:checked').val();
			this.$('div[data-area="pageinfo"]').hide();
			if(pagination === '1') {
				this.$('tr[data-type="3"]').show();
				this.$('div[data-area="pageinfo"]').hide();
			} else {
				this.$('tr[data-type="3"]').hide();
				this.$('div[data-area="pageinfo"]').show();
			}
		},
		// 分页添加
		onPagePlus: function() {
			var pageCopy = this.$('#fascicleTemplate').html();
			this.$('div[data-area="fascicle"]').last().after(pageCopy);
			this.searchMinusButton();
			this.addValidateField(this.$('input[name="bookFascicleBookName"]'));
			this.addValidateField(this.$('input[name="bookFascicleWords"]'));
		},
		// 分页删除
		onPageMinus: function($btn) {
			$btn.parents('div[data-area="fascicle"]').remove();
			this.searchMinusButton();
		},
		/**
		 * 原书出版时间及版次 增加
		 */
		onPublishPlus: function() {
			var publishCopy;
			publishCopy = this.$('div[data-copy= "publish"]').eq(0).clone();
			publishCopy.find('input').val('');
			this.addValidateField(this.$('input[name="bookDetailOldPublicationDate"]'));
			this.addValidateField(this.$('input[name="bookDetailOldEdition"]'));
			this.addValidateField(this.$('input[name="bookDetailOldRevision"]'));
			publishCopy.appendTo('div[data-type = "publish"]');
			this.$('input.date-time').datetimepicker({
				format: 'YYYY-MM',
				locale: 'zh-cn',
				sideBySide: true,
				widgetPositioning: {
					vertical: 'bottom',
					horizontal: 'auto'
				}
			});
			this.searchMinusButton();
		},
		/**
		 * 原书出版时间及版次 删除
		 */
		onPublishMinus: function($btn) {
			$btn.parents('div[data-copy= "publish"]').remove();
			this.searchMinusButton();
		},
		// 加工记录添加
		onMachPlus: function() {
			var machCopy;
			machCopy = this.$('div[data-area = "machining"]').eq(0).clone();
			machCopy.find('textarea').val('');
			machCopy.appendTo('div[data-type = "mach-record"]');
			this.searchMinusButton();
			this.machNum();
		},
		// 加工记录删除
		onMachMinus: function($btn) {
			$btn.parents('div[data-area = "machining"]').remove();
			this.searchMinusButton();
			this.machNum();
		},

		// 判断有几条数据
		searchMinusButton: function() {
			// 判断原书出版时间及版次长度
			var publishLength = this.$('div[data-copy= "publish"]').length;
			if(publishLength !== 1) {
				this.$('button[data-type="publish-minus"]').show();
				this.$('button[data-type="publish-plus"]').hide();
				this.$('button[data-type="publish-plus"]').last().show();
			} else {
				this.$('button[data-type="publish-minus"]').hide();
				this.$('button[data-type="publish-plus"]').show();
			}
			// 判断加工记录
			var machLength = this.$('div[data-area = "machining"]').length;
			if(machLength !== 1) {
				this.$('button[data-type="record-minus"]').show();
				this.$('button[data-type="record-plus"]').hide();
				this.$('button[data-type="record-plus"]').last().show();
			} else {
				this.$('button[data-type="record-minus"]').hide();
				this.$('button[data-type="record-plus"]').show();
			}
			//判断分册信息
			var fasLength = this.$('div[data-area="fascicle"]').length;
			if(fasLength !== 1) {
				this.$('button[data-type="page-minus"]').show();
			} else {
				this.$('button[data-type="page-minus"]').hide();
			}
		},

		// 加工记录序号
		machNum: function() {
			var i = 1;
			this.$('div[data-area="machining"]').each(function() {
				$(this).find('span[data-value = "number"]').text(i++);
			});
		},

		// 初审结果判断
		onHandleChange: function() {
			var handle = this.$('input[name="handleState"]:checked').val();
			this.$('div[data-area="nextFlow"]').hide();
			if(handle === '1') {
				// 建议发稿
				this.$('div[data-flow="secondAudit"]').show();
				this.$('div[data-flow="otherFirstAudit"]').show();
				this.$('div[data-area="opinion"]').show();
			} else {
				// 退稿
				this.$('div[data-flow="abandoned"]').show();
				this.$('div[data-area="opinion"]').hide();
			}
		},

		/**
		 * 保存或提交工作流
		 */
		getFormData: function() {
			var $form = this.$('#formEdit');
			// 先调用父类生成基本的数据结构
			var params = this._super();
			// 处理封面部份数据结构
			params.coverList = []; // 封面信息
			var $tr;
			$form.find('tr[data-area="cover"]').each(function() {
				$tr = $(this);
				params.coverList.push({
					bookFileType: $tr.find('input[name="bookFileType"]').val(),
					bookFileTypeName: $tr.find('input[name="bookFileTypeName"]').val(),
					bookFileName: $tr.find('input[name="bookFileName"]').val(),
					bookFileAddress: $tr.find('input[name="bookFileName"]').attr('data-value')
				});
			});
			params.machiningRecordList = []; // 加工记录
			var $div;
			$form.find('div[data-area="machining"]').each(function() {
				$div = $(this);
				var record = $div.find('textarea[name="machiningRecord"]').val();
				if (record) {
				params.machiningRecordList.push({
					machiningRecord: $div.find('textarea[name="machiningRecord"]').val()
				});	
				}
				
			});
			params.fascicleList = []; // 分册信息
			var $info;
			$form.find('div[data-area="fascicle"]').each(function() {
				$info = $(this);
				params.fascicleList.push({
					bookFascicleBookName: $info.find('input[name="bookFascicleBookName"]').val(),
					bookFascicleWords: $info.find('input[name="bookFascicleWords"]').val(),
					bookFascicleType: $info.find('input[name="bookFascicleType"]').val(),
					bookFascicleTypeName: $info.find('input[name="bookFascicleTypeName"]').val(),
					bookFascicleName: $info.find('input[name="bookFascicleName"]').val(),
					bookFascicleAddress: $info.find('input[name="bookFascicleName"]').attr('data-value'),
					bookFascicleLocation: $info.find('textarea[name="bookFascicleLocation"]').val()
				});
			});
			// 作者列表组装
			var tmp = [];
            $form.find("input[name='bookDetailOldAuthor']").each(function () {
                tmp.push($(this).val());
            });
            params.bookDetailOldAuthor = tmp.join(",");
            // 著作方式列表组装
            tmp = [];
            $form.find("input[name='bookDetailWorkWay']").each(function () {
                tmp.push($(this).val());
            });
            params.bookDetailWorkWay = tmp.join(",");
            // 原书版次列表组装
            tmp = [];
            $form.find("input[name='bookDetailOldEdition']").each(function () {
                tmp.push($(this).val());
            });
            params.bookDetailOldEdition = tmp.join(",");
            // 原书版次列表组装
            tmp = [];
            $form.find("input[name='bookDetailOldRevision']").each(function () {
                tmp.push($(this).val());
            });
            params.bookDetailOldRevision = tmp.join(",");
            // 出版时间列表组装
            tmp = [];
            $form.find("input[name='bookDetailOldPublicationDate']").each(function () {
                tmp.push($(this).val());
            });
            params.bookDetailOldPublicationDate = tmp.join(",");
			return params;
		},

		/**
		 * 初始化页面事件
		 */
		initPageEvent: function() {
			var that = this;
			this.$('input.date-time').datetimepicker({
				format: 'YYYY-MM',
				locale: 'zh-cn',
				sideBySide: true,
				widgetPositioning: {
					vertical: 'bottom',
					horizontal: 'auto'
				}
			});
			// 选题类型子类
			this.$container.on('change', '#bookTopicOne', this.buildLevel2Type.bind(this));
			// 是否分册
			this.$container.on('change', 'input[name="bookIsFascicle"]', this.onPagination.bind(this));
			// 分页信息
			this.$container.on('click', 'button[data-type="page-plus"]', this.onPagePlus.bind(this));
			this.$container.on('click', 'button[data-type="page-minus"]', function() {
				that.onPageMinus($(this));
			});
			// 原书出版时间及版次
			this.$container.on('click', 'button[data-type="publish-plus"]', this.onPublishPlus.bind(this));
			this.$container.on('click', 'button[data-type="publish-minus"]', function() {
				that.onPublishMinus($(this));
			});
			// 加工记录
			this.$container.on('click', 'button[data-type="record-plus"]', this.onMachPlus.bind(this));
			this.$container.on('click', 'button[data-type="record-minus"]', function() {
				that.onMachMinus($(this));
			});
			// 初审结果
			this.$container.on('change', 'input[name="handleState"]', this.onHandleChange.bind(this));
			// 自动生成
			this.$container.on('click', 'button[data-type="autoGeneration"]', function() {
				that.onAutoPage($(this));
			});
			// 自动生成分册
			this.$container.on('click', 'button[data-type="autoGeneration-fascicle"]', function() {
				that.onAutoPageFascicle($(this));
			});
			//附件input框change事件
			this.$container.on('change', 'input[name="bookFileName"]', function() {
				var address = $(this).attr('data-value');
				if (address) {
					$(this).parents('tr').find('button[data-down="down"]').removeAttr('disabled');
					$(this).parents('tr').find('button[data-down="see"]').removeAttr('disabled');
				} else{
					$(this).parents('tr').find('button[data-down="down"]').attr('disabled', 'disabled');
					$(this).parents('tr').find('button[data-down="see"]').attr('disabled', 'disabled');
				}
			});
			this.$container.on('change','input[name="bookFascicleName"]', function () {
				var address = $(this).attr('data-value');
				if (address) {
					$(this).parents('div.form-group').find('button[data-down="down"]').removeAttr('disabled');
					$(this).parents('div.form-group').find('button[data-down="see"]').removeAttr('disabled');
				} else{
					$(this).parents('div.form-group').find('button[data-down="down"]').attr('disabled', 'disabled');
					$(this).parents('div.form-group').find('button[data-down="see"]').attr('disabled', 'disabled');
				}
			});
			// 文件下载
			that.$container.on('click','button[data-down="down"]', function() {
				var flie = $(this).parents('tr[data-area="cover"]').find('input[name="bookFileName"]').attr('data-value');
				if (flie) {
					window.open(util.getServerBase() + 'common/downloadFile.action?path=' + encodeURIComponent(flie), '_blank');
				}
				var fasflie = $(this).parents('div[data-area="fascicle"]').find('input[name="bookFascicleName"]').attr('data-value');
				if (fasflie) {
					window.open(util.getServerBase() + 'common/downloadFile.action?path=' + encodeURIComponent(fasflie), '_blank');
				}
			});
			// 文件下载查看                                                                                        
			that.$container.on('click', 'button[data-down="download"]', function() {
				var fil = $(this).attr('data-address');
				if($(this).attr('data-address')) {
					window.open(util.getServerBase() + 'common/downloadFile.action?path=' + encodeURIComponent($(this).attr('data-address')), '_blank');
				}
			});
			// 文件预览
			this.$container.on('click','button[data-down="see"]', function() {
				that.onPresee($(this));	
			});
			this.$container.on('click','button[data-down="view"]', function() {
				that.onPreview($(this));
			});
		},

		/**
		 * 初始化页面数据
		 */
		initPageData: function() {
			this.searchBookForm();
			this.searchBookType();
			this.onPagination();
			this.onHandleChange();
			this.searchMinusButton();
			this.machNum();
		},
		
		/**
         * 设置表单数据
         * @param data
         */
        setData: function (data) {
        	info = data.info;
        	info.bookDetailOldPublicationDate = info.bookDetailOldPublicationDate.split(",");
        	info.bookDetailOldEdition = info.bookDetailOldEdition.split(",");
        	info.bookDetailOldRevision = info.bookDetailOldRevision.split(",");
            this._super(data);
            
        },
		

		/**
		 * 构造函数
		 * @param container
		 * @param tpl
		 */
		init: function(container, tpl) {
			this._super(container, tpl);
		},

		/**
		 * 渲染页面
		 */
		render: function() {
			this._super();

			this.initPageEvent();

			this.initPageData();
		}

	});

	module.exports = Item;

});