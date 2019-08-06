<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>找回密码 - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="/shop/default/css/common.css" rel="stylesheet" type="text/css" />
<link href="/shop/default/css/password.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/shop/default/js/jquery.js"></script>
<script type="text/javascript" src="/shop/default/js/jquery.validate.js"></script>
<script type="text/javascript" src="/shop/default/js/common.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $passwordForm = $("#passwordForm");
	var $username = $("#username");
	var $email = $("#email");
	var $captcha = $("#captcha");
	var $captchaImage = $("#captchaImage");
	var $submit = $("input:submit");
	
	// 更换验证码
	$captchaImage.click(function() {
		$captchaImage.attr("src", "/shop/common/captcha.jhtml?captchaId=24f8e623-01d8-47fd-bf0c-42c698394ec3&timestamp=" + new Date().getTime());
	});
	
	// 表单验证
	$passwordForm.validate({
		rules: {
			username: "required",
			email: {
				required: true,
				email: true
			},
			captcha: "required"
		},
		submitHandler: function(form) {
			$.ajax({
				url: $passwordForm.attr("action"),
				type: "POST",
				data: $passwordForm.serialize(),
				dataType: "json",
				cache: false,
				beforeSend: function() {
					$submit.prop("disabled", true);
				},
				success: function(message) {
					$.message(message);
					if (message.type == "success") {
						setTimeout(function() {
							$submit.prop("disabled", false);
							location.href = "/shop/";
						}, 3000);
					} else {
						$submit.prop("disabled", false);
							$captcha.val("");
							$captchaImage.attr("src", "/shop/common/captcha.jhtml?captchaId=24f8e623-01d8-47fd-bf0c-42c698394ec3&timestamp=" + new Date().getTime());
					}
				}
			});
		}
	});

});
</script>
</head>
<body>
<script type="text/javascript">
$().ready(function() {

	var $headerName = $("#headerName");
	var $headerLogin = $("#headerLogin");
	var $headerRegister = $("#headerRegister");
	var $headerLogout = $("#headerLogout");
	var $goodsSearchForm = $("#goodsSearchForm");
	var $keyword = $("#goodsSearchForm input");
	var defaultKeyword = "商品搜索";
	
	var username = getCookie("username");
	var nickname = getCookie("nickname");
	if ($.trim(nickname) != "") {
		$headerName.text(nickname).show();
		$headerLogout.show();
	} else if ($.trim(username) != "") {
		$headerName.text(username).show();
		$headerLogout.show();
	} else {
		$headerLogin.show();
		$headerRegister.show();
	}
	
	$keyword.focus(function() {
		if ($.trim($keyword.val()) == defaultKeyword) {
			$keyword.val("");
		}
	});
	
	$keyword.blur(function() {
		if ($.trim($keyword.val()) == "") {
			$keyword.val(defaultKeyword);
		}
	});
	
	$goodsSearchForm.submit(function() {
		if ($.trim($keyword.val()) == "" || $keyword.val() == defaultKeyword) {
			return false;
		}
	});

});
</script>

<!--
   header 区域
       注册+登录+搜索+商品分类、首页、手机数码等菜单
-->
<#include  "include/header.ftl">
	<div class="container password">
		<div class="row">
			<div class="span12">
				<div class="wrap">
					<div class="main">
						<div class="title">
							<strong>找回密码</strong>FORGOT PASSWORD
						</div>
						<form id="passwordForm" action="find.jhtml" method="post">
							<input type="hidden" name="captchaId" value="24f8e623-01d8-47fd-bf0c-42c698394ec3" />
							<table>
								<tr>
									<th>
										<span class="requiredField">*</span>用户名:
									</th>
									<td>
										<input type="text" name="username" class="text" maxlength="200" />
									</td>
								</tr>
								<tr>
									<th>
										<span class="requiredField">*</span>E-mail:
									</th>
									<td>
										<input type="text" name="email" class="text" maxlength="200" />
									</td>
								</tr>
									<tr>
										<th>
											<span class="requiredField">*</span>验证码:
										</th>
										<td>
											<span class="fieldSet">
												<input type="text" id="captcha" name="captcha" class="text captcha" maxlength="4" autocomplete="off" /><img id="captchaImage" class="captchaImage" src="/shop/common/captcha.jhtml?captchaId=24f8e623-01d8-47fd-bf0c-42c698394ec3" title="点击更换验证码" />
											</span>
										</td>
									</tr>
								<tr>
									<th>
										&nbsp;
									</th>
									<td>
										<input type="submit" class="submit" value="提 交" />
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<#include "include/footer.ftl">
</body>
</html>
