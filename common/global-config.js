define(function (require, exports, module) {
    "use strict";

    var config = {
        // 初始化时默认加载的页面
        defaultModule: 'dashboard/dashboard',
        // 顶部导航菜单
        menu: [
            {
                title: '选题管理',
                auth: '02',
                icon: 'fa fa-book',
                dashboard: true,
                items: [
                    {
                        title: '选题申报管理',
                        auth: '021',
                        dashboard: true,
                        href: 'topic/topic-manage/topic-manage'
                    },
                    {
                        title: '上报选题',
                        auth: '022',
                        dashboard: true,
                        href: 'topic/topic-report/topic-report'
                    },
                    {
                        title: '选题大会',
                        auth: '023',
                        dashboard: true,
                        href: 'topic/topic-conference/topic-conference'
                    },
                    {
                        title: '选题备案',
                        auth: '024',
                        dashboard: true,
                        href: 'topic/topic-record/topic-record'
                    }
                ]
            },
            {
                title: '盲文读物管理',
                auth: '03',
                icon: 'fa fa-braille',
                dashboard: true,
                items: [
                    {
                        title: '审稿',
                        auth: '031',
                        dashboard: true,
                        href: 'braille/review/braille-review'
                    },
                    {
                        title: '译校通读众包管理',
                        auth: '032',
                        dashboard: false,
                        href: 'braille/crowd-source/crowdSource-manage'
                    },
                    {
                        title: '译校通读管理',
                        auth: '033',
                        dashboard: true,
                        href: 'braille/translation-proofreading/tprt-manage'
                    },
                    {
                        title: '印前质检',
                        auth: '034',
                        dashboard: true,
                        href: 'braille/pre-press-qc/qc-manage'
                    },
                    {
                        title: '书号和CIP号申请',
                        auth: '035',
                        dashboard: true,
                        href: 'braille/cip-apply/cip-apply'
                    },
                    {
                        title: '变更备案',
                        auth: '037',
                        dashboard: true,
                        href: 'braille/change-record/change-record'
                    },
                    {
                        title: '清样稿管理',
                        auth: '038',
                        dashboard: true,
                        href: 'braille/original-copy/original-copy-manage'
                    },
                    {
                        title: '图书印制单审核管理',
                        auth: '039',
                        dashboard: true,
                        href: 'braille/print-audit/print-audit-manage'
                    },

                    {
                        title: '清样稿印制',
                        auth: '03a',
                        dashboard: true,
                        href: 'braille/sample-print/sample-print'
                    },
                    {
                        title: '印刷管理',
                        auth: '03b',
                        dashboard: true,
                        href: 'braille/print-manage/print-manage'
                    },
                    {
                        title: '封面设计及印刷',
                        auth: '03c',
                        dashboard: true,
                        href: 'braille/cover-design/cover-design'
                    },
                    {
                        title: '备案登记',
                        auth: '03d',
                        dashboard: true,
                        href: 'braille/registration-records/registration-records'
                    },
                    {
                        title: '重印管理',
                        auth: '03f',
                        dashboard: true,
                        href: 'braille/reprint/reprint'
                    },
                    {
                        title: '重印审核管理',
                        auth: '03g',
                        dashboard: true,
                        href: 'braille/reprint-audit/reprint-audit'
                    },
                    {
                        title: '报表统计',
                        auth: '03e',
                        dashboard: true,
                        href: 'braille/braille-statistical/braille-statistical'
                    }
                ]
            },
            {
                title: '总编室管理',
                auth: '04',
                dashboard: true,
                icon: 'fa fa-sitemap',
                items: [
                    {
                        title: '书号和cip号版署申请',
                        auth: '041',
                        dashboard: true,
                        href: 'manage/cip-version/cip-version'
                    },
                    {
                        title: '图书季报',
                        auth: '042',
                        dashboard: true,
                        href: 'manage/book-report-forms/book-report-forms-manage'
                    },
                    {
                        title: '出版计划上报',
                        auth: '043',
                        dashboard: true,
                        href: 'manage/publish-plan/publish-plan'
                    }
                ]
            },
            {
                title: '汉文读物管理',
                auth: '05',
                icon: 'fa fa-language',
                dashboard: true,
                items: [
                    {
                        title: '合同录入',
                        auth: '051',
                        dashboard: true,
                        href: 'chinese/contract-input/contract-input'
                    },
                    {
                        title: '图书排版',
                        auth: '052',
                        dashboard: true,
                        href: 'chinese/type-setting/ts-manage'
                    },
                    {
                        title: '审稿',
                        auth: '053',
                        dashboard: true,
                        href: 'chinese/review/chinese-review'
                    },
                    {
                        title: '校对',
                        auth: '054',
                        dashboard: true,
                        href: 'chinese/proofread/proofread-manage'
                    },
                    {
                        title: '书号和CIP申请',
                        auth: '055',
                        dashboard: true,
                        href: 'chinese/cip-apply/cip-apply'
                    },
                    {
                        title: '成本预算',
                        auth: '056',
                        dashboard: true,
                        href: 'chinese/cost-budget/cost-budget-manage'
                    },
                    {
                        title: '变更备案',
                        auth: '057',
                        dashboard: true,
                        href: 'chinese/change-record/change-record'
                    },
                    {
                        title: '封面设计',
                        auth: '058',
                        dashboard: true,
                        href: 'chinese/cover-design/cover-design'
                    },
                    {
                        title: '版权页设计',
                        auth: '05g',
                        dashboard: true,
                        href: 'chinese/cover-copyright-design/cover-design'
                    },
                    {
                        title: '印前质检',
                        auth: '059',
                        dashboard: true,
                        href: 'chinese/pre-press-qc/pre-press-qc-manage'
                    },
                    {
                        title: '发印及生产管理',
                        auth: '05a',
                        dashboard: true,
                        href: 'chinese/produce-manage/produce-manage'
                    },
                    {
                        title: '快印管理',
                        auth: '05b',
                        dashboard: true,
                        href: 'chinese/print-manage/print-manage'
                    },
                    {
                        title: '再版重印管理',
                        auth: '05h',
                        dashboard: true,
                        href: 'chinese/reprint/reprint'
                    },
                    // {
                    //     title: '报表设计',
                    //     auth: '',
                    //     dashboard: true,
                    //     href: ''
                    // },
                    {
                        title: '稿酬与版税管理',
                        auth: '05d',
                        dashboard: true,
                        href: 'chinese/remuneration-apply/remuneration-apply'
                    },
                    {
                        title: '劳务管理',
                        auth: '05e',
                        dashboard: true,
                        href: 'chinese/labor-management/labor-management'
                    },
                    {
                        title: '样书管理',
                        auth: '05f',
                        dashboard: true,
                        href: 'chinese/book-manage/book-manage'
                    }
                ]
            },
            {
                title: '出版管理',
                icon: 'fa fa-print',
                dashboard: true,
                items: [
                    {
                        title: '再版重印管理',
                        dashboard: true,
                        href: ''
                    }
                    // {
                    //     title: '生产管理',
                    //     href: ''
                    // },
                    // {
                    //     title: '物资采购',
                    //     href: ''
                    // },
                    // {
                    //     title: '物资管理',
                    //     href: ''
                    // },
                    // {
                    //     title: '物资出库',
                    //     href: ''
                    // }
                ]
            },
            {
                title: '资源库',
                auth: '06',
                icon: 'fa fa-database',
                dashboard: false,
                items: [
                    {
                        title: '选题库',
                        auth: '061',
                        dashboard: false,
                        href: 'resource/topic-library/topic-library'
                    },
                    {
                        title: '版权合同库',
                        auth: '062',
                        dashboard: false,
                        href: 'resource/copyright-contract/copyright-contract'
                    },
                    {
                        title: '合同模板管理',
                        auth: '063',
                        dashboard: false,
                        href: 'resource/contract-template/contract-template-manage'
                    },
                    {
                        title: '工作库记录',
                        auth: '064',
                        dashboard: false,
                        href: 'resource/work-record/work-record'
                    },
                    {
                        title: '合同库',
                        dashboard: false,
                        href: ''
                    },
                    {
                        title: '电子书稿库',
                        dashboard: false,
                        href: ''
                    },
                    {
                        title: '汉盲语料库',
                        dashboard: false,
                        href: ''
                    },
                    {
                        title: '图书库',
						auth: '065',
                        dashboard: false,
                        href: 'resource/library/library'
                    }
                ]
            },
            {
                title: '系统管理',
                auth: '01',
                icon: 'fa fa-cogs',
                items: [
                    {
                        title: '人员管理',
                        auth: '011',
                        href: 'system/person/person-manage'
                    },
                    {
                        title: '培训管理',
                        auth: '012',
                        href: 'system/train/train-manage'
                    },
                    {
                        title: '角色管理',
                        auth: '013',
                        href: 'system/role/role-manage'
                    },
                    {
                        title: '部门管理',
                        auth: '014',
                        href: 'system/department/department-manage'
                    },
                    {
                        title: '字典管理',
                        auth: '015',
                        href: 'system/dictionary/dictionary-manage'
                    },
                    {
                        title: '日志管理',
                        auth: '016',
                        href: 'system/logs/logs-manage'
                    }
                ]
            }

        ]
    };

    module.exports = config;
});