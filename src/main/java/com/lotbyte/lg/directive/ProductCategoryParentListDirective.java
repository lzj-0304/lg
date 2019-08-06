package com.lotbyte.lg.directive;

import com.lotbyte.lg.entity.XxProductCategory;
import com.lotbyte.lg.service.XxProductCategoryService;
import freemarker.core.Environment;
import freemarker.template.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;
import java.util.Map;


/**
 * 商品分类-一级菜单  根据顶级菜单id 查询
 */
@Component
public class ProductCategoryParentListDirective implements TemplateDirectiveModel {
    /**
     * 变量名称
     */
    private static final String VARIABLE_NAME = "productCategoryParentList";

    private Logger logger = LoggerFactory.getLogger(ProductCategoryParentListDirective.class);
    @Resource
    private XxProductCategoryService  productCategoryService;
    @Override
    public void execute(Environment environment, Map map, TemplateModel[] templateModels, TemplateDirectiveBody templateDirectiveBody) throws TemplateException, IOException {
        Integer count =null;
        if(map.containsKey("count")){
            count = Integer.parseInt(map.get("count").toString());
        }
        Integer parentId=Integer.parseInt(map.get("parentId").toString());
        List<XxProductCategory> rootList =  productCategoryService.queryProductCategoriesByParentAndGrade(parentId,1,count);
        DefaultObjectWrapperBuilder builder = new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_25);
        environment.setVariable(VARIABLE_NAME, builder.build().wrap(rootList));
        templateDirectiveBody.render(environment.getOut());
    }
}
