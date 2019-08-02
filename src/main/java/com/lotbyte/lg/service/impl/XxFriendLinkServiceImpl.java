package com.lotbyte.lg.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lotbyte.lg.common.service.impl.BaseServiceImpl;
import com.lotbyte.lg.entity.XxFriendLink;
import com.lotbyte.lg.mapper.XxFriendLinkMapper;
import com.lotbyte.lg.service.XxFriendLinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author lotbyte
 * @since 2019-08-02
 */
@Service
public class XxFriendLinkServiceImpl extends BaseServiceImpl<XxFriendLinkMapper, XxFriendLink> implements XxFriendLinkService {

    @Autowired
    private XxFriendLinkMapper friendLinkMapper;
    @Override
    public List<XxFriendLink> queryXxFriendLinks(Integer type) {
        Map<String,Object> params=new HashMap<String,Object>();
        params.put("type",type);
        return friendLinkMapper.selectList(new QueryWrapper<XxFriendLink>().orderByAsc("orders"));
    }
}
