<html class="loginHtml">
<head>
	<link rel="icon" href="${ctx}/favicon.ico">
	<link rel="stylesheet" href="${ctx}/admin/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="${ctx}/admin/css/public.css" media="all" />
	<title>登录</title>
</head>
<body class="loginBody ">
<div class="layui-form" >
	<div class="login_face"><img src="${ctx}/admin/images/face.jpg"
								 class="userAvatar"></div>
	<div class="layui-form-item input-item">
		<label for="userName">用户名</label>
		<input type="text" placeholder="请输入用户名" name="userName"
			   autocomplete="off"
			   id="userName" class="layui-input" >
	</div>
	<div class="layui-form-item input-item">
		<label for="password">密码</label>
		<input type="password" placeholder="请输入密码" name="userPwd"
			   autocomplete="off"
			   id="userPwd" class="layui-input" >
	</div>
	<div class="layui-form-item input-item" id="imgCode">
		<div id="captcha2">
			<p id="wait2" class="show">正在加载验证码......</p>
		</div>
	</div>
	<div class="layui-form-item">
		<button class="layui-btn layui-block" id="login">登录</button>
	</div>
	<div class="layui-form-item layui-row">
		<a href="javascript:;" class="seraph icon-qq layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></a>
		<a href="javascript:;" class="seraph icon-wechat layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></a>
		<a href="javascript:;" class="seraph icon-sina layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></a>
	</div>
</div>
<script type="text/javascript" src="${ctx}/admin/layui/layui.all.js"></script>
<script type="text/javascript" src="${ctx}/admin/js/gt.js"></script>
<script src="http://apps.bdimg.com/libs/jquery/1.9.1/jquery.js"></script>
<script type="text/javascript">

	//表单输入效果
	$(".loginBody .input-item").click(function(e){
		e.stopPropagation();
		$(this).addClass("layui-input-focus").find(".layui-input").focus();
	})
	$(".loginBody .layui-form-item .layui-input").focus(function(){
		$(this).parent().addClass("layui-input-focus");
	})
	$(".loginBody .layui-form-item .layui-input").blur(function(){
		$(this).parent().removeClass("layui-input-focus");
		if($(this).val() != ''){
			$(this).parent().addClass("layui-input-active");
		}else{
			$(this).parent().removeClass("layui-input-active");
		}
	})


	var handler2 = function (captchaObj) {
		$("#login").click(function (e) {
			var result = captchaObj.getValidate();
			console.log(result);
			if (!result) {
				layer.msg("请先执行验证!",{icon:5});
				return;
			} else {
				$.ajax({
					url: '/user/doLogin02',
					type: 'POST',
					dataType: 'json',
					data: {
						userName:$("#userName").val(),
						userPwd:$("#userPwd").val(),
						geetest_challenge: result.geetest_challenge,
						geetest_validate: result.geetest_validate,
						geetest_seccode: result.geetest_seccode
					},
					success: function (data) {
						if (data.code == 200) {
							window.location.href="/index";
						} else  {
							layer.msg(data.msg, {icon: 5});
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
		url: "/admin/register?t=" + (new Date()).getTime(), // 加随机数防止缓存
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