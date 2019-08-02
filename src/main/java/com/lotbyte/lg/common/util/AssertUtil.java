package com.lotbyte.lg.common.util;


import com.lotbyte.lg.common.exception.LoginException;
import com.lotbyte.lg.common.exception.ParamException;

/**
 * Created by xlf on 2018/8/20.
 */
public class AssertUtil {

    public static void isTrue(Boolean flag, String msg){
        if(flag){
            throw new ParamException(msg);
        }
    }

    public static void isTrue(Boolean flag, String msg, Integer code){
        if(flag){
            throw new ParamException(code, msg);
        }
    }

    public static void isNotLogin(Boolean flag, String msg){
        if(flag){
            throw new LoginException(msg);
        }
    }
}
