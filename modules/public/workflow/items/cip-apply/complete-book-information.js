define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');
    var util = require('../../../../../common/util.js');
    var dateAndVersionEditTpl =
        "<div class='row'>" +
        "  <div class='col-xs-10' style='width: 88%;'>" +
        "    <div class='col-xs-4'>" +
        "      <div class='form-group'>" +
        "        <input style='width: 80%;' data-time='yearAndMonth' class='form-control date-time' maxlength='7' name='bookDetailPublicationDate' placeholder='年月'/>" +
        "      </div>" +
        "    </div>" +
        "    <div class='col-xs-4'>" +
        "      <div class='form-group'>" +
        "        <input style='width: 80%;' class='form-control' name='bookDetailEdition' placeholder='版' maxlength='8'/>" +
        "        版" +
        "      </div>" +
        "    </div>" +
        "    <div class='col-xs-4'>" +
        "      <div class='form-group'>" +
        "        <input style='width: 80%;' class='form-control' name='bookDetailOldRevision' placeholder='次' maxlength='8'/>" +
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
        "        <p class='form-control-static' data-name='bookDetailPublicationDate'></p>" +
        "      </div>" +
        "    </div>" +
        "    <div class='col-xs-4'>" +
        "      <div class='form-group'>" +
        "        <p class='form-control-static' data-name='bookDetailEdition'></p>" +
        "      </div>" +
        "    </div>" +
        "    <div class='col-xs-4'>" +
        "      <div class='form-group'>" +
        "        <p class='form-control-static' data-name='bookDetailOldRevision'></p>" +
        "      </div>" +
        "    </div>" +
        "  </div>" +
        "</div>";
    /**
     * Workflow Item
     */
    var Item = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'cipApply/saveOrSubmitApply.action',

        // 查询接口
        detailAction: 'cipApply/searchApplyDetail.action',

        onHandleChange: function () {
            var price = this.$('input[name="bookPrice"]').val();
            var bPrice=parseFloat(price).toFixed(2);
            if(isNaN(bPrice)){
                bPrice='';
            }
            this.$('input[name="bookPrice"]').val(bPrice);
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
        // 判断有几条电话
        searchButtonNum: function() {
            var phoneLength = this.$('.form-horizontal .phone-number').length;
            if (phoneLength !== 1) {
                this.$('.form-horizontal button[data-type="phone-minus"]').show();
                this.$('.form-horizontal button[data-type="phone-plus"]').hide();
                this.$('.form-horizontal button[data-type="phone-plus"]').last().show();
            } else{
                this.$('.form-horizontal button[data-type="phone-minus"]').hide();
                this.$('.form-horizontal button[data-type="phone-plus"]').show();
            }
        },
        fillArrayData: function () {
            // 出版时间和版次列表
            var $parentDivB = this.$("div[name='dateAndVersionArray']");
            if (this.data.info.bookDetailPublicationDate) {
                var dateArray = this.data.info.bookDetailPublicationDate.split(","), versionArray = this.data.info.bookDetailEdition.split(","),
                    numArray = this.data.info.bookDetailOldRevision.split(",");
                for (var k = 0; k < dateArray.length; k++) {
                    var $childB;
                    if (this.data.isEdit) {
                        $childB = $(dateAndVersionEditTpl);
                        $childB.find("input[name='bookDetailPublicationDate']").val(dateArray[k]);
                        $childB.find("input[name='bookDetailEdition']").val(versionArray[k]);
                        $childB.find("input[name='bookDetailOldRevision']").val(numArray[k]);
                    } else {
                        $childB = $(dateAndVersionViewTpl);
                        $childB.find("p[data-name='bookDetailPublicationDate']").text(dateArray[k]);
                        $childB.find("p[data-name='bookDetailEdition']").text(versionArray[k] + "版");
                        $childB.find("p[data-name='bookDetailOldRevision']").text(numArray[k] + "次");
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
                // 重置按钮显示
                this.changeAddAndRemoveButton();
            }
        },

        getFormData: function () {
            var $form = this.$('.form-horizontal');
            var params = this._super();
            var idx = 0;
            // 原书出版时间及版次列表
            var date = "", version = "", num = "";
            this.$("div[name='dateAndVersionArray']").children().each(function () {
                date += (idx === 0 ? "" : ",") + $(this).find("input[name='bookDetailPublicationDate']").val();
                version += (idx === 0 ? "" : ",") + $(this).find("input[name='bookDetailEdition']").val();
                num += (idx === 0 ? "" : ",") + $(this).find("input[name='bookDetailOldRevision']").val();
                idx++;
            });
            params.bookDetailPublicationDate = date;
            params.bookDetailEdition = version;
            params.bookDetailOldRevision = num;
            // 处理上传部份数据结构
            var arrAddress=[];
            $form.find('.phone-number').each(function(){
                var $el=$(this)
                arrAddress.push($el.val());
            });
            params.phoneList=arrAddress;
            return params;
        },
        

        // 添加电话
        onWorkContentPlus: function($dwp) {
            var workRow = this.$('#phoneTemplate').html();
            $dwp.parents('.phoneList').append(workRow);
            this.searchButtonNum();
        },
        // 删除电话
        onWorkContentMinus: function($dwp) {
            $dwp.parents('.addphone').remove();
            this.searchButtonNum();
        },
        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            var that = this;

            this.$container.on('change', 'input[name="bookPrice"]', this.onHandleChange.bind(this));
            // 添加工作量
            this.$container.on('click', 'button[data-type="phone-plus"]', function() {
                that.onWorkContentPlus($(this));
            });
            // 删除工作量
            this.$container.on('click', 'button[data-type="phone-minus"]', function() {
                that.onWorkContentMinus($(this));
            });
            this.$container.on("click", "button[name='addRow']", function () {
                var $parentDiv = $(this).parents(".changeableRow");
                var $child = $parentDiv.children().first().clone();
                $child.find('input').val('');
                $child.find(".has-error").removeClass("has-error");
                $child.find("small").remove();
                $parentDiv.append($child);
                that.changeAddAndRemoveButton();
                // 出版时间和版次会有时间输入框，并且根据类型选项来确认是否添加验证
                var $row = $parentDiv.children().last();
                $row.find('input[data-time="yearAndMonth"]').datetimepicker({
                    format: 'YYYY-MM',
                    locale: 'zh-cn',
                    sideBySide: true
                });
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
            //  页面加载完后对加减按钮进行操作
            this.searchButtonNum();
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

            this.initPageEvent();

            this.initPageData();
        },

    });


    module.exports = Item;

});

