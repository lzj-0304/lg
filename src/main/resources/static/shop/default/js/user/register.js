//表单验证
$().ready(function() {
    var $registerForm = $("#registerForm");
    var $username = $("#username");
    var $password = $("#password");
    var $submit = $("input:submit");


    // 表单验证
    $registerForm.validate({
        rules: {
            username: {
                required: true,
                checkUsername:true,
                remote: {
                    url: "/register/check_username",
                    cache: false
                }
            },
            password: {
                required: true,
                checkPassword: true
            },
            rePassword: {
                required: true,
                equalTo: "#password"
            },
            email: {
                required: true,
                checkEmail: true,
                remote: {
                    url: "/register/check_email",
                    cache: false
                }
            },
            memberAttribute_8: {
                required: true,
                checkPhone: true
            }

        },
        messages: {
            username: {
                remote: "用户名被禁用或已被注册"
            },
            email: {
                remote: "E-mail已被注册"
            }
        },

        //提交表单后，（第一个）未通过验证的表单获得焦点
        focusInvalid:true,
        //当未通过验证的元素获得焦点时，移除错误提示
        focusCleanup:true
    });
    //自定义正则表达示验证方法
    $.validator.addMethod("checkUsername",function(value,element,params){
        var check = /^\w{2,10}$/;
        return this.optional(element)||(check.test(value));
    },"*请输入正确的用户名！");

    $.validator.addMethod("checkPassword",function(value,element,params){
        var check = /^\w{6,16}$/;
        return this.optional(element)||(check.test(value));
    },"*请输入正确的密码！");

    $.validator.addMethod("checkEmail",function(value,element,params){
        var check = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        return this.optional(element)||(check.test(value));
    },"*请输入正确的邮箱！");

    $.validator.addMethod("checkPhone",function(value,element,params){
        var check = /^1[3456789]\d{9}$/;
        return this.optional(element)||(check.test(value));
    },"*请输入正确的手机号！");
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
    url: "/register/gt/startCaptcha?t=" + (new Date()).getTime(), // 加随机数防止缓存
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



