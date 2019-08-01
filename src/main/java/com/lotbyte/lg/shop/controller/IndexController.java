package com.lotbyte.lg.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public String register(){
        return "shop/register";
    }
}
