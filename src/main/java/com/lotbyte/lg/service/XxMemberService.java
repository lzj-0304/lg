package com.lotbyte.lg.service;

import com.lotbyte.lg.entity.XxMember;
import com.lotbyte.lg.common.service.BaseService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author lotbyte
 * @since 2019-08-01
 */
public interface XxMemberService extends BaseService<XxMember> {

    public Boolean queryUserByName(String username);

}
