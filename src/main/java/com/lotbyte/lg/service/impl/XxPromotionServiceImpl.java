package com.lotbyte.lg.service.impl;

import com.lotbyte.lg.common.service.impl.BaseServiceImpl;
import com.lotbyte.lg.entity.XxPromotion;
import com.lotbyte.lg.mapper.XxPromotionMapper;
import com.lotbyte.lg.service.XxPromotionService;
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
public class XxPromotionServiceImpl extends BaseServiceImpl<XxPromotionMapper, XxPromotion> implements XxPromotionService {

    @Override
    public List<XxPromotion> queryPromotionsByProductCategoryId(Long productCategoryId) {
        return getBaseMapper().queryPromotionsByProductCategoryId(productCategoryId);
    }
}
