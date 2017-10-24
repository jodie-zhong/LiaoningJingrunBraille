define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');
    /**
     * Workflow Item
     */
    module.exports = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'reprintAudit/saveOrSubmitReprintAudit.action',
        // 查询接口
        detailAction: 'reprintAudit/searchReprintAuditDetail.action',

        bookDateAdd:{},
        /**
         * 生成参数
         */
        getFormData: function () {
            var that=this;
            var params = {};
            var $form = that.$('#formEdit');
            // 没有错误开始处理
            if ( that.bookDateAdd.idReAd.length > 0 ) {
                    // 通过公共方法生成表单参数
                    params = {};
                    params.flowId = $form.find('input[name="flowId"]').val();
                    params.flowName = $form.find('input[name="flowName"]').val();
                    params.nextCategory = $form.find('input[name="nextCategory"]').val();
                    params.currentFlowId = 'rpt_addReprint';
                    params.deptIds = $form.find('input[name="deptIds"]').val();
                    params.roleIds = $form.find('input[name="roleIds"]').val();
                    params.taskUsers = $form.find('input[name="taskUsers"]').attr('data-value');
                    params.reprintBookAuditName = $form.find('input[name="reprintBookAuditName"]').val();
                    // params.reprintBookAuditId=currentApply.info;
                    // params.taskId=currentApply.taskId;
                    params.bookIdList = that.bookDateAdd.idReAd;
                    return params;
            }else {
                util.showAlert('请选择至少一本书再保存或提交');
            }
        },

        // 重新生成序号和名字
        onWorkLoadNum :function () {
            var i = 1;
            this.$('#selectBookTable tr').each(function () {
                $(this).find('td[data-value="number"]').text(i++);
            });
        },
        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that=this;
            //图书添加
            this.$container.on('click', '#addBook', function () {
                util.openPage('braille/reprint-audit/reprint-audit-select', that.bookDateAdd);
            });
            that.$container.on('click', 'button.book-delete', function () {
                var $parent = $(this).parents('tr');
                var id = $parent.attr('data-id');
                var ids =that.bookDateAdd.idReAd;
                var bookNames = that.bookDateAdd.nameReAd;
                var bookLeads = that.bookDateAdd.leadReAd;
                var bookReads = that.bookDateAdd.readReAd;
                var index = $.inArray(id, ids);
                if (index >= 0) {
                    ids.splice(index, 1);
                    bookNames.splice(index, 1);
                    bookLeads.splice(index, 1);
                    bookReads.splice(index, 1);
                }
                // 重新渲染tobdy
                $parent.remove();
                that.onWorkLoadNum();
                // 重新生成bookDateAdd
                that.bookDateAdd = {
                    idReAd: ids,
                    nameReAd: bookNames,
                    leadReAd: bookLeads,
                    readReAd: bookReads
                };
            });
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
            var that=this;
            if(that.data.info.reprintBookInfoList.length > 0){
                that.bookDateAdd.idReAd=[];
                that.bookDateAdd.nameReAd=[];
                that.bookDateAdd.leadReAd=[];
                that.bookDateAdd.readReAd=[];
                for(var i=0;i<that.data.info.reprintBookInfoList.length;i++){
                    that.bookDateAdd.idReAd.push(that.data.info.reprintBookInfoList[i].bookId);
                    that.bookDateAdd.nameReAd.push(that.data.info.reprintBookInfoList[i].bookName);
                    that.bookDateAdd.leadReAd.push(that.data.info.reprintBookInfoList[i].libraryNeedNum);
                    that.bookDateAdd.readReAd.push(that.data.info.reprintBookInfoList[i].readersServiceNeedNum);
                }
            }
            console.log(that.bookDateAdd);
            this.initValidate(this.$('#formEdit'));
        },

        /**
         * 构造函数
         * @param container
         * @param tpl
         */
        init: function (container, tpl) {
            this._super(container, tpl);
            this.bookDateAdd = {};
        },
        back:function (data) {
            var that=this;
            if (data.book && data.idReAd) {
                that.bookDateAdd = data;
                var length = $('#selectBookTable tr').length;
                var ids = [], names = [], leads = [], reads = [];
                if (data.idReAd) {
                    ids = data.idReAd;
                    names = data.nameReAd;
                    leads = data.leadReAd;
                    reads = data.readReAd;
                }
                //将数据添加到已有的table表格数据后
                var $tbody = $("#selectBookTable");
                for (var i = 0; i < ids.length; i++) {
                    var bookTr = $('<tr data-id="'+ids[i] +'"><td data-value="number">' + (i + 1 + length) + '</td><td>' + names[i] + '</td><td>' + reads[i]  + '</td><td>' + leads[i] + '</td><td><button data-id="' + ids[i] + '" data-lead="' + leads[i] + '" data-name="' + names[i] + '" data-read="' + reads[i] + '" class="btn btn-xs btn-danger btn-rounded book-delete">删除</button></td></tr>');
                    $tbody.append(bookTr);
                }
                // 获取渲染后的所有tr上的id与name，将bookDateAdd替换
                var newId = [], newName = [], newLead = [], newRead = [];
                $("#selectBookTable tr").each(function () {
                    var $el1 = $(this);
                    newId.push($el1.find('button').attr('data-id'));
                    newName.push($el1.find('button').attr('data-name'));
                    newLead.push($el1.find('button').attr('data-lead'));
                    newRead.push($el1.find('button').attr('data-read'));
                });
                that.bookDateAdd = {
                    idReAd: newId,
                    nameReAd: newName,
                    leadReAd: newLead,
                    readReAd: newRead,
                };
                that.initValidate(that.$('#formEdit'));
            }
        },
        /**
         * 渲染页面
         */
        render: function () {
            this._super();
            this.initPageEvent();
            this.initPageData();
        }
    });
});