package com.lotbyte.lg.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lotbyte.lg.entity.XxGoods;
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
public interface XxGoodsMapper extends BaseMapper<XxGoods> {
    public List<XxGoods> queryGoodsByTagAndProductCategoryId(@Param("tag") Integer tag,@Param("productCategoryId") Long productCategoryId,@Param("limit") Integer limit);

}
