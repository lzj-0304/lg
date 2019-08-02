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
<div class="header">
	<div class="top">
		<div class="topNav">
			<ul class="left">
				<li>
					<span>您好，欢迎来到SHOP++商城</span>
					<span id="headerName" class="headerName">&nbsp;</span>
				</li>
				<li id="headerLogin" class="headerLogin">
					<a href="/shop/login.jhtml">登录</a>|
				</li>
				<li id="headerRegister" class="headerRegister">
					<a href="/shop/register.jhtml">注册</a>
				</li>
				<li id="headerLogout" class="headerLogout">
					<a href="/shop/logout.jhtml">[退出]</a>
				</li>
			</ul>
			<ul class="right">
						<li>
							<a href="/shop/member/index.jhtml">会员中心</a>|
						</li>
						<li>
							<a href="/shop/article/list/3.jhtml">帮助中心</a>|
						</li>
				<li id="headerCart" class="headerCart">
					<a href="/shop/cart/list.jhtml">购物车</a>
					(<em></em>)
				</li>
			</ul>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="span3">
				<a href="/shop/">
					<img src="/shop/upload/image/logo.gif" alt="SHOP++商城" />
				</a>
			</div>
			<div class="span6">
				<div class="search">
					<form id="goodsSearchForm" action="/shop/goods/search.jhtml" method="get">
						<input name="keyword" class="keyword" value="商品搜索" autocomplete="off" x-webkit-speech="x-webkit-speech" x-webkit-grammar="builtin:search" maxlength="30" />
						<button type="submit">&nbsp;</button>
					</form>
				</div>
				<div class="hotSearch">
						热门搜索:
							<a href="/shop/goods/search.jhtml?keyword=%E8%8B%B9%E6%9E%9C">苹果</a>
							<a href="/shop/goods/search.jhtml?keyword=%E4%B8%89%E6%98%9F">三星</a>
							<a href="/shop/goods/search.jhtml?keyword=%E7%B4%A2%E5%B0%BC">索尼</a>
							<a href="/shop/goods/search.jhtml?keyword=%E5%8D%8E%E4%B8%BA">华为</a>
							<a href="/shop/goods/search.jhtml?keyword=%E9%AD%85%E6%97%8F">魅族</a>
							<a href="/shop/goods/search.jhtml?keyword=%E4%BD%B3%E8%83%BD">佳能</a>
							<a href="/shop/goods/search.jhtml?keyword=%E5%8D%8E%E7%A1%95">华硕</a>
							<a href="/shop/goods/search.jhtml?keyword=%E7%BE%8E%E7%9A%84">美的</a>
							<a href="/shop/goods/search.jhtml?keyword=%E6%A0%BC%E5%8A%9B">格力</a>
				</div>
			</div>
			<div class="span3">
				<div class="phone">
					<em>服务电话</em>
					800-8888888
				</div>
			</div>
		</div>
		<div class="row">
			<div class="span12">
				<dl class="mainNav">
					<dt>
						<a href="/shop/product_category.jhtml">所有商品分类</a>
					</dt>
							<dd>
								<a href="/shop/">首页</a>
							</dd>
							<dd>
								<a href="/shop/goods/list/1.jhtml">手机数码</a>
							</dd>
							<dd>
								<a href="/shop/goods/list/2.jhtml">电脑办公</a>
							</dd>
							<dd>
								<a href="/shop/goods/list/3.jhtml">家用电器</a>
							</dd>
							<dd>
								<a href="/shop/goods/list/4.jhtml">服装鞋靴</a>
							</dd>
							<dd>
								<a href="/shop/goods/list/5.jhtml">化妆护理</a>
							</dd>
							<dd>
								<a href="/shop/goods/list/241.jhtml">积分商城</a>
							</dd>
				</dl>
			</div>
		</div>
	</div>
</div>
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
<div class="footer">
	<div class="service clearfix">
		<dl>
			<dt class="icon1">新手指南</dt>
			<dd>
				<a href="#">购物流程</a>
			</dd>
			<dd>
				<a href="#">会员注册</a>
			</dd>
			<dd>
				<a href="#">购买宝贝</a>
			</dd>
			<dd>
				<a href="#">支付货款</a>
			</dd>
			<dd>
				<a href="#">用户协议</a>
			</dd>
		</dl>
		<dl>
			<dt class="icon2">特色服务</dt>
			<dd>
				<a href="#">购物流程</a>
			</dd>
			<dd>
				<a href="#">会员注册</a>
			</dd>
			<dd>
				<a href="#">购买宝贝</a>
			</dd>
			<dd>
				<a href="#">支付货款</a>
			</dd>
			<dd>
				<a href="#">用户协议</a>
			</dd>
		</dl>
		<dl>
			<dt class="icon3">支付方式</dt>
			<dd>
				<a href="#">购物流程</a>
			</dd>
			<dd>
				<a href="#">会员注册</a>
			</dd>
			<dd>
				<a href="#">购买宝贝</a>
			</dd>
			<dd>
				<a href="#">支付货款</a>
			</dd>
			<dd>
				<a href="#">用户协议</a>
			</dd>
		</dl>
		<dl>
			<dt class="icon4">配送方式</dt>
			<dd>
				<a href="#">购物流程</a>
			</dd>
			<dd>
				<a href="#">会员注册</a>
			</dd>
			<dd>
				<a href="#">购买宝贝</a>
			</dd>
			<dd>
				<a href="#">支付货款</a>
			</dd>
			<dd>
				<a href="#">用户协议</a>
			</dd>
		</dl>
		<div class="qrCode">
			<img src="/shop/default/images/qr_code.gif" alt="官方微信" />
			官方微信
		</div>
	</div>
	<div class="bottom">
		<div class="bottomNav">
			<ul>
						<li>
							<a href="#">关于我们</a>
							|
						</li>
						<li>
							<a href="#">联系我们</a>
							|
						</li>
						<li>
							<a href="#">诚聘英才</a>
							|
						</li>
						<li>
							<a href="#">隐私政策</a>
							|
						</li>
						<li>
							<a href="#">法律声明</a>
							|
						</li>
						<li>
							<a href="#">客户服务</a>
							|
						</li>
						<li>
							<a href="/shop/friend_link.jhtml">友情链接</a>
							
						</li>
			</ul>
		</div>
		<div class="info">
			<p>湘ICP备10000000号</p>
			<p>Copyright © 2005-2015 SHOP++商城 版权所有</p>
				<ul>
						<li>
							<a href="http://www.shopxx.net" target="_blank">
								<img src="http://image.demo.shopxx.net/4.0/201501/1c675feb-e488-4fd5-a186-b28bb6de445a.gif" alt="SHOP++" />
							</a>
						</li>
						<li>
							<a href="http://www.alipay.com" target="_blank">
								<img src="http://image.demo.shopxx.net/4.0/201501/ae13eddc-25ac-427a-875d-d1799d751076.gif" alt="支付宝" />
							</a>
						</li>
						<li>
							<a href="http://www.tenpay.com" target="_blank">
								<img src="http://image.demo.shopxx.net/4.0/201501/adaa9ac5-9994-4aa3-a336-b65613c85d50.gif" alt="财付通" />
							</a>
						</li>
						<li>
							<a href="https://www.95516.com" target="_blank">
								<img src="http://image.demo.shopxx.net/4.0/201501/41c18c8d-f69a-49fe-ace3-f16c2eb07983.gif" alt="中国银联" />
							</a>
						</li>
						<li>
							<a href="http://www.kuaidi100.com" target="_blank">
								<img src="http://image.demo.shopxx.net/4.0/201501/ea46ca0a-e8f0-4e2c-938a-5cb19a07cb9a.gif" alt="快递100" />
							</a>
						</li>
						<li>
							<a href="http://www.cnzz.com" target="_blank">
								<img src="http://image.demo.shopxx.net/4.0/201501/e12f226b-07f9-4895-bcc2-78dbe551964b.gif" alt="站长统计" />
							</a>
						</li>
						<li>
							<a href="http://down.admin5.com" target="_blank">
								<img src="http://image.demo.shopxx.net/4.0/201501/fd9d6268-e4e2-41f6-856d-4cb8a49eadd1.gif" alt="A5下载" />
							</a>
						</li>
						<li>
							<a href="http://www.ccb.com" target="_blank">
								<img src="http://image.demo.shopxx.net/4.0/201501/6c57f398-0498-4044-80d8-20f6c40d5cef.gif" alt="中国建设银行" />
							</a>
						</li>
				</ul>
		</div>
	</div>
</div>
</body>
</html>