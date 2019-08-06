package com.lotbyte.lg.service.impl;

import com.lotbyte.lg.common.service.impl.BaseServiceImpl;
import com.lotbyte.lg.entity.XxBrand;
import com.lotbyte.lg.mapper.XxBrandMapper;
import com.lotbyte.lg.service.XxBrandService;
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
public class XxBrandServiceImpl extends BaseServiceImpl<XxBrandMapper, XxBrand> implements XxBrandService {
    public List<XxBrand> queryXxBrandsByProductCategoryId( Long id, Integer limit){
        return getBaseMapper().queryXxBrandsByProductCategoryId(id,limit);
    }
}
