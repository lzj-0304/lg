package com.lotbyte.lg.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.lotbyte.lg.common.service.impl.BaseServiceImpl;
import com.lotbyte.lg.common.util.AssertUtil;
import com.lotbyte.lg.common.util.ResultInfo;
import com.lotbyte.lg.entity.XxMember;
import com.lotbyte.lg.mapper.XxMemberMapper;
import com.lotbyte.lg.sdk.GeetestConfig;
import com.lotbyte.lg.sdk.GeetestLib;
import com.lotbyte.lg.service.XxMemberService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

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

    @Autowired
    private XxMemberMapper mapper;

    /**
     * //根据用户名查找用户是否存在
     *
     * @param username 用户名
     * @return
     */
    @Override
    public Boolean countUserByName(String username) {
        if (StringUtils.isEmpty(username)) {
            return false;
        }
        Integer count = getBaseMapper().selectCount(new QueryWrapper<XxMember>().eq("username", username));
        return count > 0;
    }

    /**
     * 根据email查找用户是否存在
     *
     * @param email 邮件
     * @return
     */
    @Override
    public Boolean countUserByemail(String email) {
        if (StringUtils.isEmpty(email)) {
            return false;
        }
        Integer count = getBaseMapper().selectCount(new QueryWrapper<XxMember>().eq("email", email));
        return count == 0;
    }

    /**
     * 加载验证码
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

            // PrintWriter out = response.getWriter();
            // out.println(resStr);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 返回页面极验验证初始化所需的json数据
        return resStr;
    }

    /**
     * 处理验证码/创建新用户
     * @param request
     * @param response
     * @return
     */
    @Override
    public ResultInfo verifyLogin(HttpServletRequest request, HttpServletResponse response) {
        //数据存放
        ResultInfo resultInfo=null;
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
                System.out.println(gtResult);
            } else {
                // gt-server非正常情况下，进行failback模式验证

                System.out.println("failback:use your own server captcha validate");
                gtResult = gtSdk.failbackValidateRequest(challenge, validate, seccode);
                System.out.println(gtResult);
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
        AssertUtil.isTrue(StringUtils.isEmpty(xm) || "".equals(phone), "手机号为空");
        AssertUtil.isTrue(!password.equals(rePassword), "两次密码不一致");

        //实例化新用户
        XxMember xxMember = initUser(username, password, rePassword, email, xm, xb, phone, request, response);
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
     * 处理验证码，登录
     * @param request
     * @param response
     * @return
     */
    @Override
    public ResultInfo loginVerifyLogin(HttpServletRequest request, HttpServletResponse response) {
        //数据存放
        ResultInfo resultInfo=null;
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
                userlogin(request,response);

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
     * 登录
     * @param request
     * @param response
     */
    private ResultInfo userlogin(HttpServletRequest request, HttpServletResponse response) {
        //返回的数据
        ResultInfo resultInfo = new ResultInfo();

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        AssertUtil.isTrue(StringUtils.isEmpty(username) || "".equals(username),"用户名为空");
        AssertUtil.isTrue(StringUtils.isEmpty(password) || "".equals(password),"密码为空");

        Map<String, String> map = new HashMap<>();
        map.put("username",username);
        map.put("password",password);
        XxMember member = getBaseMapper().selectOne(new QueryWrapper<XxMember>().allEq(map));
        if(member==null){
            resultInfo.setCode(404);
            resultInfo.setMsg("密码错误");
        }else {
            resultInfo.setCode(200);
            resultInfo.setMsg("登录成功");
        }

        return resultInfo;
    }


    //初始化对象信息
    public XxMember initUser(String username, String password, String rePassword, String email, String xm, String xb, String phone, HttpServletRequest request, HttpServletResponse response) {

        XxMember xxMember = new XxMember();
        xxMember.setUsername(username);
        xxMember.setPassword(password);
        xxMember.setEmail(email);
        xxMember.setAttributeValue1(xm);
        xxMember.setAttributeValue2(xb);
        xxMember.setAttributeValue8(phone);
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
