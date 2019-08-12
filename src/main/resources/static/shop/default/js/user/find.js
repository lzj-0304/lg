//表单验证
$().ready(function () {

    var $passwordForm = $("#passwordForm");
    var $phone = $("#phone");
    var $dxyzm = $("#dxyzm");
    var $newPassword = $("#newPassword");
    var $newRePassword = $("#newRePassword");
    var $submit = $("input:submit");

    // 表单验证
    $passwordForm.validate({
        rules: {
            phone: {
                required: true,
                checkPhone: true,
                remote: {
                    url: "/register/find_CheckPhone",
                    cache: false
                }
            },
            dxyzm: {
                required: true,
                digits: true
            },
            newPassword: {
                required: true,
                checkPassword: true,

            },
            newRePassword: {
                required: true,
                equalTo: "#newPassword"
            },

            captcha1: "required"
        },
        messages: {
            phone: {
                remote: "用户不存在"
            }
        },
        submitHandler: function (form) {

            $.ajax({
                url: "/register/updatePassword",
                type: "POST",
                data: {
                    "phone": $phone.val(),
                    "dxyzm": $dxyzm.val(),
                    "newPassword": $newPassword.val(),
                    "newRePassword": $newRePassword.val(),
                },
                dataType: "json",
                cache: false,
                beforeSend: function () {
                    $submit.prop("disabled", true);
                },
                success: function (data) {
                    $submit.prop("disabled", false);
                    if (data.code == 200) {
                        alert(data.msg);
                        location.href = "/login";
                    } else {
                        alert(data.msg);
                        window.location.reload();
                    }
                }
            });
        },

        //提交表单后，（第一个）未通过验证的表单获得焦点
        focusInvalid: true,
        //当未通过验证的元素获得焦点时，移除错误提示
        //focusCleanup:true
    });

    $.validator.addMethod("checkPhone", function (value, element, params) {
        var check = /^1[3456789]\d{9}$/;
        return this.optional(element) || (check.test(value));
    }, "*请输入正确的手机号！");

    $.validator.addMethod("checkPassword", function (value, element, params) {
        var check = /^\w{6,16}$/;
        return this.optional(element) || (check.test(value));
    }, "*请输入正确的密码！");


    //初始化极验验证
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
});

/*极验行为验证*/
var handler1 = function (captchaObj) {
    $("#btn").click(function (e) {
        //查看极验验证的状态
        var result = captchaObj.getValidate();
        var phone = $("#phone").val();
        if (phone == undefined || phone == "" || phone == null) {
            alert("请先填写手机号");
            return;
        }else {
            //判断验证是否通过
            if((!result) ){
                $("#notice1").show();
                setTimeout(function () {
                    $("#notice1").hide();
                }, 2000);
                e.preventDefault();

                return;
            }
        }
        //校验极验验证
        getCode(this);
    });
    // 将验证码加到id为captcha的元素里，同时会有三个input的值用于表单提交
    captchaObj.appendTo("#captcha1");
    captchaObj.onReady(function () {
        $("#wait1").hide();
    });
};


//发送验证码按钮
var wait = 60;
function getCode(o) {
    wait--;
    if (wait == 0) {
        o.removeAttribute("disabled");
        o.value = "获取验证码";
        wait = 60;
    }
    if (wait == 59) {
        //ajax请求校验验证码/发送短信
        checkJy();
    }
    if (wait < 60) {
        o.setAttribute("disabled", true);
        o.value = "重新发送(" + wait + ")";
        setTimeout(function () {
                getCode(o)
            },
            1000)
    }

}


//校验验证后发送短信
function checkJy() {
    //验证码数据
    var geetest_challenge = $('input[name="geetest_challenge"]').val();
    var geetest_validate = $('input[name="geetest_validate"]').val();
    var geetest_seccode = $('input[name="geetest_seccode"]').val();

    $.ajax({
        url: "/register/check_JY",
        type: "POST",
        data: {
            "geetest_challenge": geetest_challenge,
            "geetest_validate": geetest_validate,
            "geetest_seccode": geetest_seccode
        },
        dataType: "json",
        success:function (data) {
            if(data.code==200){
                //如果校验成功，发送短信
                sendMsg();
            }else{
                alert(data.msg);
            }
        }
    })
}


function sendMsg() {
    var phone = $("#phone").val();
    $.ajax({
        url: "/register/sendMsg",
        type: "POST",
        data: {
            "phone":phone
        },
        dataType: "json"

    })
}

