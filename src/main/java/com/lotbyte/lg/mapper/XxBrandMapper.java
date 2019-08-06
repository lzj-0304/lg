package com.lotbyte.lg.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lotbyte.lg.entity.XxBrand;
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
public interface XxBrandMapper extends BaseMapper<XxBrand> {

    public List<XxBrand> queryXxBrandsByProductCategoryId(@Param("productCategoryId") Long id,@Param("limit") Integer limit);

}
