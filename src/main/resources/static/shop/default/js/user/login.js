$().ready(function() {

    var $loginForm = $("#loginForm");
    var $username = $("#username");
    var $password = $("#password");
    var $captcha = $("#captcha");
    var $isRememberUsername = $("#isRememberUsername");
    var $submit = $("input:submit");

    // 记住用户名
    if (getCookie("username") != null) {
        $isRememberUsername.prop("checked", true);
        $username.val(getCookie("username"));
        $password.focus();
    } else {
        $isRememberUsername.prop("checked", false);
        $username.focus();
    }

    // 表单验证、记住用户名
    $loginForm.validate({
        rules: {
            username: {
                required:true,
                checkUsername:true,
                remote: {
                    url: "/login/check_username",
                    cache: false
                }
            },
            password: "required",
            captcha: "required"
        },
        messages: {
            username: {
                remote: "用户名不存在"
            }
        },
        /*submitHandler: function(form) {
            $.ajax({
                url: "/login/verifyLogin",
                type: "GET",
                dataType: "json",
                cache: false,
                beforeSend: function() {
                    $submit.prop("disabled", true);
                },
                success: function(data) {
                        if ($isRememberUsername.prop("checked")) {
                            addCookie("username", $username.val());
                        } else {
                            removeCookie("username");
                        }
                        $submit.prop("disabled", false);
                        if (data.code == 200) {
                            location.href = "/index";
                        } else {
                            $.message(data.msg);
                        }
                }

            });
        },*/
        //提交表单后，（第一个）未通过验证的表单获得焦点
        //focusInvalid:true,
        //当未通过验证的元素获得焦点时，移除错误提示
        focusCleanup:true
    });

    //自定义正则表达示验证方法
    $.validator.addMethod("checkUsername",function(value,element,params){
        var check = /^\w{2,10}$/;
        return this.optional(element)||(check.test(value));
    },"*请输入正确的用户名！");

});


/*极验行为验证*/
var handler1 = function (captchaObj) {
    $("#submit1").click(function (e) {
        var result = captchaObj.getValidate();
        if (!result) {
            $("#notice1").show();
            setTimeout(function () {
                $("#notice1").hide();
            }, 2000);
            e.preventDefault();
        }
    });
    // 将验证码加到id为captcha的元素里，同时会有三个input的值用于表单提交
    captchaObj.appendTo("#captcha1");
    captchaObj.onReady(function () {
        $("#wait1").hide();
    });
    // 更多接口参考：http://www.geetest.com/install/sections/idx-client-sdk.html
};
$.ajax({
    url: "/login/gt/startCaptcha?t=" + (new Date()).getTime(), // 加随机数防止缓存
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
            product: "float", // 产品形式，包括：float，popup
            width: "100%"
            // 更多配置参数请参见：http://www.geetest.com/install/sections/idx-client-sdk.html#config
        }, handler1);
    }
});




/*

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

 });*/
