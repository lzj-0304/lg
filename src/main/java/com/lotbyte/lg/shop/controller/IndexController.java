package com.lotbyte.lg.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController  {

    @RequestMapping("index")
    public String index(){
        System.out.println("主页面...123456");
        return "shop/index";
    }

    @RequestMapping("login")
    public String login(){
        return "shop/login";
    }

    @RequestMapping("register")
    public String register(){
        return "shop/register";
    }
}
