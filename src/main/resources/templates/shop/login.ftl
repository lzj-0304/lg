<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>会员登录 - Powered By SHOP++</title>
    <meta name="author" content="SHOP++ Team" />
    <meta name="copyright" content="SHOP++" />
    <link href="/shop/default/css/common.css" rel="stylesheet" type="text/css" />
    <link href="/shop/default/css/login.css" rel="stylesheet" type="text/css" />
    <link href="/shop/default/css/gt.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/shop/default/js/jquery.js"></script>
    <script type="text/javascript" src="/shop/default/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="/shop/default/js/jsbn.js"></script>
    <script type="text/javascript" src="/shop/default/js/prng4.js"></script>
    <script type="text/javascript" src="/shop/default/js/rng.js"></script>
    <script type="text/javascript" src="/shop/default/js/rsa.js"></script>
    <script type="text/javascript" src="/shop/default/js/base64.js"></script>
    <script type="text/javascript" src="/shop/default/js/common.js"></script>

    <script type="text/javascript" src="/shop/default/js/gt.js"></script>
    <script type="text/javascript" src="/shop/default/js/user/login.js"></script>

</head>
<body>

<!--
   header 区域
       注册+登录+搜索+商品分类、首页、手机数码等菜单
-->
<#include  "include/header.ftl">


<div class="container login">
    <div class="row">
        <div class="span6">
            <img src="http://image.demo.shopxx.net/4.0/201501/b601918c-e775-4453-8abd-25f453bf5901.jpg" width="500" height="300" alt="服务宣传" />
        </div>
        <div class="span6">
            <div class="wrap">
                <div class="main">
                    <div class="title">
                        <strong>会员登录</strong>USER LOGIN
                    </div>
                    <form id="loginForm" action="/login/verifyLogin" method="post">
                        <table>
                            <tr>
                                <th>
                                    用户名/E-mail:
                                </th>
                                <td>
                                    <input type="text" id="username" name="username" class="text" maxlength="200" />
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    密 码:
                                </th>
                                <td>
                                    <input type="password" id="password" name="password" class="text" maxlength="200" autocomplete="off" />
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    验证码:
                                </th>
                                <td>
                                    <div id="captcha1">
                                        <p id="wait1" class="show">正在加载验证码......</p>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>

                                </th>
                                <td>
                                    <label>
                                        <input type="checkbox" id="isRememberUsername" name="isRememberUsername" value="true" />记住用户名
                                    </label>
                                    <label>
                                        &nbsp;&nbsp;<a href="/find">找回密码</a>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    &nbsp;
                                    <p id="notice1" class="hide">请先完成验证</p>
                                </th>
                                <td>
                                    <input type="submit" id="submit1" class="submit" value="登 录" />
                                </td>
                            </tr>
                            <tr class="register">
                                <th>
                                    &nbsp;
                                </th>
                                <td>
                                    <dl>
                                        <dt>还没有注册账号？</dt>
                                        <dd>
                                            立即注册即可体验在线购物！
                                            <a href="/shop/register.jhtml">立即注册</a>
                                        </dd>
                                    </dl>
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
