package com.lotbyte.lg.service.impl;

import com.lotbyte.lg.entity.XxGoods;
import com.lotbyte.lg.mapper.XxGoodsMapper;
import com.lotbyte.lg.service.XxGoodsService;
import com.lotbyte.lg.common.service.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author lotbyte
 * @since 2019-08-05
 */
@Service
public class XxGoodsServiceImpl extends BaseServiceImpl<XxGoodsMapper, XxGoods> implements XxGoodsService {

    @Override
    public List<XxGoods> queryGoodsByTagAndProductCategoryId(Integer tag, Long productCategoryId, Integer limit) {
        return getBaseMapper().queryGoodsByTagAndProductCategoryId(tag,productCategoryId,limit);
    }
}
