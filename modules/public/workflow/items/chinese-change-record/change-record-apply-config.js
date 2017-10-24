define(function(require, exports, module) {
	"use strict";

	module.exports = {
		bookName: {
			title: '书名',
			name: 'bookName',
			type: 'input',
			maxlength: 64,
		},
		topicOwnType: {
			title: '本社选题种类',
			name: 'topicOwnType',
			type: 'input',
			maxlength: 20,
		},
		thirdAuditOpinion: {
			title: '三审意见',
			name: 'thirdAuditOpinion',
			type: 'textarea',
			maxlength: 1024,
		},
		firstAuthor: {
			title: '第一作者',
			name: 'firstAuthor',
			type: 'input',
			maxlength: 32,
		},
		firstWorkWay: {
			title: '第一著作方式',
			name: 'firstWorkWay',
			type: 'input',
			maxlength: 32,
		},
		otherAuthor: {
			title: '其他作者',
			name: 'otherAuthor',
			type: 'input',
			maxlength: 32,
		},
		otherWorkWay: {
			title: '其他著作方式',
			name: 'otherWorkWay',
			type: 'input',
			maxlength: 64,
		},
		textLanguage: {
			title: '正文文种',
			name: 'textLanguage',
			type: 'input',
			maxlength: 32,
		},
		textWords: {
			title: '正文文字',
			name: 'textWords',
			type: 'input',
			maxlength: 32,
		},
		wordsNum: {
			title: '字数（千字）',
			name: 'wordsNum',
			type: 'input',
			pattern: '^(([1-9][0-9]{0,3})|([0-9]\\.[0-9]{1,3})|([1-9][0-9]{0,3}\\.[0-9]{1,3}))$',
			message: '请输入小于10000的数字,允许三位小数',
			maxlength: 8,
		},
		introduce: {
			title: '内容提要',
			name: 'introduce',
			type: 'textarea',
			maxlength: 1024,
		},
		authorMsg: {
			title: '作者简介',
			name: 'authorMsg',
			type: 'textarea',
			maxlength: 1024,
		},
		bookType: {
			title: '图书类型',
			name: 'bookType',
			type: 'input',
			maxlength: 20,
		},
		bookClassify: {
			title: '图书分类',
			name: 'bookClassify',
			type: 'input',
			maxlength: 32,
		},
		distribution: {
			title: '发行范围',
			name: 'distribution',
			type: 'input',
			maxlength: 32,
		},
		edition: {
			title: '版次',
			name: 'edition',
			type: 'input',
			maxlength: 32,
		},
		impression: {
			title: '印次',
			name: 'impression',
			type: 'input',
			maxlength: 32,
		},
		pricing: {
			title: '定价（本册）',
			name: 'pricing',
			type: 'input',
			maxlength: 10,
			pattern: '^(([1-9][0-9]{0,6})|([0-9]\\.[0-9]{1,2})|([1-9][0-9]{0,6}\\.[0-9]{1,2}))$',
			message: '请输入大于0小于10000000的数字（允许两位小数）',
		},
		serialPricing: {
			title: '定价（本套）',
			name: 'serialPricing',
			type: 'input',
			maxlength: 10,
			pattern: '^(([1-9][0-9]{0,6})|([0-9]\\.[0-9]{1,2})|([1-9][0-9]{0,6}\\.[0-9]{1,2}))$',
			message: '请输入大于0小于10000000的数字（允许两位小数）',
		},
		publishingStyle: {
			title: '出版方式',
			name: 'publishingStyle',
			type: 'input',
			maxlength: 32,
		},
		fascicleNo: {
			title: '分（辑）册号',
			name: 'fascicleNo',
			type: 'input',
			maxlength: 32,
		},
		publishingName: {
			title: '出版社名称',
			name: 'publishingName',
			type: 'input',
			maxlength: 32,
		}
	};
});