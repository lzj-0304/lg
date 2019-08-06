package com.lotbyte.lg.admin.controller;

import com.lotbyte.lg.common.web.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("admin/role")
public class RoleController extends BaseController {
    @RequestMapping("index")
    public  String index(){
        return "admin/role/roleList";
    }
}
