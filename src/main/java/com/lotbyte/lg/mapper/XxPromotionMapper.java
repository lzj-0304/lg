package com.lotbyte.lg.mapper;

import com.lotbyte.lg.entity.XxPromotion;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author lotbyte
 * @since 2019-08-05
 */
public interface XxPromotionMapper extends BaseMapper<XxPromotion> {

    List<XxPromotion> queryPromotionsByProductCategoryId(@Param("productCategoryId") Long productCategoryId);
}
