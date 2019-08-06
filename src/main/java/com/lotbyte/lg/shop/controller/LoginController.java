package com.lotbyte.lg.shop.controller;

import com.lotbyte.lg.common.util.ResultInfo;
import com.lotbyte.lg.service.XxMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("login")
public class LoginController {

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
     * 使用Get的方式返回challenge和capthca_id,此方式以实现前后端完全分离的开发模式
     */
    @RequestMapping("/gt/startCaptcha")
    @ResponseBody
    public String loginStartCaptcha(HttpServletRequest request, HttpServletResponse response) throws Exception{
        return memberService.startCaptcha(request,response);
    }

    /**
     * 使用post方式，返回验证结果, request表单中必须包含challenge, validate, seccode
     */
    @RequestMapping("/verifyLogin")
    @ResponseBody
    public ResultInfo loginVerifyLogin(HttpServletRequest request, HttpServletResponse response) throws Exception{

        return memberService.loginVerifyLogin(request,response);
    }
}
