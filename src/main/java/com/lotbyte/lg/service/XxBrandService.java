package com.lotbyte.lg.service;

import com.lotbyte.lg.common.service.BaseService;
import com.lotbyte.lg.entity.XxBrand;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author lotbyte
 * @since 2019-08-05
 */
public interface XxBrandService extends BaseService<XxBrand> {
    public List<XxBrand> queryXxBrandsByProductCategoryId(Long id, Integer limit);

}
