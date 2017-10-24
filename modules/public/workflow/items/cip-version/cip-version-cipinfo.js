define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');
    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({

        // 保存/提交接口
        saveAction: 'cipEditionApply/doSaveOrSubmitIssued.action',

        // 查询接口
        detailAction: 'cipEditionApply/doVersionIssued.action',

        getFormData:function () {
            var $form = this.$('#formCioIssuedEdit');
            // 先调用父类生成基本的数据结构
     	    var params = {};
            // var params = this._super();
            var CipApplyList=[];
            this.$('#selectIssuedTable tr').each(function () {
                var $el=$(this);
                var cipList = {};
                cipList.bookId=$el.attr('data-id');
                cipList.taskId=$el.attr('data-taskId');
                cipList.bookFileId=$el.attr('data-bookFileId');
                cipList.bookCipSynopsis=$el.find('.cipCode').attr('data-value');
                cipList.processInstanceId=$el.attr('data-processInstanceId');
                cipList.bookTypeCode=$el.attr('data-bookTypeCode');
                CipApplyList.push(cipList);
            });
            params.bookNameList=CipApplyList;
            params.nextFlowInfoList = [];
            var $flow;
            $form.find('div[data-area="nextFlow"]').each(function() {
                $flow = $(this);
                if($(this).is(':hidden')) {
                    return;
                } else {
                    params.nextFlowInfoList.push({
                        flowId: $flow.find('input[name="flowId"]').val(),
                        flowName: $flow.find('input[name="flowName"]').val(),
                        nextCategory: $flow.find('input[name="nextCategory"]').val(),
                        deptIds: $flow.find('input[name="deptIds"]').val(),
                        roleIds: $flow.find('input[name="roleIds"]').val(),
                        taskId: $flow.find('input[name="taskId"]').val(),
                        taskUsers: $flow.find('input[name="taskUsers"]').attr('data-value')
                    });
                }
            });
            return params;
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;

            that.$container.on('click','button.btn-address',function () {
                if($(this).attr('data-id')){
                    window.open(util.getServerBase() + 'cipApply/downloadCipInfo.action?bookId=' + encodeURIComponent($(this).attr('data-id')), '_blank');
                }
            });

            that.$container.on('click','button.btn-download',function () {
                if($(this).attr('data-download')){
                    window.open(util.getServerBase() + 'common/downloadFile.action?path=' + encodeURIComponent($(this).attr('data-download')), '_blank');
                }
            });

            that.$container.on('click','button.btn-import',function () {
                var allInfo={};
                allInfo.type="*.txt";
                allInfo.isbncipApplyId=$('input[name="isbncipApplyId"]').val();
                allInfo.urlDate='cipEditionApply/uploadBatchTXTFile.action'
                util.openPage('public/workflow/items/cip-version/file-uploadAll', allInfo);
            });
            that.$container.on('click','button.btn-imports',function () {
                var $parent=$(this).parents('tr');
                var oneInfo={};
                oneInfo.type="*.txt";
                oneInfo.ids=$parent.attr('data-id');
                oneInfo.urlDate='cipEditionApply/uploadTXTFile.action';
                util.openPage('public/workflow/items/cip-version/file-uploadAll', oneInfo);
            });

        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {

        },

        /**
         * 构造函数
         * @param container
         * @param tpl
         */
        init: function (container, tpl) {
            this._super(container, tpl);
            this.checkId='';
        },
        /**
         * 渲染页面
         */
        render: function () {
            this._super();

            this.initPageEvent();

            this.initPageData();
        },
        back:function (data) {
        //    将获取到的数据与原表格进行匹配
            if(data && data.length > 0){
                for(var i=0;i<data.length;i++){
                    // 与table的tr相匹配
                    this.$('#selectIssuedTable tr').each(function () {
                        var $el=$(this);
                        var $input=$el.find('.cipCode');
                        if( typeof data[i].bookId !== 'undefined' && data[i].bookId===$el.attr('data-id')){
                            $input.val(data[i].bookCipSynopsis);
                            $input.attr('data-value',data[i].bookCipSynopsis);
                            $input.attr('title',data[i].bookCipSynopsis);
                            $input.change();
                        }
                    });
                }
            }
        }
    });

    module.exports = Item;

});

