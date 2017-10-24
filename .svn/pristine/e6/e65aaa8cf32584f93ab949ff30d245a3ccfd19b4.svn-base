define(function (require, exports, module) {
    "use strict";

    var ItemBase = require('../item-base');

    /**
     * Workflow Item
     */
    module.exports = ItemBase.extend({
        // 保存/提交接口
        saveAction: 'cost/saveOrSubmitCost.action',
        // 批量保存/提交接口
        batchSaveAction: '',
        // 查询接口
        detailAction: 'cost/searchCostDetail.action',

        /**
         * 计算定价
         */
        caculatePrice: function () {
            var price = 0;
            // 组稿数量*组稿种类标准
            var hPrintCostNum = parseFloat(this.$("input[name='hPrintCostNum']").val());
            if (hPrintCostNum) {
                var hPrintCostType = this.$("select[name='hPrintCostType']").val();
                var hPrintCostTypeValue = parseFloat(
                    hPrintCostType === '0' ? this.data.info.costSetList[0].numberGroup :
                        (hPrintCostType === '1' ? this.data.info.costSetList[0].numberMarket :
                            (hPrintCostType === '2' ? this.data.info.costSetList[0].numberLargePrint : '')));
                if (hPrintCostTypeValue) {
                    price += hPrintCostNum * hPrintCostTypeValue;
                }
            }
            // 一审工作量*一审种类标准
            var firstAWorkload = parseFloat(this.$("input[name='firstAWorkload']").val());
            var firstBWorkload = parseFloat(this.$("input[name='firstBWorkload']").val());
            if (firstAWorkload) {
                var firstTypeA = this.$("select[name='firstType']").val();
                var firstTypeValueA = parseFloat(
                    firstTypeA === '0' ? this.data.info.costSetList[0].firstAuditOne :
                        (firstTypeA === '1' ? this.data.info.costSetList[0].firstAuditTwo :
                            (firstTypeA === '2' ? this.data.info.costSetList[0].firstAuditThree : '')));
                if (firstTypeValueA) {
                    price += firstAWorkload * firstTypeValueA;
                }
            }
            if (firstBWorkload) {
                var firstTypeB = this.$("select[name='firstType']").val();
                var firstTypeValueB = parseFloat(
                    firstTypeB === '0' ? this.data.info.costSetList[1].firstAuditOne :
                        (firstTypeB === '1' ? this.data.info.costSetList[1].firstAuditTwo :
                            (firstTypeB === '2' ? this.data.info.costSetList[1].firstAuditThree : '')));
                if (firstTypeValueB) {
                    price += firstBWorkload * firstTypeValueB;
                }
            }
            // 二审工作量*二审种类标准
            var secondAWorkload = parseFloat(this.$("input[name='secondAWorkload']").val());
            var secondBWorkload = parseFloat(this.$("input[name='secondBWorkload']").val());
            if (secondAWorkload) {
                var secondTypeA = this.$("select[name='secondType']").val();
                var secondTypeValueA = parseFloat(
                    secondTypeA === '0' ? this.data.info.costSetList[0].secondAuditOne :
                        (secondTypeA === '1' ? this.data.info.costSetList[0].secondAuditTwo :
                            (secondTypeA === '2' ? this.data.info.costSetList[0].secondAuditThree : '')));
                if (secondTypeValueA) {
                    price += secondAWorkload * secondTypeValueA;
                }
            }
            if (secondBWorkload) {
                var secondTypeB = this.$("select[name='secondType']").val();
                var secondTypeValueB = parseFloat(
                    secondTypeB === '0' ? this.data.info.costSetList[1].secondAuditOne :
                        (secondTypeB === '1' ? this.data.info.costSetList[1].secondAuditTwo :
                            (secondTypeB === '2' ? this.data.info.costSetList[1].secondAuditThree : '')));
                if (secondTypeValueB) {
                    price += secondBWorkload * secondTypeValueB;
                }
            }
            // 三审工作量*三审标准
            var thirdAWorkload = parseFloat(this.$("input[name='thirdAWorkload']").val());
            var thirdBWorkload = parseFloat(this.$("input[name='thirdBWorkload']").val());
            if (thirdAWorkload) {
                var thirdAWorkloadValue = parseFloat(this.data.info.costSetList[0].thirdAudit);
                if (thirdAWorkloadValue) {
                    price += thirdAWorkload * thirdAWorkloadValue;
                }
            }
            if (thirdBWorkload) {
                var thirdBWorkloadValue = parseFloat(this.data.info.costSetList[1].thirdAudit);
                if (thirdBWorkloadValue) {
                    price += thirdBWorkload * thirdBWorkloadValue;
                }
            }
            // 封面设计工作量*封面设计标准
            var aCoverWorkload = parseFloat(this.$("input[name='aCoverWorkload']").val());
            var bCoverWorkload = parseFloat(this.$("input[name='bCoverWorkload']").val());
            if (aCoverWorkload) {
                var aCoverWorkloadValue = parseFloat(this.data.info.costSetList[0].coverDesign);
                if (aCoverWorkloadValue) {
                    price += aCoverWorkload * aCoverWorkloadValue;
                }
            }
            if (bCoverWorkload) {
                var bCoverWorkloadValue = parseFloat(this.data.info.costSetList[1].coverDesign);
                if (bCoverWorkloadValue) {
                    price += bCoverWorkload * bCoverWorkloadValue;
                }
            }
            // 质检工作量*质检标准
            var checkWorkload = this.$("input[name='checkWorkload']").val();
            if (checkWorkload) {
                var checkWorkloadValue = parseFloat(this.data.info.costSetList[0].costSetCheck);
                if (checkWorkloadValue) {
                    price += checkWorkload * checkWorkloadValue;
                }
            }
            // 编务工作量*编务标准
            var editingAffairsNum = parseFloat(this.$("input[name='editingAffairsNum']").val());
            if (editingAffairsNum) {
                var editingAffairsNumValue = parseFloat(this.data.info.costSetList[0].editingAffairsCost);
                if (editingAffairsNumValue) {
                    price += editingAffairsNum * editingAffairsNumValue;
                }
            }
            // 印制成本
            var printCost = parseFloat(this.data.info.cnPrintCostEntity.printCost);
            if (printCost) {
                price += printCost;
            }
            // 印数
            var printNum = parseFloat(this.data.info.cnPrintCostEntity.printNum);
            if (printNum) {
                price /= printNum;
            }
            // 版税率
            var royaltyRate = parseFloat(this.$("input[name='royaltyRate']").val());
            if (royaltyRate && royaltyRate < 0.25) {
                price /= (0.25 - royaltyRate);
            }
            // 最终数+1
            price += 1;
            // 定价
            this.$("input[name='price']").val(price.toFixed(2));
            // 计算作者稿酬
            this.caculateRemuneration();
        },

        /**
         * 计算作者稿酬
         */
        caculateRemuneration: function () {
            var authorPayment = 0;
            // 印数
            var printNum = parseFloat(this.data.info.cnPrintCostEntity.printNum);
            if (printNum) {
                authorPayment = printNum;
            }
            // 原始定价
            var price = parseFloat(this.$("input[name='price']").val());
            if (price) {
                if (authorPayment === 0) {
                    authorPayment = price;
                } else {
                    authorPayment *= price;
                }
            }
            // 版税率
            var royaltyRate = parseFloat(this.$("input[name='royaltyRate']").val());
            if (royaltyRate) {
                if (authorPayment === 0) {
                    authorPayment = royaltyRate;
                } else {
                    authorPayment *= royaltyRate;
                }
            }
            // 作者稿酬
            this.$("input[name='authorPayment']").val(authorPayment.toFixed(2));
        },

        /**
         * 生成参数
         */
        getFormData: function () {
            var params = this._super();
            params.cnPrintCostEntity = $.extend({}, params);
            return params;
        },

        /**
         * 初始化页面事件
         */
        initPageEvent: function () {
            // 定价相关输入和选择监听（版税率改变后定价也改变，所以直接把计算稿酬的调用放到计算定价方法里边了，不用单独设置版税率改变重新计算稿酬的监听）
            this.$container.on('change', "select[name='hPrintCostType'],select[name='firstType'],select[name='secondType']", this.caculatePrice.bind(this));
            var inputTarget = "input[name='royaltyRate'],input[name='hPrintCostNum'],input[name='firstAWorkload'],input[name='firstBWorkload'],input[name='secondAWorkload'],input[name='secondBWorkload']," +
                "input[name='thirdAWorkload'],input[name='thirdBWorkload'],input[name='aCoverWorkload'],input[name='bCoverWorkload'],input[name='checkWorkload'],input[name='editingAffairsNum']";
            this.$container.on('input', inputTarget, this.caculatePrice.bind(this));
        },

        /**
         * 初始化页面数据
         */
        initPageData: function () {
            this.caculatePrice();
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
});