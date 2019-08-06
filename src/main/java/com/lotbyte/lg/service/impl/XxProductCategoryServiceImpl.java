package com.lotbyte.lg.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lotbyte.lg.common.service.impl.BaseServiceImpl;
import com.lotbyte.lg.entity.XxProductCategory;
import com.lotbyte.lg.mapper.XxProductCategoryMapper;
import com.lotbyte.lg.service.XxProductCategoryService;
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
 * @since 2019-08-05
 */
@Service
public class XxProductCategoryServiceImpl extends BaseServiceImpl<XxProductCategoryMapper, XxProductCategory> implements XxProductCategoryService {


    @Override
    public List<XxProductCategory> queryProductCategoriesByParentAndGrade(Integer parent, Integer grade, Integer limit) {
        Map<String,Object> params=new HashMap<String,Object>();
        params.put("parent",parent);
        params.put("grade",grade);
        if(null !=limit){
            return getBaseMapper().selectList(new QueryWrapper<XxProductCategory>().allEq(params).last(" limit "+limit));
        }
        return getBaseMapper().selectList(new QueryWrapper<XxProductCategory>().allEq(params));

    }
}
