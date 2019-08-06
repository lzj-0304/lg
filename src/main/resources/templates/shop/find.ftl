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
    <link href="/shop/default/css/find.css" rel="stylesheet" type="text/css" />
	<link href="/shop/default/css/gt.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/shop/default/js/jquery.js"></script>
	<script type="text/javascript" src="/shop/default/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="/shop/default/js/common.js"></script>

		<script type="text/javascript" src="/shop/default/js/gt.js"></script>
		<script type="text/javascript" src="/shop/default/js/user/find.js"></script>
	</head>
	<body>
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
						<form id="passwordForm">
							<input type="hidden" name="captchaId" value="24f8e623-01d8-47fd-bf0c-42c698394ec3" />
							<table>
								<tr>
									<th>
										<span class="requiredField">*</span>手机号:
									</th>
									<td>
										<input type="text" id="phone" name="phone" class="text" maxlength="200" />

                                        <input type="button" id="btn" onclick="getCode(this)" value="发送验证码" />
                                    </td>
								</tr>
                                <tr>
                                    <th>
                                        <span class="requiredField">*</span>短信验证:
                                    </th>
                                    <td>
                                        <input type="text" id="dxyzm" name="dxyzm" class="text" maxlength="200" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span class="requiredField">*</span>重置密码:
                                    </th>
                                    <td>
                                        <input type="password" id="newPassword" name="newPassword" class="text" maxlength="200" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span class="requiredField">*</span>确认重置密码:
                                    </th>
                                    <td>
                                        <input type="password" id="newRePassword" name="newRePassword" class="text" maxlength="200" />
                                    </td>
                                </tr>
								<tr>
									<th>
										<span class="requiredField">*</span>验证码:
									</th>
									<td>
										<div id="captcha1">
											<p id="wait1" class="show">正在加载验证码......</p>
										</div>
									</td>
								</tr>
								<tr>
                                    <th>
                                        &nbsp;
                                        <p id="notice1" class="hide">请先完成验证</p>
                                    </th>
									<td>
                                        <input type="submit" id="submit1" class="submit" value="确 认" />
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
