<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>gt-node-sdk-demo</title>
	<style>
		body {
			margin: 50px 0;
			text-align: center;
			font-family: "PingFangSC-Regular", "Open Sans", Arial, "Hiragino Sans GB", "Microsoft YaHei", "STHeiti", "WenQuanYi Micro Hei", SimSun, sans-serif;
		}
		.inp {
			border: 1px solid #cccccc;
			border-radius: 2px;
			padding: 0 10px;
			width: 278px;
			height: 40px;
			font-size: 18px;
		}
		.btn {
			border: 1px solid #cccccc;
			border-radius: 2px;
			width: 100px;
			height: 40px;
			font-size: 16px;
			color: #666;
			cursor: pointer;
			background: white linear-gradient(180deg, #ffffff 0%, #f3f3f3 100%);
		}
		.btn:hover {
			background: white linear-gradient(0deg, #ffffff 0%, #f3f3f3 100%)
		}
		#captcha1,
		#captcha2 {
			width: 300px;
			display: inline-block;
		}
		.show {
			display: block;
		}
		.hide {
			display: none;
		}
		#notice1,
		#notice2 {
			color: red;
		}
		label {
			vertical-align: top;
			display: inline-block;
			width: 80px;
			text-align: right;
		}
		#wait1, #wait2 {
			text-align: left;
			color: #666;
			margin: 0;
		}
	</style>
</head>
<body>
<h1>极验验证SDKDemo</h1>
<hr>

<!-- 注意，验证码本身是不需要 jquery 库，此处使用 jquery 仅为了在 demo 使用，减少代码量 -->
<script src="http://apps.bdimg.com/libs/jquery/1.9.1/jquery.js"></script>

<!-- 引入 gt.js，既可以使用其中提供的 initGeetest 初始化函数 -->
<script src="${ctx}/admin/js/gt.js"></script>
<br><br>
<hr>
<form>
	<h2>滑动demo，使用ajax进行二次验证</h2>
	<br>
	<div>
		<label for="username2">用户名：</label>
		<input class="inp" id="username2" type="text" value="极验验证">
	</div>
	<br>
	<div>
		<label for="password2">密码：</label>
		<input class="inp" id="password2" type="password" value="123456">
	</div>
	<br>
	<div>
		<label>完成验证：</label>
		<div id="captcha2">
			<p id="wait2" class="show">正在加载验证码......</p>
		</div>
	</div>
	<br>
	<input class="btn" id="submit2" type="submit" value="提交">
</form>
<script>
	var handler2 = function (captchaObj) {
		$("#submit2").click(function (e) {
			var result = captchaObj.getValidate();
			console.log(result);
			if (!result) {
				alert("执行验证");
			} else {
				$.ajax({
					url: '/validate',
					type: 'POST',
					dataType: 'json',
					data: {
						username: $('#username2').val(),
						password: $('#password2').val(),
						geetest_challenge: result.geetest_challenge,
						geetest_validate: result.geetest_validate,
						geetest_seccode: result.geetest_seccode
					},
					success: function (data) {
						if (data.code == 200) {
							alert('登录成功');
						} else  {
							alert('登录失败');
						}
					}
				})
			}
			e.preventDefault();
		});
		// 将验证码加到id为captcha的元素里，同时会有三个input的值用于表单提交
		captchaObj.appendTo("#captcha2");
		captchaObj.onReady(function () {
			$("#wait2").hide();
		});
	};
	$.ajax({
		url: "/register?t=" + (new Date()).getTime(), // 加随机数防止缓存
		type: "get",
		dataType: "json",
		success: function (data) {
			// 调用 initGeetest 初始化参数
			// 参数1：配置参数
			// 参数2：回调，回调的第一个参数验证码对象，之后可以使用它调用相应的接口
			initGeetest({
				gt: data.gt,
				challenge: data.challenge,
				new_captcha: data.new_captcha, // 用于宕机时表示是新验证码的宕机
				offline: !data.success, // 表示用户后台检测极验服务器是否宕机，一般不需要关注
				product: "popup", // 产品形式，包括：float，popup
				width: "100%"
				// 更多配置参数请参见：http://www.geetest.com/install/sections/idx-client-sdk.html#config
			}, handler2);
		}
	});
</script>
</body>
</html>