package com.lotbyte.lg.directive;

import com.lotbyte.lg.entity.XxArticleCategory;
import com.lotbyte.lg.service.XxArticleCategoryService;
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
 * 文章类别
 */
@Component
public class ArticleCategoryListDirective implements TemplateDirectiveModel {
    /**
     * 变量名称
     */
    private static final String VARIABLE_NAME = "articleCategoryList";

    private Logger logger = LoggerFactory.getLogger(ArticleCategoryListDirective.class);
    @Resource
    private XxArticleCategoryService articleCategoryService;
    @Override
    @SuppressWarnings("all")
    public void execute(Environment environment, Map map, TemplateModel[] templateModels, TemplateDirectiveBody templateDirectiveBody) throws TemplateException, IOException {
        Integer count = null;
        if(map.containsKey("count")){
            count = Integer.parseInt(map.get("count").toString());
        }
        List<XxArticleCategory> rootList =  articleCategoryService.queryXxArticleCategories(count);
        DefaultObjectWrapperBuilder builder = new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_25);
        environment.setVariable(VARIABLE_NAME, builder.build().wrap(rootList));
        templateDirectiveBody.render(environment.getOut());
    }
}
