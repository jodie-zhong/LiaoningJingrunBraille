define(function(require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    // 工作流类窗口继承自工作流Base
    var Base = require('../../other/base/book-base');
    var tplBookList = require('./fourth-list.tpl');
    var tplBookRightList = require('./fourth-list-right.tpl');
    var flowListTpl = require('./base-flowlist.tpl');

    var ADD='1';                                    // 未提交
    var SUBMIT='2';                                 // 已提交
    var SINGLE='3' ;                                // 已审核
    var TYPE='3';                                   // 类型
    var Module = Base.extend(new function () {
        var that;
        var firstId=null;


        this.deployKey = 'BrailleEditingProofreading';

        // 与我相关
        // this.searchTaskAbout = '1';

        // 其他搜索选项
        this.searchParams = {

        };

        this.flowInfoAction='common/searchBookFlowList.action';

        /**
         * 搜索任务列表的接口(覆盖父级)
         */
        this.taskListAction= 'readProofread/searchReadProofreadAllList.action';
        /**
         * 搜索任务流程列表接口
         */
        this.taskFlowListAction= 'editing/searchStatisticsTaskList.action';

        this.treeName='统计';

        /**
         * 检索图书列表(自己单独写右侧)
         */
        this.rightList=function () {
            var params={
                statisticsType:TYPE,
                searchYear:that.currentYear,
                searchMonth:that.currentMonth
            }
            util.sendRequest({
                data: params,
                action: 'dispatches/searchBookOneKindNum.action',
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        // 任务列表
                        this.$('#workListTBodyRight').html(util.template(tplBookRightList, {list: resp.data}));
                    } else {
                        console.log(resp);
                        util.showAlert(resp.message || '查询出错，请稍后重试！');
                    }
                }.bind(this),
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('查询出错，请稍后重试！');
                }.bind(this)
            });
        };

        /**
         * 查询任务列表
         */
        this.searchTaskFlowList=function () {
            var $row = this.$('#workListTBody tr.info');
            if ($row.length > 0) {
                var bookEditTprStatisticsId = $row.attr('data-bookId');
                var bookId=$row.attr('data-bookIdOnly');
                var params = {};
                params.bookEditTprStatisticsId= bookEditTprStatisticsId;
                params.statisticsType= TYPE;
                params.searchYear=that.currentYear;
                params.bookId=bookId;
                // 选择了一条
                util.showLoading();
                util.sendRequest({
                    data: params,
                    action: this.taskFlowListAction,
                    success: function (resp) {
                        util.hideLoading();
                        if (resp.code === 0) {
                            // 任务列表
                            this.$('#taskWorkflowTable').html(util.template(flowListTpl, {list: resp.data}));
                        } else {
                            console.log(resp);
                            util.showAlert(resp.message || '查询流程列表出错，请稍后重试！');
                        }
                    }.bind(this),
                    error: function (xhr) {
                        // XHR错误
                        util.hideLoading();
                        console.log(xhr);
                        util.showAlert('查询流程列表出错，请稍后重试！');
                    }.bind(this)
                });
            } else {
                // 选择了多条或者没选择，清空流程列表
                this.$('#taskWorkflowTable').empty();
            }

        };

        this.searchBookDetail=function () {
            this.searchTaskFlowList();
        };
        /**
         * 检索图书列表(自己单独写左侧)
         */

        this.searchTaskList= function () {
            // 做一些清理工作
            // 清空流程列表
            this.$('#taskWorkflowTable').html(util.template(flowListTpl, {list: []}));
            // 恢复全选状态
            this.$('#workListTable thead i[data-action="check"]').removeClass('fa-check-square-o').addClass('fa-square-o');
            // 清理详情
            // this.$('#bookDetailPanel').html('<p class="c-gray">（请选择图书后查看详情）</p>');
            // 生成搜索参数
            var params = {};
            // 年月
            params.searchYear = this.currentYear;
            params.searchMonth = this.currentMonth;
            // 用js控制月的显示
            if(this.currentMonth){
                that.$('.number-species').html('');// 清空
                var html='品种数量'+ '('+this.currentMonth+'月' +')';
                that.$('.number-species').html(html);
                that.$('.number-species').attr('title',html);
            }else{
                that.$('.number-species').html('品种数量');
                that.$('.number-species').attr('title','品种数量');
            }
            // 页码
            params.page = this.currentPage;
            // 将树上的搜索条件复制过来
            params = $.extend(params, this.commonSearchParams, this.searchParams, this.staticParams);
            // 任务类型
            params.searchBookType = this.deployKey;
            // 与我相关
            params.searchTaskAbout = this.searchTaskAbout;
            // 搜索任务列表
            util.showLoading();
            util.sendRequest({
                data: params,
                action: this.taskListAction,
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        // 任务列表
                        this.$('#workListTBody').html(util.template(this.baseTpl, {list: resp.data.records}));
                        that.$('#btnAdd').attr('disabled', 'disabled');        // 添加
                        that.$('#btnDel').attr('disabled', 'disabled');        // 删除
                        that.$('#btnSubmit').attr('disabled', 'disabled');     // 提交
                        that.$('#btnSingle').attr('disabled', 'disabled');     // 审核

                        // 分页数据
                        this.$('#workListPaging').html(this.buildPagination(resp.data.pageNow, resp.data.pageCount));
                        // 右侧列表
                        this.rightList();

                        // 回调函数
                        this.onSelectRowChanged();
                        this.onCheckRowChanged();
                        if (this.currentYear && this.currentMonth ){
                            this.setState();
                        }
                    } else {
                        console.log(resp);
                        util.showAlert(resp.message || '查询图书列表出错，请稍后重试！');
                    }
                }.bind(this),
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('查询图书列表出错，请稍后重试！');
                }.bind(this)
            });
        };
        this.setState=function () {
            // 默认获取第一行的数据，前提是年和月都选中
            if(that.$('#workListTBody tr').attr('data-noselect')){
                // 没有数据则添加亮
                that.$('#btnAdd').removeAttr('disabled');              // 添加
                that.$('#btnDel').attr('disabled', 'disabled');        // 删除
                that.$('#btnSubmit').attr('disabled', 'disabled');     // 提交
                that.$('#btnSingle').attr('disabled', 'disabled');     // 审核
            }else {
                // 有数据则根据第一行数据的状态进行按钮处理
                var state=null,users = null;
                var add = true,submit=true,single=true,allMe = true, allUnfinished = true;

                firstId=that.$('#workListTBody tr').attr('data-bookId');
                state = that.$('#workListTBody tr').attr('data-state');
                users = that.$('#workListTBody tr').attr('data-users') || '';
                users = users? users.split(','): [];

                // 包含非未提交申请
                if(state !== ADD ){
                    add=false;
                }
                // 包含非审核
                if(state !==SUBMIT ){
                    submit=false;
                }
                // 包含非版署申请
                if(state !== SINGLE){
                    single=false;
                }

                // 任务状态未完成
                if($(that).attr('data-taskState') === '2'){
                    allUnfinished = false;
                }


                // 处理（对应该模块所有的state状态）可用
                if( add && allUnfinished ){
                    that.$('#btnAdd').removeAttr('disabled');
                    that.$('#btnSubmit').removeAttr('disabled');
                }

                if(submit && allUnfinished ){
                    that.$('#btnSingle').removeAttr('disabled');
                }

                if(single){
                    that.$('#btnAdd').attr('disabled', 'disabled');
                    that.$('#btnDel').attr('disabled', 'disabled');
                    that.$('#btnSubmit').attr('disabled', 'disabled');
                    that.$('#btnSingle').attr('disabled', 'disabled');
                }
            }
        };

        this.onCheckRowChanged = function (){
            that.$('#btnDel').attr('disabled','disabled');
            var count = 0, state=null,bookIds = [],names=[];
            var addDel = true,allMe = true, allUnfinished = true;
            that.$('#workListTBody').find('tr[checked]').each(function () {
                state=$(this).attr('data-state');
                // 包含非未提交申请
                if(state !== ADD ){
                    addDel=false;
                }
                bookIds.push($(this).attr('data-bookIdOnly'));
                names.push($(this).attr('data-name'));
                count++;
            });

            this.currentBookId = bookIds.join(',');
            this.currentNames = names.join(',');
            if(count > 0 && addDel){
                that.$('#btnDel').removeAttr('disabled');
            }
        }

        /**
         * 初始化页面事件
         */
        function initPageEvent() {

            // 任务详情
            that.$container.on('click', 'button.detail-btn', function () {
                var $row = that.$('#workListTBody tr.info');
                if ($row.length > 0) {
                    var bookEditId = $row.attr('data-bookId');
                    var bookId=$row.attr('data-bookIdOnly');
                }
                var data = {
                    taskId: $(this).attr('data-taskId'),
                    statisticsType:TYPE,
                    searchYear:that.currentYear,
                    bookEditTprStatisticsId:bookEditId,
                    bookId:bookId
                };
                that.openPage('braille/braille-statistical/flow-detail', data);
            });

            that.$container.on('click', '#btnAdd', function () {
                var info={
                    statisticsType:TYPE,
                    createYear:that.currentYear,
                    createMonth:that.currentMonth
                }
                that.openPage('braille/braille-statistical/statistical-add', info);
            });

            // 提交
            that.$container.on('click', '#btnSubmit', function () {
                var infoSingle={
                    bookEditTprStatisticsId:firstId,
                    createYear:that.currentYear,
                    createMonth:that.currentMonth
                }
                that.openPage('braille/braille-statistical/statistical-single', infoSingle);
            });

            // 审核
            that.$container.on('click', '#btnSingle', function () {
                var infoSubmit={};
                if(firstId){
                    var params={
                        bookEditTprStatisticsId:firstId
                    };
                    // 下发请求
                    util.showLoading();
                    util.sendRequest({
                        data: params,
                        action: 'editing/doExamine.action',
                        success: function (resp) {
                            util.hideLoading();
                            if (resp.code === 0) {
                                infoSubmit.infoData=resp.data;
                                infoSubmit.bookEditTprStatisticsId=firstId;
                                that.openPage('braille/braille-statistical/statistical-submit', infoSubmit);
                            } else {
                                // 业务执行失败
                                console.log(resp);
                                util.showAlert(resp.message || '列表出错，请稍后重试！');
                            }
                        },
                        error: function (xhr) {
                            // XHR错误
                            util.hideLoading();
                            console.log(xhr);
                            util.showAlert('列表出错，请稍后重试！');
                        }
                    });

                }
            });

            that.$container.on('click', '#btnDel', function () {
                util.showConfirm('确定要将 “' +  that.currentNames  + '” 删除吗？', function () {
                    var params={
                        bookIds:that.currentBookId,
                        searchYear:that.currentYear,
                        searchMonth:that.currentMonth,
                        statisticsType:TYPE
                    };
                    util.showLoading();
                    util.sendRequest({
                        data: params,
                        action: 'editing/removeBookOfStatistics.action',
                        success: function(resp) {
                            util.hideLoading();
                            if (resp.code === 0) {
                                util.showAlert('删除成功',function () {
                                    that.searchTaskList();
                                });
                            } else{
                                util.showAlert(resp.message || '删除出错，请稍后重试！');
                            }
                        },
                        error: function(xhr) {
                            // XHR错误
                            util.hideLoading();
                            console.log(xhr);
                            util.showAlert('删除出错，请稍后重试！');
                        }
                    });
                });
            });
        }

        /**
         * 初始化页面数据
         */
        function initPageData() {

        }

        /**
         * 初始化时被调用
         */
        this.onInit = function($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);
            that = this;
            // that.initTemplate(tpl, {});

            // 初始化数据前需要设置列表模板
            this.baseTpl = tplBookList;

            // 初始化页面事件
            initPageEvent();

            // 初始化页面数据
            initPageData();

            // TODO: 测试
            // that.openPage('public/workflow/workflow-dialog', {});
            // that.openPage('public/file/file-upload', {});
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