package com.lotbyte.lg.service;

import com.lotbyte.lg.common.service.BaseService;
import com.lotbyte.lg.entity.XxPromotion;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author lotbyte
 * @since 2019-08-05
 */
public interface XxPromotionService extends BaseService<XxPromotion> {
    public List<XxPromotion> queryPromotionsByProductCategoryId(@Param("productCategoryId") Long productCategoryId);

}
