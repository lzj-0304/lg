package com.lotbyte.lg.shop.controller;

import com.lotbyte.lg.common.util.ResultInfo;
import com.lotbyte.lg.service.XxMemberService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
    @RequestMapping(value = "/check_username")
    @ResponseBody
    public boolean checkUserName(String username) {

        return memberService.countUserByName(username);
    }

    /**
     * 检查email是否存在
     */
    @RequestMapping(value = "/check_email")
    @ResponseBody
    public boolean checkEmail(String email) {

        return memberService.countUserByemail(email);
    }


    /**
     * 检查手机号是否存在
     */
    @RequestMapping(value = "/check_phone")
    @ResponseBody
    public boolean checkPhone(@RequestParam(name = "phone") String phone) {
        log.info("检查手机号");
        return memberService.countUserByPhone(phone);
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
     * 发送短信验证码
     * @param phone
     * @return
     */
    @RequestMapping("/sendMsg")
    @ResponseBody
    public ResultInfo sendMsg(HttpServletRequest httpServletRequest,String phone) {
        return memberService.sendMsg(httpServletRequest,phone);
    }

    /**
     * 校验短信码，修改密码
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/findPassword")
    @ResponseBody
    public ResultInfo findPassword(HttpServletRequest request, HttpServletResponse response) {
        return memberService.findPassword(request,response);
    }


    @RequestMapping("/find_CheckPhone")
    @ResponseBody
    public Boolean findCheckPhone(String phone) {
        return memberService.findCountUserByPhone(phone);
    }

}

