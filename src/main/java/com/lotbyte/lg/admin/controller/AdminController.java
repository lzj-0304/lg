package com.lotbyte.lg.admin.controller;

import com.lotbyte.lg.common.util.ResultInfo;
import com.lotbyte.lg.common.web.controller.BaseController;
import com.lotbyte.lg.sdk.GeetestConfig;
import com.lotbyte.lg.sdk.GeetestLib;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

@Controller
@RequestMapping("admin")
public class AdminController extends BaseController {

    @RequestMapping("login")
    public String login(){
        return "admin/test02" ;
    }


    @RequestMapping("main")
    public String main(){
        return "admin/main" ;
    }


    @RequestMapping("index")
    public String index(){
        return "admin/index" ;
    }




    @RequestMapping("register")
    @ResponseBody
    public String register(HttpServletRequest request){
        GeetestLib gtSdk = new GeetestLib(GeetestConfig.getGeetest_id(), GeetestConfig.getGeetest_key(),
                GeetestConfig.isnewfailback());
        String resStr = "{}";
        //自定义userid
        String userid = "test";
        //自定义参数,可选择添加
        HashMap<String, String> param = new HashMap<String, String>();
        param.put("client_type", "web"); //web:电脑上的浏览器；h5:手机上的浏览器，包括移动应用内完全内置的web_view；native：通过原生SDK植入APP应用的方式
        param.put("ip_address", "127.0.0.1"); //传输用户请求验证时所携带的IP
        //进行验证预处理
        int gtServerStatus = gtSdk.preProcess(param);
        //将服务器状态设置到session中
        request.getSession().setAttribute(gtSdk.gtServerStatusSessionKey, gtServerStatus);
        //将userid设置到session中
        resStr = gtSdk.getResponseStr();
        return resStr;
    }

    @RequestMapping("validate")
    @ResponseBody
    @SuppressWarnings("all")
    public ResultInfo validate(HttpServletRequest request){
        try {
            GeetestLib gtSdk = new GeetestLib(GeetestConfig.getGeetest_id(), GeetestConfig.getGeetest_key(),
                    GeetestConfig.isnewfailback());
            String challenge = request.getParameter(GeetestLib.fn_geetest_challenge);
            String validate = request.getParameter(GeetestLib.fn_geetest_validate);
            String seccode = request.getParameter(GeetestLib.fn_geetest_seccode);
            //从session中获取gt-server状态
            int gt_server_status_code = (Integer) request.getSession().getAttribute(gtSdk.gtServerStatusSessionKey);
            //自定义参数,可选择添加
            HashMap<String, String> param = new HashMap<String, String>();
            param.put("client_type", "web"); //web:电脑上的浏览器；h5:手机上的浏览器，包括移动应用内完全内置的web_view；native：通过原生SDK植入APP应用的方式
            param.put("ip_address", "127.0.0.1"); //传输用户请求验证时所携带的IP
            int gtResult = 0;
            if (gt_server_status_code == 1) {
                //gt-server正常，向gt-server进行二次验证
                gtResult = gtSdk.enhencedValidateRequest(challenge, validate, seccode, param);
            } else {
                // gt-server非正常情况下，进行failback模式验证
                gtResult = gtSdk.failbackValidateRequest(challenge, validate, seccode);
            }
            ResultInfo resultInfo=new ResultInfo();
            if (gtResult == 0) {
                resultInfo.setCode(200);
                resultInfo.setMsg("验证失败");
            }
            return resultInfo;
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }
}
