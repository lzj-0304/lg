package com.lotbyte.lg.shop.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lotbyte.lg.entity.XxMember;
import com.lotbyte.lg.service.XxMemberService;
import org.springframework.web.bind.annotation.*;

import com.lotbyte.lg.common.web.controller.BaseController;

import javax.annotation.Resource;
import java.lang.reflect.Member;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author lotbyte
 * @since 2019-08-01
 */
@RestController
public class XxMemberController extends BaseController {

    @Resource
    private XxMemberService memberService;


    @GetMapping("member/{mid}")
    @ResponseBody
    public XxMember queryXxmember(@PathVariable Long mid){
        return memberService.getById(1L);
    }

    @PutMapping("member")
    @ResponseBody
    public Boolean save(XxMember member){
        return memberService.save(member);
    }

    @PostMapping("member")
    @ResponseBody
    public Boolean update(XxMember member){
        return memberService.updateById(member);
    }


    @DeleteMapping("member/{mid}")
    @ResponseBody
    public Boolean delete(@PathVariable  Long  mid){
        return memberService.removeById(mid);
    }


}
