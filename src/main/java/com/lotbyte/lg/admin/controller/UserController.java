package com.lotbyte.lg.admin.controller;

import com.lotbyte.lg.common.web.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("admin/user")
public class UserController extends BaseController {
    @RequestMapping("index")
    public  String index(){
        return "admin/user/userList";
    }
}
