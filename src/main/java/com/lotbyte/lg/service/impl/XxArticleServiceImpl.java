package com.lotbyte.lg.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lotbyte.lg.common.service.impl.BaseServiceImpl;
import com.lotbyte.lg.entity.XxArticle;
import com.lotbyte.lg.mapper.XxArticleMapper;
import com.lotbyte.lg.service.XxArticleService;
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
 * @since 2019-08-06
 */
@Service
public class XxArticleServiceImpl extends BaseServiceImpl<XxArticleMapper, XxArticle> implements XxArticleService {

    @Override
    public List<XxArticle> queryXxArticlesByArticleCategoryId(Long articleCategoryId, Integer count) {
        Map<String,Object> params=new HashMap<String,Object>();
        params.put("article_category",articleCategoryId);
        if(null != count){
            return getBaseMapper().selectList(new QueryWrapper<XxArticle>().allEq(params).last(" limit "+count));
        }
        return getBaseMapper().selectList(new QueryWrapper<XxArticle>().allEq(params));
    }
}
