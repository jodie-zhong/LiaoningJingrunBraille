define(function(require, exports, module) {
    "use strict";

    var util = require('../../../common/util');
    var DialogBase = require('../../../common/base-dialog');

    var Module = DialogBase.extend(new function() {
        var that;
        var info = null;

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            // 查看
            that.$container.on('click', 'button', function () {
                var $el=$(this);
                // 区分选题和图书
                var action='common/searchBookFlowList.action';
                if($el.attr('data-deployId')==='BrailleTopic'){
                    action='topic/listFlowInfo.action';
                }
                if($el.attr('data-deployId')==='BrailleBigTopicRecord' || $el.attr('data-deployId')==='BrailleImportedTopicRecord'){
                    action='backup/listFlowInfoBackup.action';
                }
                that.openPage('public/workflow/workflow-dialog', {
                    flowInfoAction:action,
                    bookId: $el.attr('data-bookId'),
                    topicId: $el.attr('data-topicId'),
                    taskId: $el.attr('data-taskId'),
                    deployId: $el.attr('data-deployId'),
                    libraryIndex:$el.attr('data-index'),
                    isView: true
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
            info = data;
            that.initTemplate(tpl, {info: data});
            // 初始化页面事件
            initPageEvent();
            // 初始化页面数据
            initPageData();
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