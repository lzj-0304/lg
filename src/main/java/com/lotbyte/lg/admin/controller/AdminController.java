package com.lotbyte.lg.admin.controller;

import com.lotbyte.lg.common.web.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminController extends BaseController {

    @RequestMapping("login")
    public String login(){
        return "admin/login" ;
    }


    @RequestMapping("main")
    public String main(){
        return "admin/main" ;
    }


    @RequestMapping("index")
    public String index(){
        return "admin/index" ;
    }
}
