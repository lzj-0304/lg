package com.lotbyte.lg.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lotbyte.lg.common.service.impl.BaseServiceImpl;
import com.lotbyte.lg.entity.XxAd;
import com.lotbyte.lg.mapper.XxAdMapper;
import com.lotbyte.lg.service.XxAdService;
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
public class XxAdServiceImpl extends BaseServiceImpl<XxAdMapper, XxAd> implements XxAdService {

    @Override
    public List<XxAd> queryAdListByType(Integer type,Integer position) {
        Map<String,Object> params=new HashMap<String,Object>();
        params.put("ad_position",position);
        params.put("type",type);
        return getBaseMapper().selectList(new QueryWrapper<XxAd>().allEq(params).orderByAsc("orders"));
    }
}
