define(function (require, exports, module) {
    "use strict";

    var util = require('../../common/util');
    var config = require('../../common/global-config');

    var menuTpl = require('./index-page-menu.tpl');

    var IndexPage = function () {
        var indexRef;
        // 用户信息
        var userInfo = null;

        /**
         * 初始化页面事件
         */
        function initPageEvent() {
            /**
             * 模块跳转
             */
            $('#topMenu').on('click', 'a[data-href]', function () {
                var $el = $(this);
                var href = $el.attr('data-href');
                // 有链接就跳转
                if (href) {
                    util.openPage(href, null, false, true);
                }
            });

            // 菜单跳转
            // 个人信息
            $('#menuUserInfo').on('click', function () {
                // 打开个人信息页面
                util.openPage('other/personal/personal-info', {open: true});
            });

            // 退出登录
            $('#menuLogout').on('click', function () {
                util.showConfirm('确定要退出登录么？', doLogout);
            });

            //密码修改
            $('#menuPassword').on('click', function () {
                util.openPage('other/password/password-change', {open: true});
            });

            // 缩放
            var resizeTimer = null;
            $(window).on('resize', function () {
                clearTimeout(resizeTimer);
                resizeTimer = setTimeout(onWindowResize, 200);
            });

            // 点击后强制刷新首页
            $('#logoButton').on('click', function () {
                location.href = './index.html?t=' + (new Date()).getTime();
            });

            // TODO: 临时给刘瑶加的入口
            $('.copyright').on('click', function () {
                util.openPage('editor/braille-editor', {});
            });
        }

        /**
         * 退出登录
         */
        function doLogout() {
            util.showLoading('正在退出登录……');
            util.sendRequest({
                action: 'shiro/logout.action',
                type: 'POST',
                success: function (data) {
                    util.hideLoading();
                    console.log(data);
                    if (data && data.code === 0) {
                        // 服务器返回成功，跳转回登录页
                        location.href = 'login.html?t=' + (new Date()).getTime();
                    } else {
                        // 服务器返回失败
                        util.showConfirm('退出登录失败，是否强制返回登录页面？服务器返回信息：' + (data.message || '(无)'),
                            function () {
                                // 强制返回登录页面
                                location.href = 'login.html?t=' + (new Date()).getTime();
                            });
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showConfirm('退出登录失败，是否强制返回登录页面？',
                        function () {
                            // 强制返回登录页面
                            location.href = 'login.html?t=' + (new Date()).getTime();
                        });
                }
            });
        }

        /**
         * 构建顶层菜单
         */
        function initMenu() {
            // 生成菜单内容
            config.auth = util.auth || [];
            config.showAll = !!util.getUrlParameters().showAll;
            util.showAll = config.showAll;
            $('#topMenu').html(util.template(menuTpl, config));
            // 使用插件支持悬停展开菜单
            $('[data-hover="dropdown"]').dropdownHover();

            // 处理菜单显示
            resizeMenu();
        }

        /**
         * 窗口缩放事件
         */
        function onWindowResize() {
            // 处理自定义缩放窗口
            var $style = $('<style>').attr('id', 'resizeStyle');
            var content = '.dialog-resize {';
            content += '  max-height: ' + ($(window).height() - 240 < 300 ? 300 : $(window).height() - 240) + 'px;';
            content += '}';
            $style.html(content);
            $('head').find('#resizeStyle').remove();
            $('head').append($style);

            // 处理菜单显示
            resizeMenu();

        }

        /**
         * 窗口缩放后重新控制菜单显示
         */
        function resizeMenu() {
            var menuCount = $('#topMenu .nav-parent').length;
            if ($(window).width() - 550 - 145 * menuCount > 0) {
                $('.top-menu-item').show();
            } else {
                $('.top-menu-item').hide();
            }
        }

        /**
         * 查询权限
         */
        function initUserRole() {
            util.auth = [];
            util.sendRequest({
                action: 'role/userRoleList.action',
                data: {},
                success: function (resp) {
                    util.hideLoading();
                    if (resp.code === 0) {
                        // 所有权限整理成数组放到全局
                        var auth = [];
                        for (var i = 0; i < resp.data.length; i++) {
                            auth.push(resp.data[i].authorityId);
                        }
                        util.auth = auth;
                        // 权限查询成功，初始化菜单
                        initMenu();
                        // 如果存在待加载的模块则加载
                        if (util.loadingModule) {
                            // 注意，此处调用index内置方法
                            util.index.loadModule(util.loadingModule);
                            util.loadingModule = '';
                        }
                    } else {
                        util.hideLoading();
                        console.log(resp.data);
                        util.showAlert(resp.message || '初始化用户权限出错，请联系管理员！');
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('初始化用户权限出错，请联系管理员！');
                }

            });
        }

        /**
         * 查询用户信息
         */
        function initUserInfo() {
            util.showLoading();
            util.sendRequest({
                data: {},
                action: 'user/detailLoginUser.action',
                success: function (resp) {
                    if (resp.code === 0) {
                        userInfo = resp.data;
                        if (userInfo.userHead) {
                            userInfo.userHead = util.getResourceRoot() + userInfo.userHead;
                        }
                        util.userInfo = userInfo;
                        // 用户名
                        $('#globalUserName').text(userInfo.userName);
                        $('#globalUserName').attr('title', userInfo.userName);
                        // 头像
                        if (userInfo.userHead) {
                            $('#globalUserHead').attr('src', userInfo.userHead);
                        }

                        // 查询完用户信息后开始查询权限
                        initUserRole();
                    } else {
                        util.hideLoading();
                        console.log(resp.data);
                        util.showAlert(resp.message || '初始化用户信息出错，请联系管理员！');
                    }
                },
                error: function (xhr) {
                    // XHR错误
                    util.hideLoading();
                    console.log(xhr);
                    util.showAlert('初始化用户信息出错，请联系管理员！');
                }
            });
        }

        /**
         * 初始化页面数据
         */
        function initPageData() {
            // // 查询用户权限
            // initUserRole();

            // 查询用户信息
            initUserInfo();
        }

        /**
         * 初始化时被调用
         */
        this.onInit = function (index) {
            indexRef = index;

            // 设置动态样式
            onWindowResize();

            // 初始化页面事件
            initPageEvent();

            // 初始化页面数据
            initPageData();

            // 开放给外部刷新用户信息
            util.refreshUserInfo = initUserInfo;
        };
    };

    module.exports = new IndexPage();
});