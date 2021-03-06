define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');

    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'cnCoverAndCopyright/saveOrSubmitCnCoverAndCopyright.action',
        // 查询接口
        detailAction: 'cnCoverAndCopyright/searchCnCoverAndCopyrightDetail.action',

        getFormData:function () {
            var $form = this.$('#formEdit');
            var params = this._super();
            // var params={};
            // 处理上传部份数据结构
            var arr=[];
            $form.find('div[data-area="resultMap"]').each(function(){
                var $e=$(this);
                var inArr=[];
                var obj={};
                $e.find('tr[data-type="ebook"]').each(function () {
                    var $el=$(this);
                    var inObj={};
                    if($el.attr('data-bookFascicleId')===" "){
                        inObj.bookFascicleId= null;
                    }
                    inObj.hBookFileName=$el.find('input.bookAddress').val();
                    inObj.hBookFileAddress=$el.find('input.bookAddress').attr('data-value');
                    inArr.push(inObj);
                });
                obj.hBookCoverSchemeName=$e.find('input[name="hBookCoverSchemeName"]').val();
                obj.mwBookFascicleList=inArr;
                arr.push(obj);
            });
            params.mwHBookCoverSchemeList=arr;
            // 发行初审
            $form.find('div[data-flow="cn_coverFirst"]').each(function () {
                var $el=$(this);
                params.parallelFlowId=$el.find('input[name="flowId"]').val();
                params.parallelFlowName=$el.find('input[name="flowName"]').val();
                params.parallelDeptIds=$el.find('input[name="deptIds"]').val();
                params.parallelRoleIds=$el.find('input[name="roleIds"]').val();
                params.parallelTaskUsers=$el.find('input[name="taskUsers"]').attr('data-value');
            });
            // 责编初审
            $form.find('div[data-flow="cn_coverEditorFirst"]').each(function () {
                var $el=$(this);
                params.flowId=$el.find('input[name="flowId"]').val();
                params.flowName=$el.find('input[name="flowName"]').val();
                params.deptIds=$el.find('input[name="deptIds"]').val();
                params.roleIds=$el.find('input[name="roleIds"]').val();
                params.taskUsers=$el.find('input[name="taskUsers"]').attr('data-value');
                params.nextCategory=$el.find('input[name="nextCategory"]').val();
            });
            return params;
        },

        // 添加工作量
        onDesignContentPlus: function($dwp) {
            var workRow = this.$('#workDesignTemplate').html();
            $dwp.parents('#formEdit .fascicle').last().after(workRow);// 把workRow放到.$(par)之后
            this.searchButtonNum();
            this.addValidateField(this.$('input[name="hBookCoverSchemeName"]'));
        },
        // 工作量删除
        onDesignContentMinus: function($dwp) {
            $dwp.parents('div[data-area="resultMap"]').remove();
            this.searchButtonNum();
        },

        /**
         * 添加与删除按钮显示函数
         */
        searchButtonNum: function() {
            var dayLength = this.$('#formEdit div[data-area="resultMap"]').length;
            if(dayLength !== 1) {
                this.$('button[data-type="day-minus"]').show();
                this.$('button[data-type="day-plus"]').hide();
                this.$('button[data-type="day-plus"]').last().show();
            } else {
                this.$('button[data-type="day-minus"]').hide();
                this.$('button[data-type="day-plus"]').show();
            }
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
            this.$container.on('click','.btn-design',function () {
                that.designButton = $(this);
                var $parent=$(this).parents('tr');
                var $btn=$parent.find('.btn-download');
                var $preview=$parent.find('.btn-preview');
                window.designerCallback = function(resp){
                    if(resp.code=== 0 ){
                        $btn.removeAttr('disabled');
                        $preview.removeAttr('disabled');
                        $parent.find('.btn-download').attr('data-address',resp.data.address);
                        $parent.find('.btn-preview').attr('data-preview',resp.data.address);
                        $parent.find('.bookAddress').val(resp.data.name);
                        $parent.find('.bookAddress').attr('data-value',resp.data.address);
                    }
                };
                window.open('designer/designer.html' , '_blank');
            });
            this.$container.on('change','input.bookAddress',function () {
                var $el=$(this);
                var $parent=$el.parents('tr');
                var $btn=$parent.find('.btn-download');
                var $preview=$parent.find('.btn-preview');
                var ads=$el.attr('data-value');
                $parent.find('.btn-download').attr('data-address',ads);
                $parent.find('.btn-preview').attr('data-preview',ads);
                if($el.val()===''){
                    $btn.attr('disabled','disabled');
                    $preview.attr('disabled','disabled');
                }else {
                    $btn.removeAttr('disabled');
                    $preview.removeAttr('disabled');
                }

            });
            // 添加工作量
            this.$container.on('click', 'button[data-type="day-plus"]', function() {
                that.onDesignContentPlus($(this));

            });

            // 删除工作量
            this.$container.on('click', 'button[data-type="day-minus"]', function() {
                that.onDesignContentMinus($(this));
            });
            this.$container.on('click','.btn-download',function () {
                var $el=$(this);
                if($el.attr('data-address')){
                    window.open(util.getServerBase() + 'common/downloadFile.action?path=' + encodeURIComponent($el.attr('data-address')), '_blank');
                }
            });
            this.$container.on('click','.downBisn',function () {
                var $el=$(this);
                if($el.attr('data-address')){
                    window.open(util.getServerBase() + 'common/downloadFile.action?path=' + encodeURIComponent($el.attr('data-address')), '_blank');
                }
            });
            this.$container.on('click','.btn-preview',function () {
                var $el=$(this);
                // 在此区分是不是.png格式的文件，是.png直接放到ifram里，不用向后台发请求，转成html的
                var $preview=$el.attr('data-preview');
                if($preview.slice(-4)==='.png' || $preview.slice(-4)==='.jpg' || $preview.slice(-5)==='.jpeg'){
                    // 预览
                    util.openPage('public/preview/html-preview', {
                        url: util.getServerBase() + $el.attr('data-preview')
                    });
                } else {
                    util.showLoading();
                    util.sendRequest({
                        data: {filePath:$el.attr('data-preview')},
                        action: 'common/coverPreview.action',
                        success: function(resp) {
                            util.hideLoading();
                            if(resp.code === 0) {
                                // 预览
                                util.openPage('public/preview/html-preview', {
                                    url: util.getServerBase() + resp.data
                                });
                            } else {
                                console.log(resp);
                                util.showAlert(resp.message || '预览出错，请稍后重试！');
                            }
                        },
                        error: function(xhr) {
                            // XHR错误
                            util.hideLoading();
                            util.showAlert('预览出错，请稍后重试！');
                        }
                    });
                }
            });
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
            var that=this;
            this.searchButtonNum();
            var $input=this.$('div[data-flow="cn_coverFirst"]').find('input[type="text"]');
            if(this.data.info.parallelTaskUsersName){
                $input.val(this.data.info.parallelTaskUsersName);
            }
            if(this.data.info.parallelTaskUsers){
                $input.attr('data-value',this.data.info.parallelTaskUsers);
            }
        //   针对添加书名
            if(this.data.info.fascicleList.length > 0){
                this.$('#formEdit tbody').each(function () {
                    var $el=$(this);
                    for(var i=0;i< that.data.info.fascicleList.length;i++){
                        $el.find('tr').eq(i).find('td').eq(1).text(that.data.info.fascicleList[i].bookFascicleBookName);
                    }
                });
            }
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

            this.initPageEvent();

            this.initPageData();
        }

    });


    module.exports = Item;

});

