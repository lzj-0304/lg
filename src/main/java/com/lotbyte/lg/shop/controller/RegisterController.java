package com.lotbyte.lg.shop.controller;

import com.lotbyte.lg.common.util.ResultInfo;
import com.lotbyte.lg.service.XxMemberService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Administrator on 2019/8/1.
 */
@Slf4j
@Controller
@RequestMapping("register")
public class RegisterController{

    @Autowired
    private XxMemberService memberService;

    /**
     * 检查用户名是否被禁用或已存在
     */
    @RequestMapping("/check")
    @ResponseBody
    public Boolean checkUserRegister(HttpServletRequest request) {

        return memberService.checkUserRegister(request);
    }


    /**
     * 检查用户名是否被禁用或已存在
     */
    @RequestMapping(value = "/login/check_username")
    @ResponseBody
    public boolean loginCheckUserName(String username) {

        return memberService.loginCountUserByName(username);
    }

    /**
     * 使用Get的方式返回challenge和capthca_id,此方式以实现前后端完全分离的开发模式
     */
    @RequestMapping("/login/gt/startCaptcha")
    @ResponseBody
    public String loginStartCaptcha(HttpServletRequest request, HttpServletResponse response) throws Exception{
        return memberService.startCaptcha(request,response);
    }


    @RequestMapping("/login/verifyLogin")
    @ResponseBody
    public ResultInfo loginVerifyLogin(HttpServletRequest request, HttpServletResponse response) throws Exception{

        return memberService.loginVerifyLogin(request,response);
    }


    /**
     * 使用Get的方式返回challenge和capthca_id,此方式以实现前后端完全分离的开发模式
     */
    @RequestMapping("/gt/startCaptcha")
    @ResponseBody
    public String startCaptcha(HttpServletRequest request, HttpServletResponse response) throws Exception{
        return memberService.startCaptcha(request,response);
    }

    /**
     * 使用post方式，返回验证结果, request表单中必须包含challenge, validate, seccode
     */
    @RequestMapping("/verifyLogin")
    @ResponseBody
    public ResultInfo verifyLogin(HttpServletRequest request, HttpServletResponse response) throws Exception{

        return memberService.verifyLogin(request,response);
    }



    //找回密码

    /**
     * 校验短信码，修改密码
     * @param
     * @return
     */
    @RequestMapping("/updatePassword")
    @ResponseBody
    public ResultInfo updatePassword(HttpServletRequest request, HttpServletResponse response) {
        return memberService.updatePassword(request,response);
    }

    /**
     * 发送短信验证码
     * @param phone
     * @param
     * @return
     */
    @RequestMapping("/sendMsg")
    @ResponseBody
    public ResultInfo sendMsg(HttpServletRequest request, String phone) {
        return memberService.sendMsg(request,phone);
    }


    /**
     * 发送短信验证码
     * @param
     * @param
     * @return
     */
    @RequestMapping("/check_JY")
    @ResponseBody
    public ResultInfo checkJY(HttpServletRequest request, HttpServletResponse response) {
        return memberService.checkJY(request,response);
    }


    /**
     * 找回密码（手机号判断用户是否存在）
     * @param phone
     * @return
     */
    @RequestMapping("/find_CheckPhone")
    @ResponseBody
    public Boolean findCheckPhone(String phone) {
        return memberService.findCountUserByPhone(phone);
    }

}

