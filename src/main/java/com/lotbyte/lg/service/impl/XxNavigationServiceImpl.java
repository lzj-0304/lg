package com.lotbyte.lg.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lotbyte.lg.entity.XxNavigation;
import com.lotbyte.lg.mapper.XxNavigationMapper;
import com.lotbyte.lg.service.XxNavigationService;
import com.lotbyte.lg.common.service.impl.BaseServiceImpl;
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
public class XxNavigationServiceImpl extends BaseServiceImpl<XxNavigationMapper, XxNavigation> implements XxNavigationService {

    @Autowired
    private XxNavigationMapper navigationMapper;
    @Override
    public List<XxNavigation> queryXxNavigationsByPosition(Integer position) {
        Map<String,Object> params=new HashMap<String,Object>();
        params.put("position",position);
        return navigationMapper.selectList(new QueryWrapper<XxNavigation>().allEq(params));
    }
}
