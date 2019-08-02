package com.lotbyte.lg.shop.controller;


import com.lotbyte.lg.common.web.controller.BaseController;
import com.lotbyte.lg.entity.XxNavigation;
import com.lotbyte.lg.service.XxNavigationService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;


/**
 * <p>
 *  前端控制器-页面底部导航链接
 * </p>
 *
 * @author lotbyte
 * @since 2019-08-02
 */
@RequestMapping("navigation")
@RestController
public class XxNavigationController extends BaseController {

    @Resource
    private XxNavigationService navigationService;
    @RequestMapping("queryXxNavigationsByPosition")
    public List<XxNavigation> queryXxNavigationsByPosition(Integer position){
        return navigationService.queryXxNavigationsByPosition(position);
    }

}
