package com.lotbyte.lg.service;

import com.lotbyte.lg.common.service.BaseService;
import com.lotbyte.lg.entity.XxProductCategory;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author lotbyte
 * @since 2019-08-05
 */
public interface XxProductCategoryService extends BaseService<XxProductCategory> {

    /**
     *
     * @param parent   上级分类id
     * @param grade    层级数
     * @param limit    返回多少条
     * @return
     */
    public List<XxProductCategory> queryProductCategoriesByParentAndGrade(Integer parent,Integer grade,Integer limit);

}
