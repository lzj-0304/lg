package com.lotbyte.lg.service;

import com.lotbyte.lg.common.service.BaseService;
import com.lotbyte.lg.entity.XxGoods;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author lotbyte
 * @since 2019-08-05
 */
public interface XxGoodsService extends BaseService<XxGoods> {
    public List<XxGoods> queryGoodsByTagAndProductCategoryId( Integer tag, Long productCategoryId,  Integer limit);

}
