define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var Base = require('../../../common/base-page');
    var listTpl = require('./book-base-bookList.tpl');
    var flowListTpl = require('./book-base-flowlist.tpl');
    var detailTpl = require('./book-base-detail.tpl');
    require('../../../assets/plugins/jstree/jstree.min');
    require('../../../assets/plugins/jstree/src/themes/default/style.min.css');
    require('../../../assets/plugins/icheck/icheck.min');
    require('../../../assets/plugins/icheck/skins/minimal/blue.css');

    var Module = Base.extend({
        /**
         * 年月列表公共接口（子类一般不需覆盖）
         * 该接口用于查询左侧年月列表树
         */
        yearMonthListAction: 'common/searchYearMonthList.action',

        /**
         * 未处理列表公共接口（子类一般不需覆盖）
         * 该接口用于查询左侧年月列表树上展示的未处理任务树
         */
        unreadCountAction: 'common/searchUnreadCount.action',

        /**
         * 搜索任务列表的接口
         */
        taskListAction: 'common/searchUnreadList.action',

        /**
         * 搜索任务流程列表接口
         */
        taskFlowListAction: 'common/searchTaskList.action',

        /**
         * 图书详情接口
         */
        bookDetailAction: 'common/searchBookDetail.action',

        /**
         * 公共的搜索参数
         * 该参数是左侧年月树上的搜索条件组成的，所有子类必须在select、input定义“data-search”属性用于传递公共参数
         */
        commonSearchParams: {},

        /**
         * 任务类型，如选题管理等
         */
        deployKey: '',

        searchFlowListId: 'searchBookId',

        searchFlowListKey: 'deploymentKey',
        /**
         * 列表模板，子类需要覆盖
         */
        baseTpl: '',

        /**
         * 左侧未读数量（如是封面设计需特殊传cover）
         */
        unreadSearchFlowId:'',

        /**
         * 当前页码
         */
        currentPage: 1,

        /**
         * 当前选择树节点的年月
         */
        currentMonth: '',
        currentYear: '',
        searchYearMonth: '',

        currentId: '',

        /**
         * 与我相关搜索选项
         */
        searchTaskAbout: '',

        /**
         * 其他搜索选项
         */
        searchParams: {},

        /**
         * 某些业务需要下发固定参数，可以配置在这里
         */
        staticParams: {},

        /**
         * 某些模块需要自己配左侧树的名字
         */
        treeName: '',

        /**
         * 查询图书详情信息
         */
        searchBookDetail: function () {
            var $row = this.$('#workListTBody tr.info');
            if ($row.length > 0) {
                var params = {
                    bookId: $row.attr('data-bookId')
                };
                // 选择了一条
                util.showLoading();
                util.sendRequest({
                    data: params,
                    action: this.bookDetailAction,
                    success: function (resp) {
                        util.hideLoading();
                        if (resp.code === 0) {
                            // 任务列表
                            if(resp.data.bookCoverPath){
                                resp.data.bookCoverPath=util.getResourceRoot()+resp.data.bookCoverPath;
                            }
                            var str='';
                                // 得到字符串
                                var  bookOldPublicationDateStr=resp.data.bookDetailOldPublicationDate;
                                var  bookOldEditionStr=resp.data.bookDetailOldEdition;
                                var  bookOldRevisionStr=resp.data.bookDetailOldRevision;
                                //   将字符串用“，” 分成数组
                                var bookOldPublicationDateArr=bookOldPublicationDateStr.split(',');
                                var newBookOldPublicationDateArr=[];
                                for(var j=0;j<bookOldPublicationDateArr.length;j++){
                                    newBookOldPublicationDateArr.push(bookOldPublicationDateArr[j].replace("-","年"));
                                }
                                var bookOldEditionArr=bookOldEditionStr.split(',');
                                var bookOldRevisionArr=bookOldRevisionStr.split(',');
                                // 将数组拼成字符串
                                for(var k=0;k<newBookOldPublicationDateArr.length;k++){
                                    if(newBookOldPublicationDateArr[k]){
                                        str+=newBookOldPublicationDateArr[k]+'月';
                                    }
                                    if(bookOldEditionArr[k]){
                                        str+='第'+bookOldEditionArr[k]+'版';
                                    }
                                    if(bookOldRevisionArr[k]){
                                        str+='第'+bookOldRevisionArr[k]+'次印刷';
                                    }
                                    if(k!==newBookOldPublicationDateArr.length-1){
                                        str+=',';
                                    }
                                    resp.data.braileStatisticalNewPublicTime=str;
                                }
                            this.$('#bookDetailPanel').html(util.template(detailTpl, {info: resp.data}));
                            // 查询完图书详情继续查询任务详情
                            this.searchTaskFlowList();
                        } else {
                            console.log(resp);
                            util.showAlert(resp.message || '查询图书详情出错，请稍后重试！');
                        }
                    }.bind(this),
                    error: function (xhr) {
                        // XHR错误
                        util.hideLoading();
                        console.log(xhr);
                        util.showAlert('查询图书详情出错，请稍后重试！');
                    }.bind(this)
                });
            } else {
                // 选择了多条或者没选择，清空流程列表
                this.$('#taskWorkflowTable').empty();
            }
        },

        /**
         * 查询任务列表
         */
        searchTaskFlowList: function () {
            var $row = this.$('#workListTBody tr.info');
            if ($row.length > 0) {
                var searchBookId = $row.attr('data-bookId');
                var deploymentKey = $row.attr('data-deploy');
                var deploymentApplyId = $row.attr('data-isbncipApplyId');
                var cnQualityFlowId = $row.attr('data-flowId');
                var params = {};
                // 该关键字有两种searchBookId和searchidTopicId，所以需要子类覆盖
                params[this.searchFlowListId] = searchBookId;
                params[this.searchFlowListKey] = deploymentKey;
                if(this.searchFlowId){
                    params.searchFlowId= this.searchFlowId;
                }

                // 汉文印前质检用到
                if(cnQualityFlowId){
                    params.cnQualityFlowId= $row.attr('data-flowId');
                }

                if(deploymentApplyId){
                    params.searchIsbncipApplyId= deploymentApplyId;
                }

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

        },

        /**
         * 修改图书的图片，给后台传图书id和图片地址
         */
        changeImg:function (address) {
            var $row = this.$('#workListTBody tr.info');
            util.sendRequest({
                data:{
                    bookId: $row.attr('data-bookId'),
                    bookCoverPath:address
                },
                action: 'bookDetail/modifyBookDetail.action',
                success: function(resp) {
                    console.log(resp);
                    if (resp.code === 0) {
                        util.showAlert(resp.message || '上传照片成功，请稍后重试！');
                    } else{
                        util.showAlert(resp.message || '上传照片出错，请稍后重试！');
                    }
                },
                error: function(xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('上传照片出错，请稍后重试！');
                }
            });
        },


        /**
         * 检索图书列表
         */
        searchTaskList: function () {
            // 做一些清理工作
            // 清空流程列表
            this.$('#taskWorkflowTable').html(util.template(flowListTpl, {list: []}));
            // 恢复全选状态
            this.$('#workListTable thead i[data-action="check"]').removeClass('fa-check-square-o').addClass('fa-square-o');
            // 清理详情
            this.$('#bookDetailPanel').html('<p class="c-gray">（请选择图书后查看详情）</p>');

            // 生成搜索参数
            var params = {};
            // 年月
            params.searchYear = this.currentYear;
            params.searchMonth = this.currentMonth;
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
                        this.$('#workListTBody').html(util.template((this.baseTpl || listTpl), {list: resp.data.records}));
                        // 分页数据
                        this.$('#workListPaging').html(this.buildPagination(resp.data.pageNow, resp.data.pageCount));
                        // 回调函数
                        this.onSelectRowChanged();
                        this.onCheckRowChanged();
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
        },

        /**
         * 检索未处理任务
         */
        searchUntreatedTask: function () {
            var that = this;
            var data = this.yearMonth;

            // 清理树上任务数
            var elements = that.treeObj.get_node(that.treeObj.element).children_d, node;
            for (var k = 0; k < elements.length; k++) {
                node = that.treeObj.get_node(elements[k]);
                // 选中节点有年、月
                if (node.data && node.data.type === 'year') {
                    // 移除树上的<span>，该<span>为红色的任务数
                    $('#' + node.id).find('a span').remove();
                }
            }

            // 成功回调
            function successCallback(resp) {
                if (resp.code === 0) {
                    // 数据预处理汇总
                    var yearCount = {};

                    // 遍历所有年月数据
                    var data, $a;
                    var elements = that.treeObj.get_node(that.treeObj.element).children_d, node;
                    for (var i = 0; i < resp.data.length; i++) {
                        data = resp.data[i];
                        // 遍历所有树节点
                        for (var j = 0; j < elements.length; j++) {
                            node = that.treeObj.get_node(elements[j]);
                            // 选中节点有年、月
                            if (node.data && node.data.type === 'month') {
                                if (node.data.year === data.taskYear && node.data.month === data.taskMonth) {
                                    $a = $('#' + node.id).find('a');
                                    if ($a.find('span').length > 0) {
                                        $a.find('span').text('(' + data.unreadCount + ')');
                                    } else {
                                        // $a.append(' <span class="c-red">(' + data.unreadCount + ')</span>');
                                        node.text=node.text.split('<span class="c-red">')[0]; // text里会保存上次的span
                                        var text1=node.text+'<span class="c-red">（'+data.unreadCount+'）</span>';
                                        that.treeObj.set_text(node,text1);
                                    }
                                }
                            }
                        }
                        // 按年累计一下
                        yearCount[data.taskYear] = yearCount[data.taskYear] ? (yearCount[data.taskYear] + data.unreadCount) : data.unreadCount;
                    }
                    // 单独对年处理一下
                    for (var k = 0; k < elements.length; k++) {
                        node = that.treeObj.get_node(elements[k]);
                        // 选中节点有年、月
                        if (node.data && node.data.type === 'year') {
                            if (yearCount[node.data.year]) {
                                $a = $('#' + node.id + '>a');
                                if ($a.find('span').length > 0) {
                                    $a.find('span').text('(' + yearCount[node.data.year] + ')');
                                } else {
                                    // $a.append(' <span class="c-red">(' + yearCount[node.data.year] + ')</span>');
                                    node.text=node.text.split('<span class="c-red">')[0]; // text里会保存上次的span
                                    var text2=node.text+'<span class="c-red">（'+yearCount[node.data.year]+'）</span>'
                                    that.treeObj.set_text(node,text2);
                                }
                            }
                        }
                    }
                } else {
                    console.log(resp);
                }
            }

            // 失败回调
            function errorCallback(xhr) {
                // XHR错误
                console.log(xhr);
            }

            // 循环按年并发请求
            for (var i in data) {
                if (data.hasOwnProperty(i)) {
                    util.sendRequest({
                        data: {
                            searchYear: i,
                            // 任务类型
                            searchBookType: this.deployKey,
                            searchFlowId : this.unreadSearchFlowId
                        },
                        action: this.unreadCountAction,
                        // 因为想回传数据，所以只能将函数写在循环内
                        success: successCallback,
                        error: errorCallback
                    });
                }
            }

            // 检索任务列表
            this.searchTaskList();
        },

        /**
         * 初始化年月树
         * 该函数仅在页面初始化时调用一次
         */
        initMonthTree: function () {
            util.showLoading();
            util.sendRequest({
                data: {},
                action: this.yearMonthListAction,
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        // tree 基础数据
                        var treeData = {
                            'core': {
                                'data': []
                            }
                        };

                        // 排序
                        // 服务器返回JSON格式，无法确保顺序，所以需要转成数组重新倒序排序
                        var data = resp.data, count = 0, node;
                        var newData = [];
                        for (var i in data) {
                            if (data.hasOwnProperty(i)) {
                                newData.push({year: i, data: data[i]});
                            }
                        }
                        newData.sort(function (a, b) {
                            return (b.year - a.year);
                        });

                        if (newData.length > 0) {
                            // 默认当前年
                            this.currentYear = newData[0].year;
                        }

                        // 遍历 年
                        for (i = 0; i < newData.length; i++) {
                            if(i===0){
                                treeData.core.data.push({
                                    text: newData[i].year + '年',
                                    // 默认先显示动图
                                    icon: 'fa fa-calendar box',
                                    state: {
                                        'opened': i === 0,
                                        'selected':true
                                    },
                                    children: [],
                                    data: {
                                        year: parseInt(newData[i].year),
                                        type: 'year'
                                    }
                                });
                            }else{
                                treeData.core.data.push({
                                    text: newData[i].year + '年',
                                    // 默认先显示动图
                                    icon: 'fa fa-calendar box',
                                    state: {
                                        'opened': i === 0,
                                        'selected':false
                                    },
                                    children: [],
                                    data: {
                                        year: parseInt(newData[i].year),
                                        type: 'year'
                                    }
                                });
                            }
                            // 当前年节点子成员
                            node = treeData.core.data[count++].children;
                            for (var j = 0; j < newData[i].data.length; j++) {
                                node.push({
                                    'text': newData[i].data[j] + '月'+ (this.treeName || '图书'),
                                    'icon': 'fa fa-bookmark-o',
                                    'data': {
                                        year: parseInt(newData[i].year),
                                        month: parseInt(newData[i].data[j]),
                                        type: 'month'
                                    }
                                });
                            }
                        }

                        // 生成树
                        this.$('#monthTree').jstree(treeData).bind('changed.jstree', function (src, evt) {
                            this.currentPage = 1;
                            // 点击树节点后重新检索选题列表
                            var data = evt.node.data;
                            if (data && data.month) {
                                this.currentMonth = data.month;
                                this.currentYear = data.year;
                                this.searchYearMonth = util.fillUp(this.currentYear, '0', 4) + '-' + util.fillUp(this.currentMonth, '0', 2);
                            } else {
                                this.currentMonth = '';
                                this.currentYear = data.year;
                                this.searchYearMonth = util.fillUp(this.currentYear, '0', 4);
                            }
                            // 清空所有搜索条件
                            this.$('#formSearchWork input[data-search],select[data-search]').val('');
                            this.searchParams = {};
                            // 查询任务列表
                            this.searchTaskList();
                            // 调用子类对应方法，子类可以进行额外处理
                            this.onTreeNodeChanged();
                        }.bind(this));
                        // 全局treeObj对象
                        this.treeObj = this.$('#monthTree').jstree();

                        // 将年月数据记录到全局，后面刷新树时需要使用
                        this.yearMonth = data;
                        // 查询未处理任务数
                        this.searchUntreatedTask();
                    } else {
                        console.log(resp);
                        util.showAlert(resp.message || '查询基础数据出错，请稍后重试！');
                    }
                }.bind(this),
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('查询基础数据出错，请稍后重试！');
                }.bind(this)
            });
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;

            // 树上的搜索按钮
            this.$container.on('click', '#btnTaskTreeSearch', this.searchUntreatedTask.bind(this));

            // 列表上的搜索按钮
            this.$container.on('click', '#btnSearchWork', function () {
                this.searchParams = this.buildSearchParams(this.$('#formSearchWork input[data-search],select[data-search]'));
                this.searchTaskList();
            }.bind(this));

            // 选择任务列表
            this.makeSelectableTable('#workListTable', function () {
                    that.currentId = that.$('#workListTBody').find('tr.info').attr('id');
                    // 查询图书详情
                    that.searchBookDetail();
                    // 回调函数
                    that.onSelectRowChanged();
                },
                function () {
                    // 回调函数
                    that.onCheckRowChanged();
                });
            // 图书详情的图片
            that.$container.on('click', '#bookCover', function(){
                that.openPage('public/file/file-upload', {});
            });

            // 分页
            that.$container.on('click', '#workListPaging a', function () {
                var $el = $(this);
                var page = $el.attr('data-page');
                if (page) {
                    // 修改页面后重新刷新页面数据
                    that.currentPage = page;
                    that.searchTaskList();
                }
            });

            // 任务详情
            this.$container.on('click', 'button.task-detail-btn', function () {
                var data = {
                    taskId: $(this).attr('data-taskId'),
                    flowId: $(this).attr('data-flowId'),
                    deployKey: $(this).attr('data-deploy'),
                    bookId: $(this).attr('data-bookId')
                };
                // 针对封面设计单加的特殊字段
                if( typeof that.staticParams.searchFlowId !== 'undefined'){
                    data.searchFlowId=that.staticParams.searchFlowId;
                }
                // 针对版署单加的特殊字段
                if( typeof that.staticParams.searchBottomApply !== 'undefined'){
                    // 版署不要这些字段
                    delete data.bookId;
                    data.searchIsbncipApplyId= $(this).attr('data-isbncipApplyId');
                }
                that.openPage('other/base/task-flow-detail', data);
            });

            // 判断是否需要添加“与我相关选项”
            if (this.$('#taskAboutArea').length > 0) {
                // 动态添加checkbox
                this.$('#taskAboutArea').append('[ <label><input type="checkbox" name="searchTaskAbout" checked> 待我处理</label> ]');
                // 生成iCheck
                this.$container.find('.task-about input').iCheck({
                    checkboxClass: 'icheckbox_minimal-blue',
                    radioClass: 'icheckbox_minimal-blue'
                }).on('ifChanged', function (event) {
                    that.searchTaskAbout = $(this).prop('checked') ? '1' : '2';
                    that.currentPage = 1;
                    that.searchTaskList();
                });
            }
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
            // 初始化年月树
            this.initMonthTree();

        },

        /**
         * 树节点选择回调
         * 子类若需要处理则覆盖该函数
         */
        onTreeNodeChanged: function () {

        },

        /**
         * 任务列表行选择变更
         * 子类若需要处理则覆盖该函数
         */
        onSelectRowChanged: function () {

        },

        /**
         * 勾选行变更事件
         * 子类若需要处理则覆盖该函数
         */
        onCheckRowChanged: function () {

        },

        /**
         * 初始化时被调用
         */
        onInit: function ($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);
            this.initTemplate(tpl, {});

            this.treeObj = null;

            // 初始化页面事件
            this.initPageEvent();

            // 初始化页面数据
            this.initPageData();
        },

        /**
         * 页面返回事件
         * @param data
         */
        onBack: function (data) {
            this._super(data);
            if (data && data.refresh) {
                this.searchUntreatedTask();
            }
            if(data && data.id){
                // 给后台发请求同时修改img的路径
                var bookPath=util.getResourceRoot()+data.id;
                var urlAddress='url('+bookPath+')';
                $('#bookCover').css({'background-image':urlAddress});
                this.changeImg(data.id);
            }
        },

        /**
         * 窗口缩放事件
         */
        onResize: function () {
            this._super();
        },

        /**
         * 页面销毁
         */
        onDestroy: function () {
            this._super();
        }


    });

    module.exports = Module;
});