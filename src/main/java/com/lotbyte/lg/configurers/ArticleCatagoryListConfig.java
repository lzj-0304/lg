package com.lotbyte.lg.configurers;

import com.lotbyte.lg.directive.ArticleCategoryListDirective;
import freemarker.template.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component
public class ArticleCatagoryListConfig {
    @Autowired
    Configuration configuration;
    @Autowired
    private ArticleCategoryListDirective articleCategoryListDirective;
    @PostConstruct
    public void setSharedVariable(){
        // 将标签注册到配置文件
        configuration.setSharedVariable("article_category_list", articleCategoryListDirective);
    }
}
