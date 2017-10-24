define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');

    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'cover/saveOrSubmitCover.action',

        // 查询接口
        detailAction: 'cover/searchCoverDetail.action',

        getFormData:function () {
            var $form = this.$('#formEdit');
            // 先调用父类生成基本的数据结构
//      	var params = {};
            var params = this._super();
            // 处理上传部份数据结构
            var arr=[];
            $form.find('tr[data-type="ebook"]').each(function(){
                var $el=$(this);
                var obj={};
                obj.bookFileId=$el.attr('data-bookFileId');
                obj.bookFileName=$el.find('input.bookAddress').val();
                obj.bookFileAddress=$el.find('input.bookAddress').attr('data-value');
                obj.bookFascicleId=$el.attr('data-bookFascicleId');
                obj.bookFascicleBookName=$el.find('.bookFileName').html();
                obj.bookFileType=$el.attr('data-bookFileType');
                obj.createDatetime=$el.find('.createDatetime').html();
                obj.createUserId=$el.attr('data-createUserId');
                arr.push(obj);
            });
            params.coverInfoEntities=arr;
            return params;
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
                        var userId = util.getUserInfo().userId;
                        var userName =util.getUserInfo().userName;
                        var createTime=new Date();
                        var timeStr=createTime.getFullYear()+'-'+(parseInt(createTime.getMonth())+1)+'-'+createTime.getDate()+' '+createTime.getHours()+':'+createTime.getMinutes()+':'+createTime.getSeconds()
                        $btn.removeAttr('disabled');
                        $preview.removeAttr('disabled');
                        $parent.find('.btn-download').attr('data-address',resp.data.address);
                        $parent.find('.btn-preview').attr('data-preview',resp.data.address);
                        $parent.find('.bookFileName').text(resp.data.name);
                        $parent.find('.bookFileName').attr('title',resp.data.name);
                        $parent.find('.bookAddress').val(resp.data.name);
                        $parent.find('.bookAddress').attr('data-value',resp.data.address);
                        $parent.find('.createDatetime').text(timeStr);
                        $parent.find('.createDatetime').attr('title',timeStr);
                        $parent.find('.createUserName').text(userName);
                        $parent.find('.createUserName').attr('title',userName);
                        $parent.attr('data-createUserId',userId);
                    }
                };
                window.open('designer/designer.html' , '_blank');
            });

            this.$container.on('change','input.bookAddress',function () {
                // 获取上传人信息（登录人信息）
                var userId = util.getUserInfo().userId;
                var userName =util.getUserInfo().userName;
                var createTime=new Date();
                var timeStr=createTime.getFullYear()+'-'+(parseInt(createTime.getMonth())+1)+'-'+createTime.getDate()+' '+createTime.getHours()+':'+createTime.getMinutes()+':'+createTime.getSeconds()
                var $el=$(this);
                var $parent=$el.parents('tr');
                var $btn=$parent.find('.btn-download');
                var $preview=$parent.find('.btn-preview');
                var ads=$el.attr('data-value');
                var adsName=$el.val();
                $parent.find('.bookFileName').text(adsName);
                $parent.find('.bookFileName').attr('title',adsName);
                $parent.find('.btn-download').attr('data-address',ads);
                $parent.find('.btn-preview').attr('data-preview',ads);
                $parent.find('.createDatetime').text(timeStr);
                $parent.find('.createDatetime').attr('title',timeStr);
                $parent.find('.createUserName').text(userName);
                $parent.find('.createUserName').attr('title',userName);
                $parent.attr('data-createUserId',userId);
                if($el.val()===''){
                    $btn.attr('disabled','disabled');
                    $preview.attr('disabled','disabled');
                    $parent.find('.createDatetime').text('');
                    $parent.find('.createDatetime').attr('title','');
                    $parent.find('.createUserName').text('');
                    $parent.find('.createUserName').attr('title','');
                    $parent.attr('data-createUserId','');
                }else {
                    $btn.removeAttr('disabled');
                    $preview.removeAttr('disabled');

                }
            });
            this.$container.on('click','.btn-download',function () {
                var $el=$(this);
                if($el.attr('data-address')){
                    var str=$el.parents('tr').find('.bookFileName').text();
                    if(str.indexOf('.') > 0){ //表明含有格式后缀
                        str=str.split('.')[0];
                    }
                    window.open(util.getServerBase() + 'common/downloadFile.action?path=' + encodeURIComponent($el.attr('data-address')) + '&bookFileName=' + encodeURIComponent(str), '_blank');
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
            this.$container.on('click','#downCip',function () {
                var $el=$(this);
                if($el.attr('data-id')){
                    window.open(util.getServerBase() + 'cover/downloadCip.action?bookId=' + encodeURIComponent($el.attr('data-id')), '_blank');
                }
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

