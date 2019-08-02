package com.lotbyte.lg.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.lotbyte.lg.entity.XxMember;
import com.lotbyte.lg.mapper.XxMemberMapper;
import com.lotbyte.lg.service.XxMemberService;
import com.lotbyte.lg.common.service.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author lotbyte
 * @since 2019-08-01
 */
@Service
public class XxMemberServiceImpl extends BaseServiceImpl<XxMemberMapper, XxMember> implements XxMemberService {

    @Override
    public Boolean queryUserByName(String username) {
        if (StringUtils.isEmpty(username)) {
            return false;
        }
        Integer count = getBaseMapper().selectCount(new QueryWrapper<XxMember>().ge("username", username));
        System.out.println(count);
        return count==0;
    }
}
