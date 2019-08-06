package com.lotbyte.lg.service;

import com.lotbyte.lg.entity.XxArticle;
import com.lotbyte.lg.common.service.BaseService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author lotbyte
 * @since 2019-08-06
 */
public interface XxArticleService extends BaseService<XxArticle> {

    List<XxArticle> queryXxArticlesByArticleCategoryId(Long articleCategoryId, Integer count);
}
