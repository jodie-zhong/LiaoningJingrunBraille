$(function() {
	"use strict";
	var version = navigator.appVersion;
	console.log(version);
	if(version.indexOf("Chrome") !== -1) {
		$(".browser-warn").hide();
	} else {
		$(".browser-warn").show();
	}

	seajs.use(['./common/util.js'], function(util) {
		// 设置验证码
		refreshCaptcha();
		// 设置默认焦点
		$('#name').focus();

		// 绑定登录
		$('#btnLogin').on('click', function() {
			// 清空错误信息
			$('#errorMessage').empty();

			// 获取登录数据
			var loginData = {},
				$el, error = false;
			$('#loginForm input').each(function() {
				$el = $(this);
				loginData[$el.attr('name')] = $el.val();
				if(loginData[$el.attr('name')] === '') {
					// 存在未输入项
					$('#errorMessage').text('请输入' + $el.attr('placeholder') + '！');
					$el.focus();
					error = true;
					return false;
				}
			});

			// 不存在错误才执行登录
			if(!error) {
				// 准备登录验证
				console.log(loginData);
				// 验证码自动转大写
				// loginData.verifycode = loginData.verifycode.toUpperCase();
				// 登录
				util.showLoading('正在登录……');
				util.sendRequest({
					type: 'POST',
					data: loginData,
					action: 'shiro/checkLogin.action',
					success: function(data) {
						util.hideLoading();
						console.log(data);
						if(data && data.code === 0) {
							// 服务器返回成功
							sessionStorage.setItem('userInfo', JSON.stringify(data));
							window.open('index.html', '_self');
						} else {
							// 服务器返回失败
							emptyForm('userPwd');
							emptyForm('verifycode');
							refreshCaptcha();
							setErrorMsg(data.message || '登录出错，请稍后重试！');
						}
					},
					error: function(xhr) {
						// XHR错误
						util.hideLoading();
						console.log(xhr);
						emptyForm('userPwd');
						emptyForm('verifycode');
						refreshCaptcha();
						setErrorMsg('登录出错，请稍后重试！');
					}
				});
			}
		});

		/**
		 * 回车登录
		 */
		$('#loginForm input').on('keyup', function(evt) {
			evt = evt.originalEvent || evt;
			// 回车
			if(evt.keyCode === 13) {
				$('#btnLogin').click();
			}
		});

		// 点击更换验证码
		$('#captcha').on('click', refreshCaptcha);

		// 背景图
		$.backstretch(["img/login.jpg"], {
			fade: 600,
			duration: 4000
		});

		/**
		 * 刷新验证码
		 */
		function refreshCaptcha() {
			$('#captcha').attr('src', util.getServerBase() + 'image/getImage.action?t=' + (new Date()).getTime());
		}

		/**
		 * 设置错误信息
		 * @param msg
		 */
		function setErrorMsg(msg) {
			$('#errorMessage').text(msg);
		}

		/**
		 * 清空表单项
		 */
		function emptyForm(name) {
			if(name) {
				$('#loginForm input[name="' + name + '"]').val('');
			} else {
				$('#loginForm input').val('');
			}
		}
	});
});