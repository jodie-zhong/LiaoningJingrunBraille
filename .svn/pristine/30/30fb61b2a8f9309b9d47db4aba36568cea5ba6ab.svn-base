define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');
    var that;

    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'cnCoverAndCopyright/saveOrSubmitCnCoverAndCopyright.action',
        // 查询接口
        detailAction: 'cnCoverAndCopyright/searchCnCoverAndCopyrightDetail.action',

        getFormData: function () {
            var $form = this.$('#formEdit');
            // 先调用父类生成基本的数据结构
            var params = {};
            var mwHBookCoverEntity = this._super();
            // 处理风格定位和其他相关设计
            var arroTherList=[],arrStyleList=[];
            this.$('#styleList input:checked').each(function(){
                var checkedId=$(this).attr('data-id');
                arroTherList.push(checkedId);
            });

            this.$('#otherList input:checked').each(function(){
                var checkedId=$(this).attr('data-id');
                arrStyleList.push(checkedId);
            });
            var style=arroTherList.join(',');
            mwHBookCoverEntity.styleLocalization=style;
            var other=arrStyleList.join(',');
            mwHBookCoverEntity.otherDesign=other;
            params.mwHBookCoverEntity=mwHBookCoverEntity;
            if(params.mwHBookCoverEntity.flowId){
                params.flowId=params.mwHBookCoverEntity.flowId;
            }
            if(params.mwHBookCoverEntity.flowName){
                params.flowName=params.mwHBookCoverEntity.flowName;
            }
            if(params.mwHBookCoverEntity.roleIds){
                params.roleIds=params.mwHBookCoverEntity.roleIds;
            }
            if(params.mwHBookCoverEntity.taskUsers){
                params.taskUsers=params.mwHBookCoverEntity.taskUsers;
            }
            return params;
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
            var that=this
            // 风格定位和其他相关设计选中处理
            if( this.data.info.mwHBookCoverEntity && this.data.info.mwHBookCoverEntity.styleLocalization ){
                var arroTherList=this.data.info.mwHBookCoverEntity.styleLocalization.split(',');
                for(var i=0;i<arroTherList.length;i++){
                    // 编辑用
                    that.$('#styleList').find('input').each(function(){
                        if(arroTherList[i]===$(this).attr('data-id')){
                            $(this).prop('checked','true');
                        }
                    });
                    // 查看用
                    that.$('#styleListBot').find('input').each(function(){
                        if(arroTherList[i]===$(this).attr('data-id')){
                            $(this).prop('checked','true');
                            $(this).attr('disabled');
                        }
                    });
                }

            }
            if( this.data.info.mwHBookCoverEntity && this.data.info.mwHBookCoverEntity.otherDesign ){
                var arrStyleList=this.data.info.mwHBookCoverEntity.otherDesign.split(',');
                for(var i=0;i<arrStyleList.length;i++){
                    that.$('#otherList input').each(function(){
                        if(arrStyleList[i]===$(this).attr('data-id')){
                            $(this).prop('checked','true');
                        }
                    });
                    that.$('#otherListBot input').each(function(){
                        if(arrStyleList[i]===$(this).attr('data-id')){
                            $(this).prop('checked','true');
                            $(this).attr('disabled');
                        }
                    });
                }
            }
            // 初始化日期组件
            this.$('input.date-time').datetimepicker({
                format: 'YYYY-MM',
                locale: 'zh-cn',
                sideBySide: true
            });
        },

        /**
         * 构造函数
         * @param container
         * @param tpl
         */
        init: function (container, tpl) {
            this._super(container, tpl);
        },

        /**
         * 渲染页面
         */
        render: function () {
            this._super();

            that = this;

            this.initPageEvent();

            this.initPageData();
        }
    });


    module.exports = Item;

});
