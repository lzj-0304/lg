package com.lotbyte.lg.service.impl;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.lotbyte.lg.common.service.impl.BaseServiceImpl;
import com.lotbyte.lg.common.util.AssertUtil;
import com.lotbyte.lg.common.util.Md5Util;
import com.lotbyte.lg.common.util.ResultInfo;
import com.lotbyte.lg.entity.XxMember;
import com.lotbyte.lg.mapper.XxMemberMapper;
import com.lotbyte.lg.sdk.GeetestConfig;
import com.lotbyte.lg.sdk.GeetestLib;
import com.lotbyte.lg.service.XxMemberService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author lotbyte
 * @since 2019-08-01
 */
@Slf4j
@Service
public class XxMemberServiceImpl extends BaseServiceImpl<XxMemberMapper, XxMember> implements XxMemberService {

    /**
     * 校验注册信息
     * @param str
     * @param request
     * @return
     */
    @Override
    public boolean checkUserRegister(HttpServletRequest request) {
        Boolean b=null;
        String type = request.getParameter("type");
        if(type.equals("username")){
            b = countUserByName(request);
        }else if(type.equals("email")){
            b = countUserByemail(request);
        }else if(type.equals("phone")){
            b = countUserByPhone(request);
        }
        return b;
    }

    /**
     * 根据用户名查找用户是否存在
     *
     * @param
     * @return
     */
    public Boolean countUserByName(HttpServletRequest request) {
        String username = request.getParameter("username");
        if (StringUtils.isEmpty(username)) {
            return false;
        }
        Integer count = getBaseMapper().selectCount(new QueryWrapper<XxMember>().eq("username", username));
        return count == 0;
    }


    /**
     * 根据email查找用户是否存在
     *
     * @param
     * @return
     */
    public Boolean countUserByemail(HttpServletRequest request) {
        String email = request.getParameter("email");
        if (StringUtils.isEmpty(email)) {
            return false;
        }
        Integer count = getBaseMapper().selectCount(new QueryWrapper<XxMember>().eq("email", email));
        return count == 0;
    }


    /**
     * 根据手机号查找用户是否存在
     *
     * @param
     * @return
     */
    public Boolean countUserByPhone(HttpServletRequest request) {
        String phone = request.getParameter("phone");
        if (StringUtils.isEmpty(phone)) {
            return false;
        }
        Integer count = getBaseMapper().selectCount(new QueryWrapper<XxMember>().eq("phone", phone));
        return count == 0;
    }


    /**
     * 加载验证码
     *
     * @param request
     * @param response
     * @return
     */
    @Override
    public String startCaptcha(HttpServletRequest request, HttpServletResponse response) {
        String resStr = "{}";
        try {
            GeetestLib gtSdk = new GeetestLib(GeetestConfig.getGeetest_id(), GeetestConfig.getGeetest_key(),
                    GeetestConfig.isnewfailback());

            String userid = "test";

            //自定义参数,可选择添加
            HashMap<String, String> param = new HashMap<String, String>();
            param.put("user_id", userid); //网站用户id
            param.put("client_type", "web"); //web:电脑上的浏览器；h5:手机上的浏览器，包括移动应用内完全内置的web_view；native：通过原生SDK植入APP应用的方式
            param.put("ip_address", "127.0.0.1"); //传输用户请求验证时所携带的IP

            //进行验证预处理
            int gtServerStatus = gtSdk.preProcess(param);

            //将服务器状态设置到session中
            request.getSession().setAttribute(gtSdk.gtServerStatusSessionKey, gtServerStatus);
            //将userid设置到session中
            request.getSession().setAttribute("userid", userid);

            resStr = gtSdk.getResponseStr();

        } catch (Exception e) {
            e.printStackTrace();
        }
        // 返回页面极验验证初始化所需的json数据
        return resStr;
    }


    /**
     * 处理验证码/创建新用户
     *
     * @param request
     * @param response
     * @return
     */
    @Override
    public ResultInfo verifyLogin(HttpServletRequest request, HttpServletResponse response) {
        //数据存放
        ResultInfo resultInfo = null;
        try {
            GeetestLib gtSdk = new GeetestLib(GeetestConfig.getGeetest_id(), GeetestConfig.getGeetest_key(),
                    GeetestConfig.isnewfailback());

            String challenge = request.getParameter(GeetestLib.fn_geetest_challenge);
            String validate = request.getParameter(GeetestLib.fn_geetest_validate);
            String seccode = request.getParameter(GeetestLib.fn_geetest_seccode);

            //从session中获取gt-server状态
            int gt_server_status_code = (Integer) request.getSession().getAttribute(gtSdk.gtServerStatusSessionKey);

            //从session中获取userid
            String userid = (String) request.getSession().getAttribute("userid");

            //自定义参数,可选择添加
            HashMap<String, String> param = new HashMap<String, String>();
            param.put("user_id", userid); //网站用户id
            param.put("client_type", "web"); //web:电脑上的浏览器；h5:手机上的浏览器，包括移动应用内完全内置的web_view；native：通过原生SDK植入APP应用的方式
            param.put("ip_address", "127.0.0.1"); //传输用户请求验证时所携带的IP

            int gtResult = 0;

            if (gt_server_status_code == 1) {
                //gt-server正常，向gt-server进行二次验证

                gtResult = gtSdk.enhencedValidateRequest(challenge, validate, seccode, param);
            } else {
                // gt-server非正常情况下，进行failback模式验证

                gtResult = gtSdk.failbackValidateRequest(challenge, validate, seccode);
            }


            if (gtResult == 1) {
                // 验证成功
                //调用注册方法
                resultInfo = userRegister(request, response);

            } else {
                // 验证失败
                resultInfo = new ResultInfo();
                resultInfo.setCode(400);
                resultInfo.setMsg("验证失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultInfo;
    }


    /**
     * 注册新用户
     *
     * @param request  表单数据
     * @param response
     */
    @Override
    public ResultInfo userRegister(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rePassword = request.getParameter("rePassword");
        String email = request.getParameter("email");
        String xm = request.getParameter("memberAttribute_1");
        String xb = request.getParameter("memberAttribute_2");
        String phone = request.getParameter("memberAttribute_8");

        AssertUtil.isTrue(StringUtils.isEmpty(username) || "".equals(username), "用户名为空");
        AssertUtil.isTrue(StringUtils.isEmpty(password) || "".equals(password), "密码为空");
        AssertUtil.isTrue(StringUtils.isEmpty(rePassword) || "".equals(rePassword), "二次密码为空为空");
        AssertUtil.isTrue(StringUtils.isEmpty(email) || "".equals(email), "邮箱为空");
        AssertUtil.isTrue(StringUtils.isEmpty(phone) || "".equals(phone), "手机号为空");
        AssertUtil.isTrue(!password.equals(rePassword), "两次密码不一致");

        //实例化新用户
        XxMember xxMember = initUser(username, password, email, xm, xb, phone, request, response);
        int insert = getBaseMapper().insert(xxMember);

        ResultInfo resultInfo = new ResultInfo();
        if (insert > 0) {
            resultInfo.setCode(200);
            resultInfo.setMsg("注册成功");
        } else {
            resultInfo.setCode(404);
            resultInfo.setMsg("注册失败");
        }

        return resultInfo;

    }


    /**
     * 登录验证用户是否存在
     *
     * @param username
     * @return
     */
    @Override
    public Boolean loginCountUserByName(String username) {
        if (StringUtils.isEmpty(username)) {
            return false;
        }
        Integer count = getBaseMapper().selectCount(new QueryWrapper<XxMember>().eq("username", username));
        return count > 0;
    }


    /**
     * 处理验证码，登录
     *
     * @param request
     * @param response
     * @return
     */
    @Override
    public ResultInfo loginVerifyLogin(HttpServletRequest request, HttpServletResponse response) {
        //数据存放
        ResultInfo resultInfo = null;
        try {
            GeetestLib gtSdk = new GeetestLib(GeetestConfig.getGeetest_id(), GeetestConfig.getGeetest_key(),
                    GeetestConfig.isnewfailback());

            String challenge = request.getParameter(GeetestLib.fn_geetest_challenge);
            String validate = request.getParameter(GeetestLib.fn_geetest_validate);
            String seccode = request.getParameter(GeetestLib.fn_geetest_seccode);

            //从session中获取gt-server状态
            int gt_server_status_code = (Integer) request.getSession().getAttribute(gtSdk.gtServerStatusSessionKey);

            //从session中获取userid
            String userid = (String) request.getSession().getAttribute("userid");

            //自定义参数,可选择添加
            HashMap<String, String> param = new HashMap<String, String>();
            param.put("user_id", userid); //网站用户id
            param.put("client_type", "web"); //web:电脑上的浏览器；h5:手机上的浏览器，包括移动应用内完全内置的web_view；native：通过原生SDK植入APP应用的方式
            param.put("ip_address", "127.0.0.1"); //传输用户请求验证时所携带的IP

            int gtResult = 0;

            if (gt_server_status_code == 1) {
                //gt-server正常，向gt-server进行二次验证

                gtResult = gtSdk.enhencedValidateRequest(challenge, validate, seccode, param);
            } else {
                // gt-server非正常情况下，进行failback模式验证

                gtResult = gtSdk.failbackValidateRequest(challenge, validate, seccode);
            }


            if (gtResult == 1) {
                // 验证成功
                //调用登录方法
                resultInfo = userlogin(request, response);

            } else {
                // 验证失败
                resultInfo = new ResultInfo();
                resultInfo.setCode(404);
                resultInfo.setMsg("验证失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultInfo;
    }


    /**
     * 发送验证码
     *
     * @param request
     * @param response
     * @return
     */
    @Override
    public ResultInfo checkJY(HttpServletRequest request, HttpServletResponse response) {
        //数据存放
        ResultInfo resultInfo = new ResultInfo();;
        try {
            GeetestLib gtSdk = new GeetestLib(GeetestConfig.getGeetest_id(), GeetestConfig.getGeetest_key(),
                    GeetestConfig.isnewfailback());

            String challenge = request.getParameter(GeetestLib.fn_geetest_challenge);
            String validate = request.getParameter(GeetestLib.fn_geetest_validate);
            String seccode = request.getParameter(GeetestLib.fn_geetest_seccode);

            //从session中获取gt-server状态
            int gt_server_status_code = (Integer) request.getSession().getAttribute(gtSdk.gtServerStatusSessionKey);

            //从session中获取userid
            String userid = (String) request.getSession().getAttribute("userid");

            //自定义参数,可选择添加
            HashMap<String, String> param = new HashMap<String, String>();
            param.put("user_id", userid); //网站用户id
            param.put("client_type", "web"); //web:电脑上的浏览器；h5:手机上的浏览器，包括移动应用内完全内置的web_view；native：通过原生SDK植入APP应用的方式
            param.put("ip_address", "127.0.0.1"); //传输用户请求验证时所携带的IP

            int gtResult = 0;

            if (gt_server_status_code == 1) {
                //gt-server正常，向gt-server进行二次验证

                gtResult = gtSdk.enhencedValidateRequest(challenge, validate, seccode, param);
            } else {
                // gt-server非正常情况下，进行failback模式验证
                gtResult = gtSdk.failbackValidateRequest(challenge, validate, seccode);
            }

            if (gtResult == 1) {
                // 验证成功
                resultInfo.setCode(200);
                resultInfo.setMsg("验证成功");
            } else {
                // 验证失败
                resultInfo.setCode(404);
                resultInfo.setMsg("验证失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultInfo;

    }



    /**
     * 校验验证码，修改账户密码
     *
     * @param request
     * @param response
     */
    @Override
    public ResultInfo updatePassword(HttpServletRequest request, HttpServletResponse response) {

        //获取前台传来的参数
        String phoneNum = request.getParameter("phone");
        String dxyzm = request.getParameter("dxyzm");
        String newPassword = request.getParameter("newPassword");
        String newRepassword = request.getParameter("newRePassword");

        AssertUtil.isTrue(StringUtils.isEmpty(phoneNum) || "".equals(phoneNum), "手机号为空");
        AssertUtil.isTrue(StringUtils.isEmpty(dxyzm) || "".equals(dxyzm), "短信验证码为空");
        AssertUtil.isTrue(StringUtils.isEmpty(newPassword) || "".equals(newPassword), "新密码为空");
        AssertUtil.isTrue(StringUtils.isEmpty(newRepassword) || "".equals(newRepassword), "确认新密码为空为空");
        AssertUtil.isTrue(!newPassword.equals(newRepassword), "密码不一致");

        //校验session中的短信验证码
        ResultInfo resultInfo = checkSms(request, response, phoneNum, dxyzm, newPassword);

        return resultInfo;
    }


    /**
     * 校验短信,修改密码
     *
     * @param request
     * @param response
     * @param phoneNum
     * @param dxyzm
     * @param newPassword
     */
    private ResultInfo checkSms(HttpServletRequest request, HttpServletResponse response, String phoneNum, String dxyzm, String newPassword) {
        //传到前台数据
        ResultInfo resultInfo = new ResultInfo();
        String sessionCode = (String) request.getSession().getAttribute(phoneNum);
        Long time = (Long) request.getSession().getAttribute(sessionCode);
        long minute = new Date().getTime();

        if (minute - time < 300000) {
            if (sessionCode.equals(dxyzm)) {
                //修改密码
                XxMember member = new XxMember();
                member.setPassword(Md5Util.encode(newPassword));
                //修改条件
                UpdateWrapper<XxMember> updateWrapper = new UpdateWrapper<>();
                updateWrapper.eq("phone", phoneNum);
                //执行sql
                int update = getBaseMapper().update(member, updateWrapper);
                if (update > 0) {
                    resultInfo.setCode(200);
                    resultInfo.setMsg("密码修改成功");
                } else {
                    resultInfo.setCode(404);
                    resultInfo.setMsg("密码修改失败");
                }
            } else {
                resultInfo.setCode(404);
                resultInfo.setMsg("验证码不正确");
            }
        } else {
            resultInfo.setCode(404);
            resultInfo.setMsg("验证码超时");
        }

        return resultInfo;
    }


    /**
     * 发送短信验证码
     *
     * @param phoneNum
     * @return
     */
    @Override
    public ResultInfo sendMsg(HttpServletRequest httpServletRequest, String phoneNum) {
        //返回数据
        ResultInfo resultInfo = new ResultInfo();
        try {
            //自动生成6位数验证码c
            String smsCode = String.valueOf(new Random().nextInt(899999) + 100000);
            httpServletRequest.getSession().setAttribute(phoneNum, smsCode);
            //设置当前存放时间，以便在找回时判定是否过期
            long time = new Date().getTime();
            httpServletRequest.getSession().setAttribute(smsCode, time);

            //调用阿里通信接口
            //设置超时时间-可自行调整
            System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
            System.setProperty("sun.net.client.defaultReadTimeout", "10000");
            //初始化ascClient需要的几个参数
            final String product = "Dysmsapi";//短信API产品名称（短信产品名固定，无需修改）
            final String domain = "dysmsapi.aliyuncs.com";//短信API产品域名（接口地址固定，无需修改）
            //替换成你的AK
            final String accessKeyId = "LTAICSi0FmnlmKxj";//你的accessKeyId,参考本文档步骤2
            final String accessKeySecret = "2ZpVPJJVw8Agt9C42wtdFF9LgoQBE8";//你的accessKeySecret，参考本文档步骤2
            //初始化ascClient,暂时不支持多region（请勿修改）
            IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId, accessKeySecret);
            DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
            IAcsClient acsClient = new DefaultAcsClient(profile);
            //组装请求对象
            SendSmsRequest request = new SendSmsRequest();
            //使用post提交
            request.setMethod(MethodType.POST);
            //必填:待发送手机号。支持以逗号分隔的形式进行批量调用，批量上限为1000个手机号码,批量调用相对于单条调用及时性稍有延迟,验证码类型的短信推荐使用单条调用的方式
            request.setPhoneNumbers(phoneNum);
            //必填:短信签名-可在短信控制台中找到
            request.setSignName("ego商城");
            //必填:短信模板-可在短信控制台中找到
            request.setTemplateCode("SMS_171358389");
            //可选:模板中的变量替换JSON串,如模板内容为"亲爱的${name},您的验证码为${code}"时,此处的值为
            //友情提示:如果JSON中需要带换行符,请参照标准的JSON协议对换行符的要求,比如短信内容中包含\r\n的情况在JSON中需要表示成\\r\\n,否则会导致JSON在服务端解析失败
            request.setTemplateParam("{\"code\":\"" + smsCode + "\"}");
            //可选-上行短信扩展码(扩展码字段控制在7位或以下，无特殊需求用户请忽略此字段)
            //request.setSmsUpExtendCode("90997");
            //可选:outId为提供给业务方扩展字段,最终在短信回执消息中将此值带回给调用者
            request.setOutId("qf");
            //请求失败这里会抛ClientException异常
            SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);
            if (sendSmsResponse.getCode() != null && sendSmsResponse.getCode().equals("OK")) {
                //请求成功
                //真实应用的时候验证码在服务端有记录
                //客户端由客户来输入
                //客户输入的验证码和服务端做匹配
                resultInfo.setCode(200);
                resultInfo.setMsg("短信发送成功");
            } else {
                resultInfo.setCode(404);
                resultInfo.setMsg("短信发送失败");
            }
        } catch (ClientException e) {
            e.printStackTrace();
        }

        return resultInfo;
    }


    /**
     * 找回密码（判断手机号是否存在）
     *
     * @param phone
     * @return
     */
    @Override
    public Boolean findCountUserByPhone(String phone) {
        if (StringUtils.isEmpty(phone)) {
            return false;
        }
        Integer count = getBaseMapper().selectCount(new QueryWrapper<XxMember>().eq("phone", phone));
        return count > 0;

    }


    /**
     * 登录
     *
     * @param request
     * @param response
     */
    private ResultInfo userlogin(HttpServletRequest request, HttpServletResponse response) {
        //返回的数据
        ResultInfo resultInfo = new ResultInfo();

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        AssertUtil.isTrue(StringUtils.isEmpty(username) || "".equals(username), "用户名为空");
        AssertUtil.isTrue(StringUtils.isEmpty(password) || "".equals(password), "密码为空");

        Map<String, String> map = new HashMap<>();
        map.put("username", username);
        map.put("password", Md5Util.encode(password));
        XxMember member = getBaseMapper().selectOne(new QueryWrapper<XxMember>().allEq(map));
        if (member == null) {
            resultInfo.setCode(404);
            resultInfo.setMsg("密码错误");
        } else {
            request.getSession().setAttribute("xxmember", member);
            resultInfo.setCode(200);
            resultInfo.setMsg("登录成功");
        }

        return resultInfo;
    }


    //注册，初始化对象信息
    public XxMember initUser(String username, String password, String email, String xm, String xb, String phone, HttpServletRequest request, HttpServletResponse response) {

        XxMember xxMember = new XxMember();
        xxMember.setUsername(username);
        xxMember.setPassword(Md5Util.encode(password));
        xxMember.setEmail(email);
        xxMember.setAttributeValue1(xm);
        xxMember.setAttributeValue2(xb);
        xxMember.setPhone(phone);
        xxMember.setCreateDate(LocalDateTime.now());
        xxMember.setModifyDate(LocalDateTime.now());
        xxMember.setVersion(0L);
        xxMember.setAmount(BigDecimal.ZERO);
        xxMember.setBalance(BigDecimal.ZERO);
        xxMember.setIsEnabled(true);
        xxMember.setIsLocked(false);
        xxMember.setAttributeValue0(null);
        xxMember.setAddress(null);
        xxMember.setArea(1L);
        xxMember.setLockKey("");
        xxMember.setLoginFailureCount(0);
        xxMember.setLoginPluginId(null);
        xxMember.setMemberRank(0L);
        xxMember.setPoint(0L);
        xxMember.setRegisterIp(request.getRemoteAddr());
        xxMember.setLoginIp(request.getRemoteAddr());

        return xxMember;
    }
}
