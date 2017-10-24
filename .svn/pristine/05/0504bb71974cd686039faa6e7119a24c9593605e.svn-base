define(function (require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var Base = require('../../../common/base-page');
    var flowListTpl = require('./print-audit-manage-list.tpl');
    var detailTpl = require('./print-audit-flowlist.tpl');
    require('../../../assets/plugins/jstree/jstree.min');
    require('../../../assets/plugins/jstree/src/themes/default/style.min.css');
    require('../../../assets/plugins/icheck/icheck.min');
    require('../../../assets/plugins/icheck/skins/minimal/blue.css');

    var FLOW_SUBMIT_AUDIT = 'submitAudit';                                  // 提交审核
    var FLOW_AUDITt_ONE = 'readerServiceDepartmentHeadAudit';               // 读者服务部部门负责人审核
    var FLOW_AUDITt_TWO = 'readerServicesCommunityLeaderAudit';	            // 读者服务部分管社领导审核
    var FLOW_AUDITt_THREE = 'libraryServiceDepartmentHeadAudit';	        // 典藏借阅部部门负责人审核
    var FLOW_AUDITt_FOUR = 'librarySectionCommunityLeaderAudit';	        // 典藏借阅部分管社领导审核
    var FLOW_AUDITt_FIVE = 'editorOfficeDepartmentHeadAudit';	            // 总编室部门负责人审核
    var FLOW_AUDITt_SIX = 'editorOfficeDepartmentLeaderAudit';	            // 总编室分管社领导审核
    var FLOW_AUDITt_SEVEN = 'braillePrintDepartmentHeadAudit';	            // 盲文印制部负责人审核
    var FLOW_AUDITt_EIGHT = 'braillePrintDepartmentLeaderAudit';	        // 盲文印制部分管社领导审核

    var Module = Base.extend(new function () {
        // 与任务流相关的参数
        var deployKey = 'BraillePrintedListManage';
        var that;

        var searchFlowListKey = 'bookId';

        var flowInfoAction = 'bookPrinted/listFlowInfo.action';
        // 针对删除事件特设的变量，因只在待审核状态才能有可能会去触发删除事件，别的状态下,删除按钮不可点
        var canDel = false;

        var currentPage = 1;
        var currentMonth = '';
        var currentYear = '';
        var pTaskId = '';
        var pBookPrintId = '';
        var searchYearMonth = '';
        var treeObj = null;
        var yearMonth = null;

        // 当前选中的id
        var currentBookId = '';
        var currentTaskId = '';
        var currentPrintId = '';
        var currentName = '';
        // 默认一个bookId
        var allBookId = '';

        /**
         * 初始化年月树
         */
        function initMonthTree() {
            util.showLoading();
            util.sendRequest({
                data: {},
                action: 'common/searchYearMonthList.action',
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
                            currentYear = newData[0].year;
                        }

                        // 遍历 年
                        for (i = 0; i < newData.length; i++) {
                            if (i === 0) {
                                treeData.core.data.push({
                                    text: newData[i].year + '年',
                                    // 默认先显示动图
                                    icon: 'fa fa-calendar box',
                                    state: {
                                        'opened': i === 0,
                                        'selected': true
                                    },
                                    children: [],
                                    data: {
                                        year: parseInt(newData[i].year),
                                        type: 'year'
                                    }
                                });
                            } else {
                                treeData.core.data.push({
                                    text: newData[i].year + '年',
                                    // 默认先显示动图
                                    icon: 'fa fa-calendar box',
                                    state: {
                                        'opened': i === 0,
                                        'selected': false
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
                                    'text': newData[i].data[j] + '月图书',
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
                        $('#monthTree').jstree(treeData).bind('changed.jstree', function (src, evt) {
                            currentPage = 1;
                            var data = evt.node.data;
                            if (data && data.month) {
                                currentMonth = data.month;
                                currentYear = data.year;
                                searchYearMonth = util.fillUp(currentYear, '0', 4) + '-' + util.fillUp(currentMonth, '0', 2);
                            } else {
                                currentMonth = '';
                                currentYear = data.year;
                                searchYearMonth = util.fillUp(this.currentYear, '0', 4);
                            }
                            searchBookPrintedList();
                        });

                        // 全局treeObj对象
                        treeObj = $('#monthTree').jstree();

                        // 将年月数据记录到全局，后面刷新树时需要使用
                        yearMonth = data;
                        searchUntreatedTask();

                    } else {
                        console.log(resp);
                        util.showAlert(resp.message || '查询基础数据出错，请稍后重试！');
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('查询基础数据出错，请稍后重试！');
                }
            });
        }

        /**
         * 查询图书印制信息
         */
        function searchBookPrintedList() {
            //清空选题列表的thead选中事件
            that.$('#workListTable thead').find('i[data-action="check"]').removeClass('fa-check-square-o').addClass('fa-square-o');
            // 出现列表表示年月全有，则添加，提交，处理，导出，查看都能点（只有删除不能点，在状态为待审核才能删除）
            that.$('#btnPrintedAdd,#btnPrintedDel,#btnPrintedSubmit,#btnPrintedSingle,#btnPrintedExport,#btnPrintedSearch').attr('disabled', 'disabled');
            if (currentYear && currentMonth) {
                that.$('#btnPrintedAdd').removeAttr('disabled');// 没有数据时也可以添加
            }
            canDel = false;
            util.showLoading();
            var params = {
                page: currentPage,
                bookPrintYear: currentYear,
                bookPrintMonth: currentMonth
            };
            util.sendRequest({
                data: params,
                action: 'bookPrinted/searchBookPrintedList.action',
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        that.$('#workListTBody').html(util.template(flowListTpl, {
                            list: resp.data.records
                        }));
                        // 针对导出
                        var isRecords = false;
                        if (resp.data.records.length > 0 && currentYear && currentMonth) {
                            // 针对添加按钮
                            pTaskId = resp.data.records[0].taskId || '';
                            pBookPrintId = resp.data.records[0].bookPrintId || '';
                            if (resp.data.records[0].flowId === 'submitAudit' && resp.data.records[0].taskState ==='1') {
                                that.$('#btnPrintedAdd').removeAttr('disabled');
                            } else {
                                that.$('#btnPrintedAdd').attr('disabled', 'disabled');
                            }
                        }else{
                            pTaskId = '';
                            pBookPrintId = '';
                        }
                        if (resp.data.records.length > 0 && (currentYear || currentMonth)) {
                            that.$('#btnPrintedExport').removeAttr('disabled');
                            isRecords = true;
                        } else {
                            that.$('#btnPrintedExport').attr('disabled', 'disabled');
                            isRecords = false;
                        }
                        firstData(isRecords);
                        // 分页数据
                        that.$('#workListPaging').html(that.buildPagination(resp.data.pageNow, resp.data.pageCount));
                    } else {
                        util.showAlert(resp.message || '查询出错，请稍后重试！');
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('查询出错，请稍后重试！');
                }
            });
        }

        /**
         * 上边选中事件（只针对删除）
         */

        function onCheckRowChanged() {
            var count = 0, bookIds = [], names = [];
            // 只适用于删除
            that.$('#workListTBody').find('tr[checked]').each(function () {
                bookIds.push($(this).attr('data-bookId'));
                names.push($(this).attr('data-name'));
            });
            count = bookIds.length;
            currentBookId = bookIds.join(',');
            currentName = names.join(',');
            if (count > 0 && canDel && (currentYear || currentMonth)) {
                that.$("#btnPrintedDel").removeAttr('disabled');
            } else {
                that.$("#btnPrintedDel").attr('disabled', 'disabled');
            }
        }

        /**
         * 上边每行选中事件（针对下边的查看）
         */
        function onCheckRowSearch() {
            var $row = that.$('#workListTBody tr.info');
            if ($row.length > 0) {
                var params = {
                    searchBookPrintId: $row.attr('data-PrintId'),
                    searchBookId:$row.attr('data-bookId'),
                    deploymentKey: $row.attr('data-deploy')
                };
                // 选择了一条
                util.showLoading();
                util.sendRequest({
                    data: params,
                    action: 'common/searchTaskList.action',
                    success: function (resp) {
                        util.hideLoading();
                        if (resp.code === 0) {
                            // 任务列表
                            that.$('#taskWorkflowTable').html(util.template(detailTpl, {list: resp.data}));
                        } else {
                            console.log(resp);
                            util.showAlert(resp.message || '查询图书详情出错，请稍后重试！');
                        }
                    },
                    error: function (xhr) {
                        // XHR错误
                        util.hideLoading();
                        console.log(xhr);
                        util.showAlert('查询图书详情出错，请稍后重试！');
                    }
                });
            } else {
                // 选择了多条或者没选择，清空流程列表
                that.$('#taskWorkflowTable').empty();
            }
        }

        /**
         * 导出函数
         */
        function exportBookPrint() {
            if (currentYear || currentMonth) {
                var url = util.getServerBase() + 'bookPrinted/doExport.action?';
                url += 'bookPrintYear=' + currentYear;
                url += '&bookPrintMonth=' + currentMonth;
                window.open(url, '_blank');
            }
        }

        /**
         * 删除行
         */
        function deleteBookPrint() {
            util.showConfirm('确定要将 “' + currentName + '” 删除吗？', function () {
                var params = {
                    bookIds: currentBookId,
                    bookPrintId: pBookPrintId,
                    taskId: pTaskId
                };
                util.showLoading();
                util.sendRequest({
                    data: params,
                    action: 'bookPrinted/removeBook.action',
                    success: function (resp) {
                        util.hideLoading();
                        if (resp.code === 0) {
                            // 成功删除后直接刷新列表
                            util.showAlert(resp.message || '删除成功！');
                            searchBookPrintedList();
                        } else {
                            console.log(resp);
                            util.showAlert(resp.message || '删除出错，请稍后重试！');
                        }
                    },
                    error: function (xhr) {
                        // XHR错误
                        util.hideLoading();
                        console.log(xhr);
                        util.showAlert('删除出错，请稍后重试！');
                    }
                });
            });
        }

        /**
         * 页面底部的查看功能
         */
        function searchTaskList() {
            var $el = $(this);
            var params = {
                flowId: $el.attr('data-flowId'),
                taskId: $el.attr('data-taskId'),
                deploymentKey: $el.attr('data-deploy'),
                searchBookId: $el.attr('data-bookId'),
                searchBookPrintId: $el.attr('data-printId')
            };
            util.sendRequest({
                data: params,
                action: 'common/searchTaskDetail.action',
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        // 任务列表
                        that.openPage('braille/print-audit/print-flow-detail', resp.data);
                    } else {
                        console.log(resp);
                        util.showAlert(resp.message || '查询流程列表出错，请稍后重试！');
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('查询流程列表出错，请稍后重试！');
                }
            });
        }

        /**
         * 获取默认第一行的数据，页面加载后就执行
         */
        function firstData(isRecords) {
            if (isRecords) {
                var flowId = null, taskUsers = null;
                var submitAudit = true, auditOne = true, auditTwo = true, auditThree = true, auditFour = true, auditFive = true, auditSix = true, auditSeven = true, auditEight = true, allMe = false, allUnfinished = true,submitState=true;
                var userId = util.getUserInfo().userId;
                allBookId = that.$('#workListTBody tr').attr('data-bookId');
                flowId = that.$('#workListTBody tr').attr('data-flowId');
                taskUsers = that.$('#workListTBody tr').attr('data-taskUsers');
                taskUsers = taskUsers ? taskUsers.split(',') : [];
                if (taskUsers.indexOf(userId) > -1) {
                    allMe = true;
                }
                //  包含非提交审核
                if (flowId !== FLOW_SUBMIT_AUDIT) {
                    submitAudit = false;
                }
                // 包含非读者服务部部门负责人审核
                if (flowId !== FLOW_AUDITt_ONE) {
                    auditOne = false;
                }
                // 包含非读者服务部分管社领导审核
                if (flowId !== FLOW_AUDITt_TWO) {
                    auditTwo = false;
                }
                // 包含非典藏借阅部部门负责人审核
                if (flowId !== FLOW_AUDITt_THREE) {
                    auditThree = false;
                }
                // 包含非典藏借阅部分管社领导审核
                if (flowId !== FLOW_AUDITt_FOUR) {
                    auditFour = false;
                }
                // 包含非总编室部门负责人审核
                if (flowId !== FLOW_AUDITt_FIVE) {
                    auditFive = false;
                }
                // 包含非总编室分管社领导审核
                if (flowId !== FLOW_AUDITt_SIX) {
                    auditSix = false;
                }
                // 包含非盲文印制部负责人审核
                if (flowId !== FLOW_AUDITt_SEVEN) {
                    auditSeven = false;
                }
                // 包含非盲文印制部分管社领导审核
                if (flowId !== FLOW_AUDITt_EIGHT) {
                    auditEight = false;
                }
                // 任务状态未完成
                if (that.$('#workListTBody tr').attr('data-taskState') === '2') {
                    allUnfinished = false;
                }
                // 提交状态为1
                if (that.$('#workListTBody tr').attr('data-state') === '1') {
                    submitState = false;
                }
                // 提交后就不可以添加和删除
                if (( auditOne || auditTwo || auditThree || auditFour || auditFive || auditSix || auditSeven || auditEight ) && allMe && allUnfinished && currentYear && currentMonth) {
                    that.$('#btnPrintedSingle').removeAttr('disabled');
                    canDel = false;
                }
                // 删除
                if (submitAudit && allUnfinished && (currentYear || currentMonth)) {
                    canDel = true;
                }
                // 提交
                if (submitAudit && allUnfinished && currentYear && currentMonth) {
                    that.$('#btnPrintedSubmit').removeAttr('disabled');
                }
                // 查看
                if ((( auditOne || auditTwo || auditThree || auditFour || auditFive || auditSix || auditSeven || auditEight ) || ( submitAudit && submitState)) && currentYear && currentMonth) {
                    that.$('#btnPrintedSearch').removeAttr('disabled');
                }
            }
        }

        /**
         * 检索未处理任务
         */
        function searchUntreatedTask() {
            var data = yearMonth;
            // 清理树上任务数
            var elements = treeObj.get_node(treeObj.element).children_d, node;
            for (var k = 0; k < elements.length; k++) {
                node = treeObj.get_node(elements[k]);
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
                    var elements = treeObj.get_node(treeObj.element).children_d, node;
                    for (var i = 0; i < resp.data.length; i++) {
                        data = resp.data[i];
                        // 遍历所有树节点
                        for (var j = 0; j < elements.length; j++) {
                            node = treeObj.get_node(elements[j]);
                            // 选中节点有年、月
                            if (node.data && node.data.type === 'month') {
                                if (node.data.year === data.taskYear && node.data.month === data.taskMonth) {
                                    $a = $('#' + node.id).find('a');
                                    if ($a.find('span').length > 0) {
                                        $a.find('span').text('(' + data.unreadCount + ')');
                                    } else {
                                        // $a.append(' <span class="c-red">(' + data.unreadCount + ')</span>');
                                        node.text = node.text.split('<span class="c-red">')[0]; // text里会保存上次的span
                                        var text1 = node.text + '<span class="c-red">（' + data.unreadCount + '）</span>';
                                        treeObj.set_text(node, text1);
                                    }
                                }
                            }
                        }
                        // 按年累计一下
                        yearCount[data.taskYear] = yearCount[data.taskYear] ? (yearCount[data.taskYear] + data.unreadCount) : data.unreadCount;
                    }
                    // 单独对年处理一下
                    for (var k = 0; k < elements.length; k++) {
                        node = treeObj.get_node(elements[k]);
                        // 选中节点有年、月
                        if (node.data && node.data.type === 'year') {
                            if (yearCount[node.data.year]) {
                                $a = $('#' + node.id + '>a');
                                if ($a.find('span').length > 0) {
                                    $a.find('span').text('(' + yearCount[node.data.year] + ')');
                                } else {
                                    // $a.append(' <span class="c-red">(' + yearCount[node.data.year] + ')</span>');
                                    node.text = node.text.split('<span class="c-red">')[0]; // text里会保存上次的span
                                    var text2 = node.text + '<span class="c-red">（' + yearCount[node.data.year] + '）</span>';
                                    treeObj.set_text(node, text2);
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
                            searchBookType: deployKey
                        },
                        action: 'common/searchUnreadCount.action',
                        // 因为想回传数据，所以只能将函数写在循环内
                        success: successCallback,
                        error: errorCallback
                    });
                }
            }
            searchBookPrintedList();
        }

        /**
         * 跳转页面
         */
        function jumpPage() {
            var $el = $(this);
            var page = $el.attr('data-page');
            if (page) {
                // 修改页面后重新刷新页面数据
                currentPage = page;
                searchBookPrintedList();
            }
        }

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            //上报列表选中事件
            that.makeSelectableTable("#workListTable", onCheckRowSearch, onCheckRowChanged);
            // 添加
            that.$container.on('click', '#btnPrintedAdd', function () {
                var info = {
                    year: currentYear,
                    month: currentMonth,
                    taskId: pTaskId,
                    bookPrintId: pBookPrintId
                }
                that.openPage('braille/print-audit/print-audit-add', info);
            });
            //删除（只有它有选） 每行能在待审核状态时能点击删除
            that.$container.on('click', '#btnPrintedDel', deleteBookPrint);
            //导出
            that.$container.on('click', '#btnPrintedExport', exportBookPrint);
            // 提交和处理
            that.$container.on('click', '#btnPrintedSubmit,#btnPrintedSingle', function () {
                var btnText = $(this).text();
                // 特殊处理一下，给后台传一个bookId，用来查当前流程
                if (that.$('#workListTBody tr').length > 0) {
                    allBookId = that.$('#workListTBody tr').attr('data-bookId');//默认获取第一个
                    that.openPage('public/workflow/workflow-dialog', {
                        flowInfoAction: flowInfoAction,
                        bookId: allBookId,
                        taskId: currentTaskId,
                        deployId: deployKey,
                        yearMonth: (currentYear + "," + currentMonth),
                        btnText: btnText
                    });
                }
            });
            // 查看
            that.$container.on('click', '#btnPrintedSearch', function () {
                // 特殊处理一下，给后台传一个bookId，用来查当前流程
                if (that.$('#workListTBody tr').length > 0) {
                    allBookId = that.$('#workListTBody tr').attr('data-bookId');//默认获取第一个
                    that.openPage('public/workflow/workflow-dialog', {
                        flowInfoAction: flowInfoAction,
                        bookId: allBookId,
                        taskId: currentTaskId,
                        deployId: deployKey,
                        yearMonth: (currentYear + "," + currentMonth),
                        isView: true
                    });
                }
            });
            // 列表下边的查看功能
            that.$container.on('click', '#taskWorkflowTable .task-detail-btn', searchTaskList);
            // 分页
            that.$container.on('click', '#workListPaging a', jumpPage);
        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
            initMonthTree();
        }

        /**
         * 初始化时被调用
         */
        this.onInit = function ($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);
            that = this;
            that.initTemplate(tpl, {});

            currentPage = 1;
            currentMonth = '';
            currentYear = '';
            pTaskId = '';
            pBookPrintId = '';
            searchYearMonth = '';
            treeObj = null;
            yearMonth = null;
            canDel = false;
            // 当前选中的id
            currentBookId = '';
            currentTaskId = '';
            currentPrintId = '';
            currentName = '';
            // 默认一个bookId
            allBookId = '';


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
        this.onBack = function (data) {
            this._super(data);
            if (data && data.refresh === true) {
                if (currentYear || currentMonth) {
                    searchUntreatedTask();
                }
            }
        };

        /**
         * 窗口缩放事件
         */
        this.onResize = function () {
            this._super();
        };

        /**
         * 页面销毁
         */
        this.onDestroy = function () {
            this._super();
        };

    }());

    module.exports = Module;
});