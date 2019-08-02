package com.lotbyte.lg.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class IndexController  {

    @RequestMapping("index")
    public String index(){
        return "shop/index";
    }

    @RequestMapping("login")
    public String login(){
        return "shop/login";
    }

    @RequestMapping("register")
    public String register(HttpServletRequest request){
        request.getSession().setAttribute("ctx",request.getContextPath());

        return "shop/register";
    }
}
