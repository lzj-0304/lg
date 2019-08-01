<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>会员注册 - Powered By SHOP++</title>
	<meta name="author" content="SHOP++ Team" />
	<meta name="copyright" content="SHOP++" />
	<link href="/shop/default/css/common.css" rel="stylesheet" type="text/css" />
	<link href="/shop/default/css/register.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/shop/default/js/jquery.js"></script>
	<script type="text/javascript" src="/shop/default/js/jquery.lSelect.js"></script>
	<script type="text/javascript" src="/shop/default/js/jquery.validate.js"></script>
	<script type="text/javascript" src="/shop/default/js/jsbn.js"></script>
	<script type="text/javascript" src="/shop/default/js/prng4.js"></script>
	<script type="text/javascript" src="/shop/default/js/rng.js"></script>
	<script type="text/javascript" src="/shop/default/js/rsa.js"></script>
	<script type="text/javascript" src="/shop/default/js/base64.js"></script>
	<script type="text/javascript" src="/shop/default/js/common.js"></script>
	<script type="text/javascript" src="/shop/default/datePicker/WdatePicker.js"></script>
	<script type="text/javascript">
		$().ready(function() {

			var $registerForm = $("#registerForm");
			var $username = $("#username");
			var $password = $("#password");
			var $email = $("#email");
			var $areaId = $("#areaId");
			var $captcha = $("#captcha");
			var $captchaImage = $("#captchaImage");
			var $submit = $("input:submit");
			var $agreement = $("#agreement");

			// 地区选择
			$areaId.lSelect({
				url: "/shop/common/area.jhtml"
			});

			// 更换验证码
			$captchaImage.click(function() {
				$captchaImage.attr("src", "/shop/common/captcha.jhtml?captchaId=af5e63b2-d5d5-4242-aa5d-de85b722a677&timestamp=" + new Date().getTime());
			});

			// 注册协议
			$agreement.hover(function() {
				$(this).height(200);
			});

			// 表单验证
			$registerForm.validate({
				rules: {
					username: {
						required: true,
						pattern: /^[0-9a-zA-Z_\u4e00-\u9fa5]+$/,
						minlength: 2,
						remote: {
							url: "/shop/register/check_username.jhtml",
							cache: false
						}
					},
					password: {
						required: true,
						minlength: 4
					},
					rePassword: {
						required: true,
						equalTo: "#password"
					},
					email: {
						required: true,
						email: true
						,remote: {
							url: "/shop/register/check_email.jhtml",
							cache: false
						}
					},
					captcha: "required"
					,memberAttribute_7: {
						pattern: /^\d{3,4}-?\d{7,9}$/
					}
					,memberAttribute_8: {
						pattern: /^1[3|4|5|7|8]\d{9}$/
					}
				},
				messages: {
					username: {
						pattern: "只允许包含中文、英文、数字、下划线",
						remote: "用户名被禁用或已被注册"
					}
					,email: {
						remote: "E-mail已被注册"
					}
				},
				submitHandler: function(form) {
					$.ajax({
						url: "/shop/common/public_key.jhtml",
						type: "GET",
						dataType: "json",
						cache: false,
						beforeSend: function() {
							$submit.prop("disabled", true);
						},
						success: function(data) {
							var rsaKey = new RSAKey();
							rsaKey.setPublic(b64tohex(data.modulus), b64tohex(data.exponent));
							var enPassword = hex2b64(rsaKey.encrypt($password.val()));
							$.ajax({
								url: $registerForm.attr("action"),
								type: "POST",
								data: {
									username: $username.val(),
									enPassword: enPassword,
									email: $email.val()
									,captchaId: "af5e63b2-d5d5-4242-aa5d-de85b722a677",
									captcha: $captcha.val()
									,memberAttribute_1: $(":input[name='memberAttribute_1']").val()
									,memberAttribute_2: $(":input[name='memberAttribute_2']:checked").val()
									,memberAttribute_7: $(":input[name='memberAttribute_7']").val()
									,memberAttribute_8: $(":input[name='memberAttribute_8']").val()
								},
								dataType: "json",
								cache: false,
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
										$captchaImage.attr("src", "/shop/common/captcha.jhtml?captchaId=af5e63b2-d5d5-4242-aa5d-de85b722a677&timestamp=" + new Date().getTime());
									}
								}
							});
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
<div class="container register">
	<div class="row">
		<div class="span12">
			<div class="wrap">
				<div class="main clearfix">
					<div class="title">
						<strong>会员注册</strong>USER REGISTER
					</div>
					<form id="registerForm" action="/shop/register/submit.jhtml" method="post">
						<table>
							<tr>
								<th>
									<span class="requiredField">*</span>用户名:
								</th>
								<td>
									<input type="text" id="username" name="username" class="text" maxlength="20" />
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>密 码:
								</th>
								<td>
									<input type="password" id="password" name="password" class="text" maxlength="20" autocomplete="off" />
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>确认密码:
								</th>
								<td>
									<input type="password" name="rePassword" class="text" maxlength="20" autocomplete="off" />
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>E-mail:
								</th>
								<td>
									<input type="text" id="email" name="email" class="text" maxlength="200" />
								</td>
							</tr>
							<tr>
								<th>
									姓名:
								</th>
								<td>
									<input type="text" name="memberAttribute_1" class="text" maxlength="200" />
								</td>
							</tr>
							<tr>
								<th>
									性别:
								</th>
								<td>
													<span class="fieldSet">
															<label>
																<input type="radio" name="memberAttribute_2" value="male" />男
															</label>
															<label>
																<input type="radio" name="memberAttribute_2" value="female" />女
															</label>
													</span>
								</td>
							</tr>
							<tr>
								<th>
									电话:
								</th>
								<td>
									<input type="text" name="memberAttribute_7" class="text" maxlength="200" />
								</td>
							</tr>
							<tr>
								<th>
									手机:
								</th>
								<td>
									<input type="text" name="memberAttribute_8" class="text" maxlength="200" />
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>验证码:
								</th>
								<td>
											<span class="fieldSet">
												<input type="text" id="captcha" name="captcha" class="text captcha" maxlength="4" autocomplete="off" /><img id="captchaImage" class="captchaImage" src="/shop/common/captcha.jhtml?captchaId=af5e63b2-d5d5-4242-aa5d-de85b722a677" title="点击更换验证码" />
											</span>
								</td>
							</tr>
							<tr>
								<th>
									&nbsp;
								</th>
								<td>
									<input type="submit" class="submit" value="同意以下协议并注册" />
								</td>
							</tr>
							<tr>
								<th>
									&nbsp;
								</th>
								<td>
									注册协议
								</td>
							</tr>
							<tr>
								<th>
									&nbsp;
								</th>
								<td>
									<div id="agreement" class="agreement"><p>尊敬的用户欢迎您注册成为本网站会员。请用户仔细阅读以下全部内容。如用户不同意本服务条款任意内容，请不要注册或使用本网站服务。如用户通过本网站注册程序，即表示用户与本网站已达成协议，自愿接受本服务条款的所有内容。此后，用户不得以未阅读本服务条款内容作任何形式的抗辩。</p> <p>一、本站服务条款的确认和接纳<br />本网站涉及的各项服务的所有权和运作权归本网站所有。本网站所提供的服务必须按照其发布的服务条款和操作规则严格执行。本服务条款的效力范围及于本网站的一切产品和服务，用户在享受本网站的任何服务时，应当受本服务条款的约束。</p> <p>二、服务简介<br />本网站运用自己的操作系统通过国际互联网络为用户提供各项服务。用户必须:  1. 提供设备，如个人电脑、手机或其他上网设备。 2. 个人上网和支付与此服务有关的费用。</p> <p>三、用户在不得在本网站上发布下列违法信息<br />1. 反对宪法所确定的基本原则的； 2. 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的； 3. 损害国家荣誉和利益的； 4. 煽动民族仇恨、民族歧视，破坏民族团结的； 5. 破坏国家宗教政策，宣扬邪教和封建迷信的； 6. 散布谣言，扰乱社会秩序，破坏社会稳定的； 7. 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的； 8. 侮辱或者诽谤他人，侵害他人合法权益的； 9. 含有法律、行政法规禁止的其他内容的。</p> <p>四、有关个人资料<br />用户同意:  1. 提供及时、详尽及准确的个人资料。 2. 同意接收来自本网站的信息。 3. 不断更新注册资料，符合及时、详尽准确的要求。所有原始键入的资料将引用为注册资料。 4. 本网站不公开用户的姓名、地址、电子邮箱和笔名。除以下情况外:  a) 用户授权本站透露这些信息。 b) 相应的法律及程序要求本站提供用户的个人资料。</p> <p>五、服务条款的修改<br />本网站有权在必要时修改服务条款，一旦条款及服务内容产生变动，本网站将会在重要页面上提示修改内容。如果不同意所改动的内容，用户可以主动取消获得的本网站信息服务。如果用户继续享用本网站信息服务，则视为接受服务条款的变动。</p> <p>六、用户隐私制度<br />尊重用户个人隐私是本网站的一项基本政策。所以，本网站一定不会在未经合法用户授权时公开、编辑或透露其注册资料及保存在本网站中的非公开内容，除非有法律许可要求或本网站在诚信的基础上认为透露这些信息在以下四种情况是必要的:  1. 遵守有关法律规定，遵从本网站合法服务程序。 2. 保持维护本网站的商标所有权。 3. 在紧急情况下竭力维护用户个人和社会大众的隐私安全。 4. 符合其他相关的要求。</p> <p>七、用户的帐号、密码和安全性<br />用户一旦注册成功，将获得一个密码和用户名。用户需谨慎合理的保存、使用用户名和密码。如果你不保管好自己的帐号和密码安全，将负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。你可随时根据指示改变你的密码。用户若发现任何非法使用用户帐号或存在安全漏洞的情况，请立即通告本网站。  </p>  <p>八、 拒绝提供担保<br />用户明确同意信息服务的使用由用户个人承担风险。本网站不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保，但会在能力范围内，避免出错。</p> <p>九、有限责任<br />如因不可抗力或其它本站无法控制的原因使本站销售系统崩溃或无法正常使用导致网上交易无法完成或丢失有关的信息、记录等本站会尽可能合理地协助处理善后事宜，并努力使客户免受经济损失，同时会尽量避免这种损害的发生。</p> <p>十、用户信息的储存和限制<br />本站有判定用户的行为是否符合国家法律法规规定及本站服务条款权利，如果用户违背本网站服务条款的规定，本网站有权中断对其提供服务的权利。</p> <p>十一、用户管理<br />用户单独承担发布内容的责任。用户对服务的使用是根据所有适用于本站的国家法律、地方法律和国际法律标准的。用户必须遵循:  1. 使用网络服务不作非法用途。 2. 不干扰或混乱网络服务。 3. 遵守所有使用网络服务的网络协议、规定、程序和惯例。 用户须承诺不传输任何非法的、骚扰性的、中伤他人的、辱骂性的、恐性的、伤害性的、庸俗的，淫秽等信息资料。另外，用户也不能传输何教唆他人构成犯罪行为的资料；不能传输助长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法律的资料。未经许可而非法进入其它电脑系统是禁止的。 若用户的行为不符合以上提到的服务条款，本站将作出独立判断立即取消用户服务帐号。用户需对自己在网上的行为承担法律责任。用户若在本站上散布和传播反动、色情或其它违反国家法律的信息，本站的系统记录有可能作为用户违反法律的证据。</p> <p>十二、通告<br />所有发给用户的通告都可通过重要页面的公告或电子邮件或常规的信件传送。服务条款的修改、服务变更、或其它重要事件的通告都会以此形式进行。</p> <p>十三、信息内容的所有权<br />本网站定义的信息内容包括: 文字、软件、声音、相片、录象、图表；在广告中全部内容；本网站为用户提供的其它信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在本网站和广告商授权下才能使用这些内容，而不能擅自复制、再造这些内容、或创造与内容有关的派生产品。本站所有的文章版权归原文作者和本站共同所有，任何人需要转载本站的文章，必须征得原文作者或本站授权。</p> <p>十四、法律<br />本协议的订立、执行和解释及争议的解决均应适用中华人民共和国的法律。用户和本网站一致同意服从本网站所在地有管辖权的法院管辖。如发生本网站服务条款与中华人民共和国法律相抵触时，则这些条款将完全按法律规定重新解释，而其它条款则依旧保持对用户的约束力。</p></div>
								</td>
							</tr>
						</table>
						<div class="login">
							<dl>
								<dt>已经拥有账号了？</dt>
								<dd>
									立即登录即可体验在线购物！
									<a href="/shop/login.jhtml">立即登录</a>
								</dd>
							</dl>
						</div>
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
