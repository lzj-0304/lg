package com.lotbyte.lg.service;

import com.lotbyte.lg.common.service.BaseService;
import com.lotbyte.lg.common.util.ResultInfo;
import com.lotbyte.lg.entity.XxMember;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author lotbyte
 * @since 2019-08-01
 */
public interface XxMemberService extends BaseService<XxMember> {
    //注册校验
    public boolean checkUserRegister(HttpServletRequest request) ;
    //注册加载验证码
    public String startCaptcha(HttpServletRequest request, HttpServletResponse response);
    //注册二次校验验证码并创建新用户
    public ResultInfo verifyLogin(HttpServletRequest request, HttpServletResponse response);
    //注册新用户
    public ResultInfo userRegister(HttpServletRequest request, HttpServletResponse response);

    //登录根据用户名查找用户是否存在
    public Boolean loginCountUserByName(String username);
    //登录验证
    public ResultInfo loginVerifyLogin(HttpServletRequest request, HttpServletResponse response);

    //校验验证码
    public ResultInfo checkJY(HttpServletRequest request, HttpServletResponse response);
    //发送验证
    public ResultInfo sendMsg(HttpServletRequest httpServletRequest, String phoneNum);
    //找回密码
    public ResultInfo updatePassword(HttpServletRequest request, HttpServletResponse response);
    //根据phone查找用户是否存在
    public Boolean findCountUserByPhone(String phone);
}
