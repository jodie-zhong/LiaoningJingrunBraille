define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');
    var that;
    var authorEditTpl =
        "<div class='row'>" +
        "  <div class='col-xs-10' style='width: 90%'>" +
        "    <div class='col-xs-3' style='padding: 0;'>" +
        "      <div class='form-group '>" +
        "        <label class='col-xs-3 control-label' style='padding: 0;'>作者</label>" +
        "        <div class='col-xs-9'>" +
        "          <input class='form-control' name='topicDetailOldAuthor' placeholder='作者' maxlength='32'/>" +
        "        </div>" +
        "      </div>" +
        "    </div>" +
        "    <div class='col-xs-5' style='padding: 0;'>" +
        "      <div class='form-group '>" +
        "        <label class='col-xs-7 control-label' style='padding: 0;'>著作方式（著、编、译）</label>" +
        "        <div class='col-xs-5'>" +
        "          <input class='form-control' name='topicDetailWorkWay' placeholder='著作方式' maxlength='64'/>" +
        "        </div>" +
        "      </div>" +
        "    </div>" +
        "    <div class='col-xs-4' style='padding: 0;'>" +
        "      <div class='form-group '>" +
        "        <label class='col-xs-4 control-label' style='padding: 0;'>作者角色</label>" +
        "        <div class='col-xs-8'>" +
        "          <input class='form-control' name='topicDetailAuthorRole' placeholder='作者角色' maxlength='64'/>" +
        "        </div>" +
        "      </div>" +
        "    </div>" +
        "  </div>" +
        "  <div class='col-xs-2' style='width: 10%; padding: 0; margin-top: 5px;'>" +
        "    <button class='btn btn-xs btn-success' name='addRow'><i class='fa fa-plus box'></i></button>" +
        "    <button class='btn btn-xs btn-danger' name='removeRow'><i class='fa fa-close box'></i></button>" +
        "  </div>" +
        "</div>";
    var authorViewTpl =
        "<div class='row'>" +
        "  <div class='col-xs-12'>" +
        "    <div class='col-xs-3' style='padding: 0;'>" +
        "      <div class='form-group'>" +
        "        <label class='col-xs-3 control-label' style='padding: 0;'>作者</label>" +
        "        <div class='col-xs-9'>" +
        "          <p class='form-control-static' data-name='topicDetailOldAuthor'></p>" +
        "        </div>" +
        "      </div>" +
        "    </div>" +
        "    <div class='col-xs-5' style='padding: 0;'>" +
        "      <div class='form-group'>" +
        "        <label class='col-xs-7 control-label' style='padding: 0;'>著作方式（著、编、译）</label>" +
        "        <div class='col-xs-5'>" +
        "          <p class='form-control-static' data-name='topicDetailWorkWay'></p>" +
        "        </div>" +
        "      </div>" +
        "    </div>" +
        "    <div class='col-xs-4' style='padding: 0;'>" +
        "      <div class='form-group'>" +
        "        <label class='col-xs-4 control-label' style='padding: 0;'>作者角色</label>" +
        "        <div class='col-xs-8'>" +
        "          <p class='form-control-static' data-name='topicDetailAuthorRole'></p>" +
        "        </div>" +
        "      </div>" +
        "    </div>" +
        "  </div>" +
        "</div>";
    var dateAndVersionEditTpl =
        "<div class='row'>" +
        "  <div class='col-xs-10' style='width: 88%;'>" +
        "    <div class='col-xs-4'>" +
        "      <div class='form-group'>" +
        "        <input style='width: 80%;' data-time='yearAndMonth' class='form-control date-time' maxlength='7' name='topicDetailOldPublicationDate' placeholder='年月' data-fv-notempty-message='请选择年月'/>" +
        "      </div>" +
        "    </div>" +
        "    <div class='col-xs-4'>" +
        "      <div class='form-group'>" +
        "        <input style='width: 80%;' class='form-control' name='topicDetailOldEdition' placeholder='版' maxlength='8' data-fv-notempty-message='请填写版' pattern='^[1-9][0-9]*$' data-fv-regexp-message='请输入大于0的整数'/>" +
        "        版" +
        "      </div>" +
        "    </div>" +
        "    <div class='col-xs-4'>" +
        "      <div class='form-group'>" +
        "        <input style='width: 80%;' class='form-control' name='topicDetailOldRevision' placeholder='次' maxlength='8' data-fv-notempty-message='请填写次' pattern='^[1-9][0-9]*$' data-fv-regexp-message='请输入大于0的整数'/>" +
        "        次" +
        "      </div>" +
        "    </div>" +
        "  </div>" +
        "  <div class='col-xs-2' style='width: 12%; padding: 0; margin-top: 5px;'>" +
        "    <button class='btn btn-xs btn-success' name='addRow'><i class='fa fa-plus box'></i></button>" +
        "    <button class='btn btn-xs btn-danger' name='removeRow'><i class='fa fa-close box'></i></button>" +
        "  </div>" +
        "</div>";
    var dateAndVersionViewTpl =
        "<div class='row'>" +
        "  <div class='col-xs-12'>" +
        "    <div class='col-xs-4'>" +
        "      <div class='form-group'>" +
        "        <p class='form-control-static' data-name='topicDetailOldPublicationDate'></p>" +
        "      </div>" +
        "    </div>" +
        "    <div class='col-xs-4'>" +
        "      <div class='form-group'>" +
        "        <p class='form-control-static' data-name='topicDetailOldEdition'></p>" +
        "      </div>" +
        "    </div>" +
        "    <div class='col-xs-4'>" +
        "      <div class='form-group'>" +
        "        <p class='form-control-static' data-name='topicDetailOldRevision'></p>" +
        "      </div>" +
        "    </div>" +
        "  </div>" +
        "</div>";

    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'topic/saveOrSubmitTopic.action',
        // 查询接口
        detailAction: 'topic/detailTopic.action',

        levelTwo: {},

        /**
         * 初始化中图类别
         */
        searchBookType: function () {
            util.sendRequest({
                data: {},
                action: 'topic/bookType.action',
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
                                if (i === that.data.info.topicDetailOneKind) {
                                    $dom.attr('selected', 'selected');
                                }
                                $typeOneElement.append($dom);
                            }
                        }
                        this.buildLevel2Type();
                    } else {
                        console.log(resp);
                        util.showAlert(resp.message || '查询中图分类出错，请稍后重试！');
                    }
                }.bind(this),
                error: function (xhr) {

                }
            });
        },
        /**
         * 初始化图书类别
         */
        searchBookSort: function () {
            util.sendRequest({
                data: {
                    'code': '0031'
                },
                action: 'common/searchCodeValue.action',
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        var $typeOneElement = this.$('select[data-type = "machineBook"]'),
                            $dom;
                        for (var i in resp.data) {
                            if (resp.data.hasOwnProperty(i)) {
                                $dom = $('<option></option>');
                                $dom.text(resp.data[i]);
                                $dom.val(i);
                                if (i === that.data.info.topicDetailKind) {
                                    $dom.attr('selected', 'selected');
                                }
                                $typeOneElement.append($dom);
                            }
                        }
                    } else {
                        console.log(resp);
                        util.showAlert(resp.message || '查询图书种类出错，请稍后重试！');
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
            var topicName = this.$('input[name="topicDetailName"]').val();
            if (!topicName) {
                util.showAlert('请输入选题名称！');
                return;
            }
            util.showLoading();
            util.sendRequest({
                action: 'topic/searchSimilarName.action',
                data: {
                    topicName: topicName,
                    topicId: that.data.info.topicId
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
                                html += '<p>《' + util.htmlEncode(list[i].topicName) + '》</p>';
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
                        if (i === that.data.info.topicDetailTwoKind) {
                            $dom.attr('selected', 'selected');
                        }
                        $typeTwoElement.append($dom);
                    }
                }
            }
        },

        /**
         * 获取选题类型
         */
        getTopicType: function () {
            var that = this;
            util.sendRequest({
                data: {code: '0003'},
                action: 'common/searchCodeValue.action',
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        var topicTypeHtml = '';
                        for (var k in resp.data) {
                            if (!resp.data.hasOwnProperty(k)) {  // 建议加上判断,如果没有扩展对象属性可以不加
                                continue;
                            }
                            topicTypeHtml +=
                                "<label class='checkbox-inline'>" +
                                "<input type='checkbox' name='topicDetailType' value='" + k + "' data-fv-choice='true' data-fv-choice-min='1' data-fv-choice-max='" +
                                Object.getOwnPropertyNames(resp.data).length + "' data-fv-choice-message='请选择1~" + Object.getOwnPropertyNames(resp.data).length + "个类型'" +
                                (that.data.info.topicDetailType && that.data.info.topicDetailType.indexOf(k) >= 0 ? " checked" : "") +
                                " />" + resp.data[k] +
                                "</label>";
                        }
                        that.$("#topicType").html(topicTypeHtml);
                        that.$("input[name='topicDetailType']").each(function () {
                            that.addValidateField($(this));
                        });
                        that.checkTopicType1();
                    } else {
                        console.log(resp);
                        util.showAlert(resp.message || '查询选题类型出错，请稍后重试！');
                    }
                }.bind(this),
                error: function (xhr) {

                }
            });
        },

        /**
         * 盲文读物选中状态改变
         */
        checkTopicType1: function () {
            var that = this;
            var $parentDiv = this.$("div[name='changeableData']");
            // 必填
            if (this.$("input[name='topicDetailType'][value='1']").prop("checked")) {
                $parentDiv.find("input,textarea").each(function () {
                    $(this).attr("data-fv-notempty", "true");
                    that.addValidateField($(this));
                });
                $parentDiv.find("label").append("<span class='must'>*</span>");

            }
            // 清除必填
            else {
                $parentDiv.find("label").find("span").remove();
                $parentDiv.find("input,textarea").each(function () {
                    try {
                        that.resetValidateField($(this));
                        that.removeValidateField($(this));
                    } catch (e) {
                        // console.log(e);
                    }
                    $(this).removeAttr("data-fv-notempty");
                    that.addValidateField($(this));// 数字验证一直有
                });
            }
            $parentDiv.find('input[data-time="yearAndMonth"]').datetimepicker({
                format: 'YYYY-MM',
                locale: 'zh-cn',
                sideBySide: true
            });
        },

        /**
         * 判断添加删除按钮显示
         */
        changeAddAndRemoveButton: function () {
            this.$(".changeableRow").each(function () {
                var length = $(this).children().length;
                if (length === 1) {
                    $(this).find("button[name='removeRow']").hide();
                    $(this).find("button[name='addRow']").show();
                } else {
                    $(this).find("button[name='removeRow']").show();
                    $(this).find("button[name='addRow']").hide();
                    $(this).find("button[name='addRow']").last().show();
                }
            });
        },

        /**
         * 加载作者信息列表和出版时间版次列表数据，放在changeAddAndRemoveButton前边
         */
        fillArrayData: function () {
            // 作者信息列表
            var $parentDiv = this.$("div[name='authorArray']");
            if (this.data.info.topicDetailOldAuthor) {
                var authorArray = this.data.info.topicDetailOldAuthor.split(","), wayArray = this.data.info.topicDetailWorkWay.split(","), roleArray = this.data.info.topicDetailAuthorRole.split(",");
                for (var i = 0; i < authorArray.length; i++) {
                    var $child;
                    if (this.data.isEdit) {
                        $child = $(authorEditTpl);
                        $child.find("input[name='topicDetailOldAuthor']").val(authorArray[i]);
                        $child.find("input[name='topicDetailWorkWay']").val(wayArray[i]);
                        $child.find("input[name='topicDetailAuthorRole']").val(roleArray[i]);
                    } else {
                        $child = $(authorViewTpl);
                        $child.find("p[data-name='topicDetailOldAuthor']").text(authorArray[i]);
                        $child.find("p[data-name='topicDetailWorkWay']").text(wayArray[i]);
                        $child.find("p[data-name='topicDetailAuthorRole']").text(roleArray[i]);
                    }
                    $parentDiv.append($child);
                }
            } else if (this.data.isEdit) {
                $parentDiv.append(authorEditTpl);
            }
            // 出版时间和版次列表
            var $parentDivB = this.$("div[name='dateAndVersionArray']");
            if (this.data.info.topicDetailOldPublicationDate) {
                var dateArray = this.data.info.topicDetailOldPublicationDate.split(","), versionArray = this.data.info.topicDetailOldEdition.split(","),
                    numArray = this.data.info.topicDetailOldRevision.split(",");
                for (var k = 0; k < dateArray.length; k++) {
                    var $childB;
                    if (this.data.isEdit) {
                        $childB = $(dateAndVersionEditTpl);
                        $childB.find("input[name='topicDetailOldPublicationDate']").val(dateArray[k]);
                        $childB.find("input[name='topicDetailOldEdition']").val(versionArray[k]);
                        $childB.find("input[name='topicDetailOldRevision']").val(numArray[k]);
                    } else {
                        $childB = $(dateAndVersionViewTpl);
                        $childB.find("p[data-name='topicDetailOldPublicationDate']").text(dateArray[k]);
                        $childB.find("p[data-name='topicDetailOldEdition']").text(versionArray[k] + "版");
                        $childB.find("p[data-name='topicDetailOldRevision']").text(numArray[k] + "次");
                    }
                    $parentDivB.append($childB);
                }
            } else if (this.data.isEdit) {
                $parentDivB.append(dateAndVersionEditTpl);
            }
            if (this.data.isEdit) {
                var $children = $parentDivB.children();
                $children.find('input[data-time="yearAndMonth"]').datetimepicker({
                    format: 'YYYY-MM',
                    locale: 'zh-cn',
                    sideBySide: true
                });
                var notEmpty = that.$("input[name='topicDetailType'][value='1']").prop("checked");
                $children.each(function () {
                    that.addValidateField($(this));
                    if (notEmpty) {
                        $(this).find("input").attr("data-fv-notempty", "true");
                    } else {
                        $(this).find("input").removeAttr("data-fv-notempty");
                        $(this).find(".has-error").removeClass("has-error");
                        $(this).find("small,span").remove();
                    }
                });
                // 重置按钮显示
                this.changeAddAndRemoveButton();
            }
        },

        getFormData: function () {
            var params = this._super();
            // 作者信息列表
            var author = "", way = "", role = "";
            var idx = 0;
            this.$("div[name='authorArray']").children().each(function () {
                author += (idx === 0 ? "" : ",") + $(this).find("input[name='topicDetailOldAuthor']").val();
                way += (idx === 0 ? "" : ",") + $(this).find("input[name='topicDetailWorkWay']").val();
                role += (idx === 0 ? "" : ",") + $(this).find("input[name='topicDetailAuthorRole']").val();
                idx++;
            });
            params.topicDetailOldAuthor = author;
            params.topicDetailWorkWay = way;
            params.topicDetailAuthorRole = role;
            // 原书出版时间及版次列表
            var date = "", version = "", num = "";
            idx = 0;
            this.$("div[name='dateAndVersionArray']").children().each(function () {
                date += (idx === 0 ? "" : ",") + $(this).find("input[name='topicDetailOldPublicationDate']").val();
                version += (idx === 0 ? "" : ",") + $(this).find("input[name='topicDetailOldEdition']").val();
                num += (idx === 0 ? "" : ",") + $(this).find("input[name='topicDetailOldRevision']").val();
                idx++;
            });
            params.topicDetailOldPublicationDate = date;
            params.topicDetailOldEdition = version;
            params.topicDetailOldRevision = num;
            return params;
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            // 选题查重
            this.$container.on('click', '#btnTopicSimilar', this.searchSimilarName.bind(this));

            // 选题类型子类
            this.$container.on('change', '#bookTopicOne', this.buildLevel2Type.bind(this));

            // 盲文读物选中状态改变
            this.$container.on('change', "input[name='topicDetailType'][value='1']", this.checkTopicType1.bind(this));

            var that = this;
            // 添加行
            this.$container.on("click", "button[name='addRow']", function () {
                var $parentDiv = $(this).parents(".changeableRow");
                var $child = $parentDiv.children().first().clone();
                $child.find('input').val('');
                $child.find(".has-error").removeClass("has-error");
                $child.find("small").remove();
                $parentDiv.append($child);
                that.changeAddAndRemoveButton();
                // 出版时间和版次会有时间输入框，并且根据类型选项来确认是否添加验证
                if ($parentDiv.parents("div[name='changeableData']").length > 0) {
                    var $row = $parentDiv.children().last();
                    $row.find('input[data-time="yearAndMonth"]').datetimepicker({
                        format: 'YYYY-MM',
                        locale: 'zh-cn',
                        sideBySide: true
                    });
                    if (that.$("input[name='topicDetailType'][value='1']").prop("checked")) {
                        $row.find("input").each(function () {
                            that.addValidateField($(this));
                            $(this).attr("data-fv-notempty", "true");
                        });
                    } else {
                        $row.find("input").removeAttr("data-fv-notempty");
                        $row.find(".has-error").removeClass("has-error");
                        $row.find("small,span").remove();
                    }
                }
            });
            // 删除行
            this.$container.on("click", "button[name='removeRow']", function () {
                $(this).parents(".row").first().remove();
                that.changeAddAndRemoveButton();
            });
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
            this.initValidate();
            // 初始化日期组件
            this.$('input[data-time="other"]').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: 'zh-cn',
                sideBySide: true
            });
            this.$('input[data-time="yearAndMonth"]').datetimepicker({
                format: 'YYYY-MM',
                locale: 'zh-cn',
                sideBySide: true
            });

            this.searchBookType();
            this.searchBookSort();

            this.getTopicType();

            this.fillArrayData();
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