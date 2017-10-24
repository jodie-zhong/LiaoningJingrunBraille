define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');

    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'bookTopic/saveOrSubmitBookTopic.action',
        // 查询接口
        detailAction: 'bookTopic/detailBookTopic.action',

        levelTwo: {},

        /**
         * 初始化图书类别
         */
        searchBookType: function () {
            util.sendRequest({
                data: {},
                action: 'bookTopic/bookType.action',
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        this.levelTwo = resp.data.twoLevel;
                        var levelOne = resp.data.oneLevel;
                        var $typeOneElement = this.$('#bookTopicOne'), $dom;
                        for (var i in levelOne) {
                            if (levelOne.hasOwnProperty(i)) {
                                $dom = $('<option></option>');
                                $dom.text(levelOne[i]);
                                $dom.val(i);
                                $typeOneElement.append($dom);
                            }
                        }
                        this.buildLevel2Type();
                    } else {
                        console.log(resp);
                        util.showAlert(resp.message || '查询图书分类出错，请稍后重试！');
                    }
                }.bind(this),
                error: function (xhr) {

                }
            });
        },

        /**
         * 选题查重
         */
        searchSimilarName: function () {
            var topicName = this.$('input[name="bookTopicName"]').val();
            if (!topicName) {
                util.showAlert('请输入选题名称！');
                return;
            }
            util.showLoading();
            util.sendRequest({
                action: 'bookTopic/searchSimilarName.action',
                data: {
                    bookTopicName: topicName
                },
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        // 业务执行成功
                        if (resp.data && resp.data.length === 0) {
                            util.showAlert('没有重复的选题！');
                        } else {
                            var list = resp.data;
                            var html = '';
                            for (var i = 0; i < list.length; i++) {
                                html += '<p>《' + util.htmlEncode(list[i].bookTopicName) + '》</p>';
                            }
                            util.showAlert(html, null, '相似选题');
                        }
                    } else {
                        // 业务执行失败
                        util.showAlert(resp.message || '选题查重出错，请稍后重试！');
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('选题查重出错，请稍后重试！');
                }
            });
        },

        /**
         * 生成选题类型子类
         */
        buildLevel2Type: function () {
            // 先清空二级分类
            var $typeTwoElement = this.$('#bookTopicTwo');
            $typeTwoElement.empty();
            var $dom;
            // 当前选择的一级分类
            var levelOne = this.$('#bookTopicOne').val();
            if (this.levelTwo[levelOne]) {
                // 重新添加二级分类
                for (var i in this.levelTwo[levelOne]) {
                    if (this.levelTwo[levelOne].hasOwnProperty(i)) {
                        $dom = $('<option></option>');
                        $dom.text(this.levelTwo[levelOne][i]);
                        $dom.val(i);
                        $typeTwoElement.append($dom);
                    }
                }
            }
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;
            // 选题查重
            this.$container.on('click', '#btnTopicSimilar', this.searchSimilarName.bind(this));

            // 选题类型子类
            this.$container.on('change', '#bookTopicOne', this.buildLevel2Type.bind(this));
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
            // 初始化日期组件
            this.$('input.date-time').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: 'zh-cn',
                sideBySide: true
            });

            this.searchBookType();
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