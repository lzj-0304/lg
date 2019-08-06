package com.lotbyte.lg.directive;

import com.lotbyte.lg.entity.XxArticle;
import com.lotbyte.lg.service.XxArticleService;
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
 * 文章
 */
@Component
public class ArticleListDirective implements TemplateDirectiveModel {
    /**
     * 变量名称
     */
    private static final String VARIABLE_NAME = "articleList";

    private Logger logger = LoggerFactory.getLogger(ArticleListDirective.class);
    @Resource
    private XxArticleService articleService;
    @Override
    @SuppressWarnings("all")
    public void execute(Environment environment, Map map, TemplateModel[] templateModels, TemplateDirectiveBody templateDirectiveBody) throws TemplateException, IOException {
        Integer count = null;
        if(map.containsKey("count")){
            count = Integer.parseInt(map.get("count").toString());
        }
        Long articleCategoryId=Long.parseLong(map.get("articleCategoryId").toString());
        List<XxArticle> rootList =  articleService.queryXxArticlesByArticleCategoryId(articleCategoryId,count);
        DefaultObjectWrapperBuilder builder = new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_25);
        environment.setVariable(VARIABLE_NAME, builder.build().wrap(rootList));
        templateDirectiveBody.render(environment.getOut());
    }
}
