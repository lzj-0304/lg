package com.lotbyte.lg.shop.base;

import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpServletRequest;

public class BaseController {

    @ModelAttribute
    public void preHandler(HttpServletRequest request){
        request.setAttribute("base",request.getContextPath());
        request.setAttribute("theme","default");
    }
}
