package com.lotbyte.lg.shop.controller;


import com.lotbyte.lg.common.web.controller.BaseController;
import com.lotbyte.lg.service.XxAdService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author lotbyte
 * @since 2019-08-02
 */
@RestController
@RequestMapping("ad")
public class XxAdController extends BaseController {
    @Resource
    public XxAdService adService;




}
