define(function (require, exports, module) {
    "use strict";

    module.exports = {
        /* 选题申报 */
        // 选题申报
        'brailleTopicDeclare': 'topic-manage/topic-manage-create',
        // 部门负责人审核
        'brailleEditorialTrial': 'topic-manage/topic-manage-principal',
        // 总编辑/副总编辑审批意见
        'brailleChiefEditorTrial': 'topic-manage/topic-manage-chief',
        // 选题上报信息
        'brailleTopicReport': 'topic-manage/topic-manage-report',
        // 选题大会信息
        'brailleTopicConference': 'topic-manage/topic-manage-conference',
        // 待定确认
        'braillePend': 'topic-manage/topic-manage-hold',

        /* 选题备案 */
        // 选题备案新增
        'topicRecordCreate': 'topic-record/topic-record-create',
        // 重大选题备案登记表
        'bigTopicRecordRegister': 'topic-record/import-topic-register',
        // 重大部门负责人审核意见
        'bigBrailleEditorialTrial': 'topic-record/topic-record-principal',
        // 重大副总编辑审核
        'bigBrailleChiefEditorTrialDeputy': 'topic-record/topic-record-deputy',
        // 重大总编辑审核
        'bigBrailleChiefEditorTrial': 'topic-record/topic-record-chief',
        // 重大上报版署
        'bigReportBureauPublication': 'topic-record/topic-record-report',
        // 重大备案登记
        'bigRecordRegister': 'topic-record/import-topic-copy',
        // 引进选题备案登记表
        'importTopicRecordRegister': 'topic-record/cite-topic-register',
        // 引进部门负责人审核意见
        'importBrailleEditorialTrial': 'topic-record/topic-record-principal',
        // 引进副总编辑审核
        'importBrailleChiefEditorTrialDeputy': 'topic-record/topic-record-deputy',
        // 引进总编辑审核
        'importBrailleChiefEditorTrial': 'topic-record/topic-record-chief',
        // 引进备案登记
        'importRecordRegister': 'topic-record/cite-topic-copy',

        /* 盲文审稿 */
        // 部门负责人下发
        'deptIssued': 'review/review-principal',
        // 初审
        'firstAudit': 'review/review-first',
        // 再次初审
        'otherFirstAudit': 'review/review-first',
        // 复审
        'secondAudit': 'review/review-second',
        // 终审
        'finalAudit': 'review/review-final',
        // 上传电子书稿
        'uploadEbook': 'review/review-ebook',


        /******************************************************译校通读******************************************************/
        // 任务分配
        'taskAllocation': 'translation-proofreading/task-assignment',
        // 译录任务接受
        'translationTaskLead': 'translation-proofreading/task-acception',
        // 一校任务接受
        'firstProofreaTaskLead': 'translation-proofreading/task-acception',
        // 二校任务接受
        'secondProofreaTaskLead': 'translation-proofreading/task-acception',
        // 三校任务接受
        'thirdProofreaTaskLead': 'translation-proofreading/task-acception',
        // 二次三校任务接受
        'otherThirdProofreaTaskLead': 'translation-proofreading/task-acception',
        // 通读任务接受
        'readTaskLead': 'translation-proofreading/task-acception',
        // 译录书稿归还确认
        'translationReturnBook': 'translation-proofreading/tprt-manuscript-returning',
        // 一校书稿归还确认
        'firstProofreadReturnBook': 'translation-proofreading/tprt-manuscript-returning',
        // 二校书稿归还确认
        'secondProofreadReturnBook': 'translation-proofreading/tprt-manuscript-returning',
        // 三校书稿归还确认
        'thirdProofreadReturnBook': 'translation-proofreading/tprt-manuscript-returning',
        // 二次三校书稿归还确认
        'otherThirdProofreadReturnBook': 'translation-proofreading/tprt-manuscript-returning',
        // 通读书稿归还确认
        'readReturnBook': 'translation-proofreading/tprt-manuscript-returning',
        // 译录接收书稿
        'translationAcceptBook': 'translation-proofreading/tprt-manuscript-acception',
        // 一校接收书稿
        'firstProofreadAcceptBook': 'translation-proofreading/tprt-manuscript-acception',
        // 二校接收书稿
        'secondProofreadAcceptBook': 'translation-proofreading/tprt-manuscript-acception',
        // 三校接收书稿
        'thirdProofreadAcceptBook': 'translation-proofreading/tprt-manuscript-acception',
        // 二次三校接收书稿
        'otherThirdProofreadAcceptBook': 'translation-proofreading/tprt-manuscript-acception',
        // 通读接收书稿
        'readAcceptBook': 'translation-proofreading/tprt-manuscript-acception',
        // 译录发送书稿
        'translationSendBook': 'translation-proofreading/te-manuscript-sending',
        // 一校发送书稿
        'firstProofreadSendBook': 'translation-proofreading/tprt-manuscript-sending',
        // 二校发送书稿
        'secondProofreadSendBook': 'translation-proofreading/tprt-manuscript-sending',
        // 三校发送书稿
        'thirdProofreadSendBook': 'translation-proofreading/tprt-manuscript-sending',
        // 二次三校发送书稿
        'otherThirdProofreadSendBook': 'translation-proofreading/tprt-manuscript-sending',
        // 通读发送书稿
        'readSendBook': 'translation-proofreading/tprt-manuscript-sending',
        // 译录
        'translationTranslation': 'translation-proofreading/tprt-translation-entering',
        // 一校
        'firstProofread': 'translation-proofreading/tprt-deal',
        // 二校
        'secondProofread': 'translation-proofreading/tprt-deal',
        // 三校
        'thirdProofread': 'translation-proofreading/tprt-deal',
        // 二次三校
        'otherThirdProofread': 'translation-proofreading/tprt-deal',
        // 通读
        'readRead': 'translation-proofreading/tprt-deal',
        // 一校正误表确认
        'firstProofreadRigthWrongConfirm': 'translation-proofreading/tprt-deal-confirmation',
        // 二校正误表确认
        'secondProofreadRigthWrongConfirm': 'translation-proofreading/tprt-deal-confirmation',
        // 三校正误表确认
        'thirdProofreadRigthWrongConfirm': 'translation-proofreading/tprt-deal-confirmation',
        // 二次三校正误表确认
        'otherThirdProofreadRigthWrongConfirm': 'translation-proofreading/tprt-deal-confirmation',
        // 通读正误表确认
        'readRigthWrongConfirm': 'translation-proofreading/tprt-deal-confirmation',
        // 一校正误表审核
        'firstProofreadRigthWrongAudit': 'translation-proofreading/tprt-deal-checking',
        // 二校正误表审核
        'secondProofreadRigthWrongAudit': 'translation-proofreading/tprt-deal-checking',
        // 三校正误表审核
        'thirdProofreadRigthWrongAudit': 'translation-proofreading/tprt-deal-checking',
        // 二次三校正误表审核
        'otherThirdProofreadRigthWrongAudit': 'translation-proofreading/tprt-deal-checking',
        // 通读正误表审核
        'readRigthWrongAudit': 'translation-proofreading/tprt-deal-checking',
        // 一校修改
        'firstProofreadModify': 'translation-proofreading/tprt-deal-modification',
        // 二校修改
        'secondProofreadModify': 'translation-proofreading/tprt-deal-modification',
        // 三校修改
        'thirdProofreadModify': 'translation-proofreading/tprt-deal-modification',
        // 二次三校修改
        'otherThirdProofreadModify': 'translation-proofreading/tprt-deal-modification',
        // 通读修改
        'readModify': 'translation-proofreading/tprt-deal-modification',


        /******************************************************印前质检******************************************************/
        // 收集书稿
        'qualityTestCollect': 'pre-press-qc/collecting',
        // 质检派发
        'qualityTestDistribute': 'pre-press-qc/sending',
        // 接收书稿
        'qualityTestAccept': 'pre-press-qc/manuscript-acception',
        // 质检
        'qualityTestQuality': 'pre-press-qc/qc',
        // 质检正误表确认
        'qualityTestRightConfirm': 'pre-press-qc/tf-confirmation',
        // 质检正误表审核
        'qualityTestRightAudit': 'pre-press-qc/tf-checking',
        // 质检修改
        'qualityTestModify': 'pre-press-qc/qc-modification',
        // 文稿归还确认
        'qualityTestReturn': 'pre-press-qc/manuscript-returning',
        // 质检审核
        'qualityTestAudit': 'pre-press-qc/qc-checking',

        /******************************************************汉文-成本预算******************************************************/
        // 印制信息填写
        'cn_writePrint': 'cn-cost-budget/print-info',
        // 印制成本计算
        'cn_printCostCalculation': 'cn-cost-budget/budget-caculation',
        // 编校印制成本核算
        'cn_printCostAccounting': 'cn-cost-budget/budget-checking',
        // 确认
        'cn_printCostConfirm': 'cn-cost-budget/confirmation',

        /******************************************************汉文-印前质检******************************************************/
        // 收集书稿
        'cn_qualityTestCollect': 'cn-pre-press-qc/collecting',
        // 派发
        'cn_qualityTestDistribute': 'cn-pre-press-qc/sending',
        // 质检
        'cn_qualityTestQuality': 'cn-pre-press-qc/qc',
        // 质检勘误表确认
        'cn_qualityTestErrataConfirm': 'cn-pre-press-qc/tf-confirmation',
        // 质检确认
        'cn_qualityTestConfirm': 'cn-pre-press-qc/qc-confirmation',
        // 质检审核
        'cn_qualityTestAudit': 'cn-pre-press-qc/qc-checking',
        // 质检改稿
        'cn_qualityTestModify': 'cn-pre-press-qc/qc-modification',
        // 质检核红
        'cn_qualityTestRedNucleus': 'cn-pre-press-qc/red-checking',
        // 质检核红改稿
        'cn_qualityTestRedOrProof': 'cn-pre-press-qc/red-checking-modification',
        // 封面修改
        'cn_qualityCoverModify': 'cn-pre-press-qc/cover-modification',
        // 确认书稿
        'cn_qualityTestLastSure': 'cn-pre-press-qc/confirmation',
        // 质检审稿
        'cn_qualityFirst': 'cn-pre-press-qc/qc-re-checking',
        // 质检审稿改稿
        'cn_qualityFirstRewirte': 'cn-pre-press-qc/qc-re-modification',
        // 质检审稿核红
        'cn_qualityFirstRedNucleus': 'cn-pre-press-qc/red-checking',
        // 质检审稿核红改稿或打样
        'cn_qualityFirstRedOrProof': 'cn-pre-press-qc/qc-re-red-checking-modification',
        // 质检校对
        'cn_qualityFirstProofreading': 'cn-pre-press-qc/qc-re-proofread',
        // 质检校对勘误表确认
        'cn_qualityFirstProofreadErrataConfirm': 'cn-pre-press-qc/qc-re-proofread-confirmation',
        // 质检校对改稿
        'cn_qualityFirstProofreadRewirte': 'cn-pre-press-qc/qc-re-modification',
        // 质检校对核红
        'cn_qualityFirstProofreadRedNucleus': 'cn-pre-press-qc/red-checking',
        // 质检校对核红改稿或打样
        'cn_qualityFirstProofreadRedOrProof': 'cn-pre-press-qc/qc-re-red-checking-modification',

        /* 汉文书号和CIP号申请 */
        // 提交申请
        'cn_applyCIP': 'cn-cip-apply/cip-apply-create',
        // 书号和CIP号信息
        'cn_cipInfo': 'cn-cip-apply/cip-apple-information',
        // 签发
        'cn_cipSign': 'cn-cip-apply/cip-apply-issuance',
        // 下发
        'cn_cipIssued': 'cn-cip-apply/cip-apply-issued',
        //未通过处理
        'cn_failureApply': 'cn-cip-apply/cip-apply-failure',
        //备案登记确认
        'cn_changeRecord': 'cn-cip-apply/cip-apply-sure',

        /* 书号和CIP号申请 */
        // 提交申请
        'applyISDNCIP': 'cip-apply/cip-apply-create',
        // 审核
        'applyAudit': 'cip-apply/cip-apple-review',
        // 书号和CIP号信息
        'CIPInfo': 'cip-apply/cip-apple-information',
        // 下发
        'issued': 'cip-apply/cip-apply-issued',
        //未通过处理
        'failureApply': 'cip-apply/cip-apply-failure',
        //补全图书信息
        'completionBook': 'cip-apply/complete-book-information',
        //盲文封面信息补全
        'completionCoverBook': 'cip-apply/complete-book-cover',
        //备案登记确认
        'registrationConfirmation': 'cip-apply/cip-apply-sure',


        /* CIP版署申请 */

        // 版署申请
        'versionApply': 'cip-version/cip-version-create',
        // 书号和条形码上传
        'uploadISBNAndBarcode': 'cip-version/cip-version-send',
        // 分类号上传
        'uploadClassNumber': 'cip-version/cip-version-classification',
        // CIP信息上传
        'uploadCIPInfo': 'cip-version/cip-version-cipinfo',


        /* 备案登记 */
        // 收集文件
        'collectFiles': 'registration-records/registration-records-collect',
        // 审核
        'recordAudit': 'registration-records/registration-records-review',
        // 备案登记
        'registration': 'registration-records/registration-records-information',


        /* 清样稿管理 */
        // 确认书稿
        'confirm': 'original-copy/confirmation',
        // 图书印制单
        'printClear': 'original-copy/print-list',
        // 发送书稿
        'sendArtwork': 'original-copy/sending',
        // 清样稿打印状态
        'clearPrintingType': 'original-copy/print-state',
        // 收集书稿
        'collectClear': 'original-copy/collecting',
        // 审核
        'check': 'original-copy/checking',
        // // 审核结果
        // 'readerServiceDepartmentHeadAudit': 'original-copy/check-result',
        // // 审核结果
        // 'readerServicesCommunityLeaderAudit': 'original-copy/check-result',
        // // 审核结果
        // 'libraryServiceDepartmentHeadAudit': 'original-copy/check-result',
        // // 审核结果
        // 'librarySectionCommunityLeaderAudit': 'original-copy/check-result',
        // // 审核结果
        // 'editorOfficeDepartmentHeadAudit': 'original-copy/check-result',
        // // 审核结果
        // 'editorOfficeDepartmentLeaderAudit': 'original-copy/check-result',
        // // 审核结果
        // 'braillePrintDepartmentHeadAudit': 'original-copy/check-result',
        // // 审核结果
        // 'braillePrintDepartmentLeaderAudit': 'original-copy/check-result',


        /* 清样稿印制 */
        // 下发
        'BrailleIssued': 'sample-print/sample-print-issued',
        // 刻印
        'BrailleEngraving': 'sample-print/sample-print-carve',
//      // 裁边
//      'BrailleCuttingEdge': 'sample-print/sample-print-tailor',
//      // 折页
//      'BrailleFolding': 'sample-print/sample-print-foldout',
//      // 抓页
//      'BrailleGrabPage': 'sample-print/sample-print-grab',
//      // 索线
//      'BrailleCableLine': 'sample-print/sample-print-wire',
//      // 查页
//      'BrailleCheckPage': 'sample-print/sample-print-check',
//      // 装订
//      'BrailleBinding': 'sample-print/sample-print-bind',
//      // 捆书配套
//      'BrailleBundleOfBooks': 'sample-print/sample-print-assort',
        // 交付
        'BrailleDeliver': 'sample-print/sample-print-deliver',
        // 其他流程交付
        'otherSend': 'sample-print/sample-print-deliver',


        /* 印刷管理 */
        // 下发
        'printIssued': 'print-manage/print-manage-issued',
        // 另件付印单录入
        'otherPieceSinglePress': 'print-manage/print-manage-enter',
        // 刻印
        'engraving': 'print-manage/print-manage-carve',
        // 制版
        'plate': 'print-manage/print-manage-carve',
        // 裁边
        'cuttingEdge': 'print-manage/print-manage-check',
        // 平印
        'flatPrint': 'print-manage/print-manage-carve',
        // 轮转
        'roundRobin': 'print-manage/print-manage-carve',
        // 折页
        'folding': 'print-manage/print-manage-foldout',
        // 抓页
        'grabPage': 'print-manage/print-manage-grab',
        // 索线
        'cableLine': 'print-manage/print-manage-wire',
        // 查页
        'checkThePage': 'print-manage/print-manage-check',
        // 装订
        'binding': 'print-manage/print-manage-check',
        // 捆书配套
        'bundleOfBooks': 'print-manage/print-manage-assort',
        // 印刷流程确认
        'printingConfirm': 'print-manage/print-manage-confirm',


        /* 盲文 - 变更备案 */
        // 变更备案申请表
        'changeTheRecordsApplication': 'braille-change-record/change-record-apply',
        // 部门负责人审核
        'toExamine': 'braille-change-record/change-record-principal',
        // 总编辑/副总编辑签署
        'sign': 'braille-change-record/change-record-chief',
        // 备案登记
        'registrationRecord': 'braille-change-record/change-record-register',
        // 告知责编
        'informDutyEditor': 'braille-change-record/change-record-inform',

        /*  图书印制单审核管理 */
        // 提交审核
        'submitAudit': 'print-audit/print-audit-review',
        // 读者服务部部门负责人审核
        'readerServiceDepartmentHeadAudit': 'print-audit/print-audit-add-book',
        // 读者服务部分管社领导审核
        'readerServicesCommunityLeaderAudit': 'print-audit/print-audit-reviews',
        // 典藏借阅部部门负责人审核
        'libraryServiceDepartmentHeadAudit': 'print-audit/print-audit-add-bookbottom',
        // 典藏借阅部分管社领导审核
        'librarySectionCommunityLeaderAudit': 'print-audit/print-audit-reviews-library',
        // 总编室部门负责人审核
        'editorOfficeDepartmentHeadAudit': 'print-audit/print-audit-reviews-library-editor',
        // 总编室分管社领导审核
        'editorOfficeDepartmentLeaderAudit': 'print-audit/print-audit-reviews-library-leader',
        // 盲文印制部负责人审核
        'braillePrintDepartmentHeadAudit': 'print-audit/print-audit-reviews-braille',
        // 盲文印制部分管社领导审核
        'braillePrintDepartmentLeaderAudit': 'print-audit/print-audit-reviews-braille-leader',

        /*  盲文-封面设计 */
        // 盲文印制部下发
        'braillePrintDeptDesignLeaderIssued': 'cover-design/cover-braille-print',
        // 出版部下发
        'publicationDeptDesignHeadIssued': 'cover-design/cover-notice',
        // 快印通知单录入
        'printNoticeOfEntry': 'cover-design/cover-publications',
        // 设计
        'devise': 'cover-design/cover-design',
        // 责任编辑审核
        'responsibleEditorAudit': 'cover-design/cover-editor-review',
        // 封面印刷
        'coverPrinting': 'cover-design/cover-print',

        /*  汉文-封面设计 */
        // 图书封面设计通知单
        'cn_coverDesignNotice': 'cn-cover-design/cn-cover-design-notice',
        // 出版部下发
        'cn_issued': 'cn-cover-design/cn-cover-design-issued',
        // 封面设计
        'cn_coverDesign': 'cn-cover-design/cn-cover-design',
        // 封面发行初审
        'cn_coverFirst':'cn-cover-design/cn-cover-design-chief-first',
        // 封面责编初审
        'cn_coverEditorFirst':'cn-cover-design/cn-cover-design-chief',
        // 初审封面修改
        'cn_firstCoverModification':'cn-cover-design/cn-cover-design-revise',
        // 封面发行复审
        'cn_coverSecond':'cn-cover-design/cn-cover-editor-reviews-first',
        // 封面责编复审
        'cn_coverEditorSecond':'cn-cover-design/cn-cover-editor-reviews',
        // 责编确认
        'cn_editorConfirm':'cn-cover-design/cn-cover-editor-review',

        /*  汉文-版权页设计 */
        // 版权页设计单
        'cn_copyrightPageDesign':'cn-cover-copyright-design/cn-copyright-pages',
        // 版权页设计
        'cn_copyrightDesign':'cn-cover-copyright-design/cn-copyright-design',
        // 审核
        'cn_toExamine':'cn-cover-copyright-design/cn-copyright-review',

        /* 汉文 - 合同录入 */
        // 下发
        'cn_contractIssued': 'chinese-contract-input/contract-input-issued',
        // 合同录入
        'cn_contractEntry': 'chinese-contract-input/contract-input',
        // 部门负责人审核合同
        'cn_deptHeadAudit': 'chinese-contract-input/contract-input-principal',
        // 上传法律评估报告
        'cn_uploadLegalReport': 'chinese-contract-input/contract-input-law',
        // 生成合同编号
        'cn_generateContractNum': 'chinese-contract-input/contract-input-contract',
        // 签署合同
        'cn_signContract': 'chinese-contract-input/contract-input-sign',
        // 归档登记
        'cn_fileRegister': 'chinese-contract-input/contract-input-register',

        /* 汉文-图书排版 */
        // 排版通知单
        'cn_layoutNote': 'cn-type-setting/notice',
        // 审核
        'cn_bookReview': 'cn-type-setting/checking',
        // 分配任务
        'cn_assign': 'cn-type-setting/assignment',
        // 录排
        'cn_recordRow': 'cn-type-setting/ts',

        /* 汉文-审稿 */
        // 初审
        'cn_first': 'chinese-review/chinese-review-first',
        // 初审改稿
        'cn_firstRewirte': 'chinese-review/chinese-review-change',
        // 初审核红
        'cn_firstRedNucleus': 'chinese-review/chinese-contrast',
        // 初审核红改稿或打样
        'cn_firstRedOrProof': 'chinese-review/chinese-review-proofing',
        // 复审任务分配
        'cn_secondDistribution': 'chinese-review/chinese-second-task',
        // 复审
        'cn_second': 'chinese-review/chinese-review-second',
        // 再次复审
        'cn_reSecond': 'chinese-review/chinese-review-secondagin',
        // 复审改稿
        'cn_secondRewrite': 'chinese-review/chinese-review-change',
        // 复审核红
        'cn_secondRedNucleus': 'chinese-review/chinese-contrast',
        // 复审核红改稿或打样
        'cn_secondRedOrProof': 'chinese-review/chinese-review-proofing',
        // 复审意见处理
        'cn_secondOpinionProcessing': 'chinese-review/chinese-second-handle',
        // 终审任务分配
        'cn_finallDistribution': 'chinese-review/chinese-final-task',
        // 终审
        'cn_finall': 'chinese-review/chinese-review-final',
        // 再次终审
        'cn_reFinall': 'chinese-review/chinese-review-finalagin',
        // 终审改稿
        'cn_finallRewrite': 'chinese-review/chinese-review-change',
        // 终审核红
        'cn_finallRedNucleus': 'chinese-review/chinese-contrast',
        // 终审核红改稿或打样
        'cn_finallRedOrProof': 'chinese-review/chinese-final-proofing',

        /* 汉文 - 变更备案 */
        // 变更备案申请表
        'cn_changeTheRecordsApplication': 'chinese-change-record/change-record-apply',
        // 部门负责人审核
        'cn_examine': 'chinese-change-record/change-record-principal',
        // 总编辑/副总编辑签署
        'cn_sign': 'chinese-change-record/change-record-chief',
        // 备案登记
        'cn_registrationRecord': 'chinese-change-record/change-record-register',
        // 告知责编
        'cn_informDutyEditor': 'chinese-change-record/change-record-inform',

        /* 汉文 - 发印及生产管理 */
        // 图书印制通知单
        'cn_PrintedNotice': 'chinese-produce-manage/produce-manage-advice',
        // 汉文编室审核
        'cn_ChineseRoomReview': 'chinese-produce-manage/produce-manage-examine',
        // 发行部审核
        'cn_IssueReview': 'chinese-produce-manage/produce-manage-examine',
        // 总编室审核
        'cn_OfficeReview': 'chinese-produce-manage/produce-manage-chief',
        // 出版部审核
        'cn_PublishingReview': 'chinese-produce-manage/produce-manage-publish',
        // 总编辑/副总编辑审核
        'cn_EditorReview': 'chinese-produce-manage/produce-manage-examine',
        // 生产通知单填写
        'cn_production': 'chinese-produce-manage/produce-manage-requisition',
        // 出版部审核
        'cn_publishingAudit': 'chinese-produce-manage/produce-publish-examine',
        // 社领导审核
        'cn_leadershipAudit': 'chinese-produce-manage/produce-publish-examine',
        // 下印厂
        'cn_underPrinting': 'chinese-produce-manage/produce-manage-factory',
        // 打印蓝纸
        'cn_printingBluePaper': 'chinese-produce-manage/produce-manage-blue',
        // 看蓝纸
        'cn_lookingBluePaper': 'chinese-produce-manage/produce-publish-see',
        // 看蓝纸处理
        'cn_lookBluePaperHandle': 'chinese-produce-manage/produce-manage-handle',
        // 打印样书
        'cn_printingBook': 'chinese-produce-manage/produce-manage-book',
        // 样书初审
        'cn_firstBookReview': 'chinese-produce-manage/produce-book-examine',
        // 样书初审处理
        'cn_firstBookReviewHandle': 'chinese-produce-manage/produce-manage-handle',
        // 样书终审
        'cn_lastBookReview': 'chinese-produce-manage/produce-book-examine',
        // 样书终审处理
        'cn_lastBookReviewHandle': 'chinese-produce-manage/produce-manage-handle',
        // 批量装订
        'cn_batchBind': 'chinese-produce-manage/produce-manage-bind',

        /* 汉文 - 快印管理 */
        // 快印通知单填写
        'cn_fillQuickPrint': 'chinese-print-manage/print-manage-advice',
        // 编辑部门意见
        'cn_editDeptOpinion': 'chinese-print-manage/print-manage-editotial',
        // 发行部门意见
        'cn_issueDeptOpinion': 'chinese-print-manage/print-manage-circulation',
        // 出版部门意见
        'cn_publishDeptOpinion': 'chinese-print-manage/print-depart-option',
        // 总编室意见
        'cn_chiefOfficeOpinion': 'chinese-print-manage/print-manage-chief',
        // 主管领导意见
        'cn_deptLeaderOpinion': 'chinese-print-manage/print-depart-option',
        // 打印蓝纸
        'cn_printBluePaper': 'chinese-print-manage/print-manage-blue',
        // 看蓝纸
        'cn_lookBluePaper': 'chinese-print-manage/print-publish-see',
        // 打印样书
        'cn_printBook': 'chinese-print-manage/print-manage-book',
        // 样书初审
        'cn_bookFirstExamine': 'chinese-print-manage/print-book-examine',
        // 样书终审
        'cn_bookFinalExamine': 'chinese-print-manage/print-book-examine',
        // 批量装订
        'cn_batchBinding': 'chinese-print-manage/print-manage-bind',


        /* 汉文 - 样书管理 */
        // 领取样书详情
        'cn_receiveStyleBook': 'book-manage/book-apply',
        // 部门审核详情
        'cn_departmentExamine': 'book-manage/book-manage-dep-review',
        // 领导审核详情
        'cn_leaderExamine': 'book-manage/book-manage-org-review',
        // 样书备注详情
        'cn_receiveRemarks': 'book-manage/book-receive',

        /* 汉文 -  校对*/
        //一校任务发起
        'cn_firstTaskStart': 'cn-proofread/start-proofread',
        //二校任务发起
        'cn_secondTaskStart': 'cn-proofread/start-proofread',
        //三校任务发起
        'cn_thirdTaskStart': 'cn-proofread/start-proofread',
        //一校任务委托
        'cn_firstTaskEntrust': 'cn-proofread/task-assignment',
        //二校任务委托
        'cn_secondTaskEntrust': 'cn-proofread/task-assignment',
        //三校任务委托
        'cn_thirdTaskEntrust': 'cn-proofread/task-assignment',
        //一校任务确认
        'cn_firstTaskConfirm': 'cn-proofread/task-confirmation',
        //二校任务确认
        'cn_secondTaskConfirm': 'cn-proofread/task-confirmation',
        //三校任务确认
        'cn_thirdTaskConfirm': 'cn-proofread/task-confirmation',
        //一校
        'cn_firstCheck': 'cn-proofread/proofread',
        //二校
        'cn_secondCheck': 'cn-proofread/proofread',
        //三校
        'cn_thirdCheck': 'cn-proofread/proofread',
        //一校勘误表确认
        'cn_firstCorrigendumConfirm': 'cn-proofread/proofread-confirmation',
        //二校勘误表确认
        'cn_secondCorrigendumConfirm': 'cn-proofread/proofread-confirmation',
        //三校勘误表确认
        'cn_thirdCorrigendumConfirm': 'cn-proofread/proofread-confirmation',
        //一校改稿
        'cn_firstProofRewrite': 'cn-proofread/proofread-modification',
        //二校改稿
        'cn_secondProofRewrite':'cn-proofread/proofread-modification',
        //三校改稿
        'cn_thirdProofRewrite': 'cn-proofread/proofread-modification',
        //一校核红
        'cn_firstCheckRed':'cn-proofread/red-checking',
        //二校核红
        'cn_secondCheckRed':'cn-proofread/red-checking',
        //三校核红
        'cn_thirdCheckRed':'cn-proofread/red-checking',
        //一校核红改稿
        'cn_firstCheckRedRewrite':'cn-proofread/red-checking-modification',
        //二校核红改稿
        'cn_secondCheckRedRewrite':'cn-proofread/red-checking-modification',
        //三校核红改稿
        'cn_thirdCheckRedRewrite':'cn-proofread/red-checking-modification',

        /* 盲文 - 重印管理 */
        // 重印发起
        'rpt_launchReprint':'reprint/launch-reprin',
        // 附加申请
        'rpt_additionalApplication':'reprint/add-apply',
        // 告知部门负责人
        'rpt_informDeptHead':'reprint/inform-head',
        // 修改盲文封底及电子书稿
        'rpt_modifyCoverAndBook':'reprint/change-info',
        //  重印审核状态
        'rpt_reprintAuditState':'reprint/reprint-state',

        /* 盲文 - 重印审核管理 */
        // 新增重印
        'rpt_addReprint':'reprint-audit/reprint-audit-add',
        // 盲文编译部部门负责人审核
        'rpt_editDeptHeadAudit':'reprint-audit/reprint-audit-editor',
        // 盲文编译部分管社领导审核
        'rpt_editDeptLeaderAudit':'reprint-audit/reprint-audit-editor',
        // 读者服务部部门负责人审核
        'rpt_readDeptHeadAudit':'reprint-audit/reprint-audit-editor',
        // 读者服务部分管社领导审核
        'rpt_readDeptLeaderAudit':'reprint-audit/reprint-audit-editor',
        // 典藏借阅部部门负责人审核
        'rpt_libraryDeptHeadAudit':'reprint-audit/reprint-audit-editor',
        // 典藏借阅部分管社领导审核
        'rpt_libraryDeptLeaderAudit':'reprint-audit/reprint-audit-editor',
        // 总编室部门负责人审核
        'rpt_chiefDeptHeadAudit':'reprint-audit/reprint-audit-editor',
        // 总编室分管社领导审核
        'rpt_chiefDeptLeaderAudit':'reprint-audit/reprint-audit-editor',
        // 盲文印制部部门负责人审核
        'rpt_printDeptHeadAudit':'reprint-audit/reprint-audit-editor',
        // 盲文印制部分管社领导审核
        'rpt_printDeptLeaderAudit':'reprint-audit/reprint-audit-editor',

        /* 汉文 - 再版重印管理 */
        //  新增再版/重印
        'rpt_cnAddReprint':'cn-reprint/add-reprint',
        // 部门负责人审核
        'rpt_departmentHeadAudit':'cn-reprint/cn-reprint-review',
        // 版权页任务分配
        'rpt_copyrightPageAssignment':'cn-reprint/cn-copy-allotment',
        // 封面设计任务分配
        'rpt_coverDesignAssignment':'cn-reprint/cn-cover-allotment',
        // 封面流程
        'cover_state':'cn-reprint/cn-reprint-flow-state',
        //审稿流程状态
        'reviewer_state':'cn-reprint/cn-reprint-flow-state',
        // 一校流程状态
        'fisrt_state':'cn-reprint/cn-reprint-flow-state',
        // 图书印制流程状态
        'book_printing_state':'cn-reprint/cn-reprint-state',
        // 审稿任务分配
        'rpt_reviewersTaskAllocation':'cn-reprint/cn-reprint-one',
        // 一校任务分配
        'rpt_firstTaskAllocation':'cn-reprint/cn-reprint-first-revisal',
        // 图书印制任务分配
        'rpt_bookPrintingTaskAllocation':'cn-reprint/cn-reprint-book',
        // 快印通知单填写
        'rpt_fillPrintNotice':'cn-reprint/cn-reprint-book',
        // 图书印制通知单
        'rpt_printedNotice':'cn-reprint/cn-reprint-state',
        
        /* 出版计划 */
       // 提交审核
       're_publicationAudit': 'publish-plan/publish-plan-submit',
       // 副总编辑审核
       're_publicationExamineOne': 'publish-plan/publish-plan-examine',
       // 总编辑审核
       're_publicationExamineTwo': 'publish-plan/publish-plan-examine',
       // 提交版署
       're_submitVersion': 'publish-plan/publish-plan-version'
    };
});