package com.lotbyte.lg.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lotbyte.lg.entity.XxArticleCategory;
import com.lotbyte.lg.mapper.XxArticleCategoryMapper;
import com.lotbyte.lg.service.XxArticleCategoryService;
import com.lotbyte.lg.common.service.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author lotbyte
 * @since 2019-08-06
 */
@Service
public class XxArticleCategoryServiceImpl extends BaseServiceImpl<XxArticleCategoryMapper, XxArticleCategory> implements XxArticleCategoryService {

    @Override
    public List<XxArticleCategory> queryXxArticleCategories(Integer limit) {
        if(null==limit){
           return getBaseMapper().selectList(new QueryWrapper<XxArticleCategory>());
        }else{
           return getBaseMapper().selectList(new QueryWrapper<XxArticleCategory>().last( "limit "+limit));
        }
    }
}
