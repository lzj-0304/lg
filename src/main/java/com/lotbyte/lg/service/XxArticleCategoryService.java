package com.lotbyte.lg.service;

import com.lotbyte.lg.common.service.BaseService;
import com.lotbyte.lg.entity.XxArticleCategory;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author lotbyte
 * @since 2019-08-06
 */
public interface XxArticleCategoryService extends BaseService<XxArticleCategory> {

    public List<XxArticleCategory> queryXxArticleCategories(Integer limit);

}
