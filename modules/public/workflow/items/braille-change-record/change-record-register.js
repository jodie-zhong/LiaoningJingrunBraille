define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');
    var info = [];
    var cip = '';

    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'changeRecord/saveOrUpdateChangeRecord.action',
        // 查询接口
        detailAction: 'changeRecord/searchChangeRecordDetail.action',

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
            // cip信息上传
            that.$container.on('click','button[data-name="bookCipSynopsis"]',function () {
                var oneInfo={};
                oneInfo.type="*.txt";
                oneInfo.ids=$(this).attr('data-bookId');
                oneInfo.urlDate='cipEditionApply/uploadTXTFile.action';
                util.openPage('public/file/cip-file-upload', oneInfo);
            });
            // cip信息下载
            that.$container.on('click','button[data-type="down"]',function () {
                if($(this).attr('data-bookId')){
                    window.open(util.getServerBase() + 'CNchangeRecord/downloadCipInfoChange.action?bookId=' + encodeURIComponent($(this).attr('data-bookId')), '_blank');
                }
            });
        },
        
        /**
		 * 保存或提交工作流
		 */
		getFormData: function() {
			var $form = this.$('#formEdit');
			// 先调用父类生成基本的数据结构
			var params = this._super();
			params.bookCipSynopsis = cip;
			return params;
		},

        /**
         * 初始化页面数据
         */
        initPageData: function () {

        },
        
        /**
         * 设置表单数据
         * @param data
         */
        setData: function (data) {
        	info = data.info;
        	cip = data.info.bookCipSynopsis;
            this._super(data);
            
        },

        /**
         * 构造函数
         * @param container
         * @param tpl
         */
        init: function (container, tpl) {
            this._super(container, tpl);

            this.initPageEvent();

            this.initPageData();
        },
        
        back: function (data) {
        	// 将获取到的数据与原表格进行匹配
        	if(data && data.length > 0){
        		for(var i=0;i<data.length;i++){
        			this.$('input[name="bookCipSynopsis"]').val(data[i].bookCipSynopsis);
        			this.$('input[name="bookCipSynopsis"]').attr('title',data[i].bookCipSynopsis);
        			this.$('button[data-type = "down"]').removeAttr('disabled');
        			this.$('input[name="bookCipSynopsis"]').change();
        			cip = data[i].bookCipSynopsis;
                }
            }
        }

    });


    module.exports = Item;

});
