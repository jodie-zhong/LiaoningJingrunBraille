define(function(require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var tree = require('../../other/base/tree-base');
    require('../../../assets/plugins/jstree/jstree.min');
    require('../../../assets/plugins/jstree/src/themes/default/style.min.css');
    var listTpl = require('./braille-statistical-list.tpl');

    var Module = tree.extend(new function() {
        var that;
        /**
         * 查询列表
         */
        function searchReportList() {
            var params = {
                searchYear:that.currentYear,
                searchMonth:that.currentMonth
            };
            util.showLoading();
            util.sendRequest({
                data: params,
                action: 'editing/searchEditingAndProofreadingList.action',
                success: function(resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        that.$('#staticFirst').html(util.template(listTpl, {
                            list: resp.data.bookEntitiesEditing
                        }));
                        that.$('#staticTwo').html(util.template(listTpl, {
                            list: resp.data.bookEntitiesEditingQuaily
                        }));
                        that.$('#staticThree').html(util.template(listTpl, {
                            list: resp.data.bookEntitiesDispatches
                        }));
                        that.$('#staticFour').html(util.template(listTpl, {
                            list: resp.data.bookEntitiesReadProofread
                        }));

                    } else{
                        util.showAlert(resp.message || '查询上报列表出错，请稍后重试！');
                    }
                },
                error: function(xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('查询上报列表出错，请稍后重试！');
                }
            });
        }


        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            that.$container.on('click', 'button[data-href]', function () {
                var $el = $(this);
                var href = $el.attr('data-href');
                // 有链接就跳转
                if (href) {
                    util.openPage(href, null, false, true);
                }
            });
        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
            // // 初始化年月树
            that.initMonthTree("#monthTree","统计",null,searchReportList);
            searchReportList();

        }

        /**
         * 初始化时被调用
         */
        this.onInit = function($el, tpl, data, indexRef) {
            this._super($el, tpl, data, indexRef);
            that = this;
            that.initTemplate(tpl, {});

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
            if(data && data.refresh === true) {

            }


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