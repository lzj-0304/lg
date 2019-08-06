package com.lotbyte.lg.configurers;

import com.lotbyte.lg.directive.ArticleListDirective;
import freemarker.template.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component
public class ArticleListConfig {
    @Autowired
    Configuration configuration;
    @Autowired
    private ArticleListDirective articleListDirective;
    @PostConstruct
    public void setSharedVariable(){
        // 将标签注册到配置文件
        configuration.setSharedVariable("article_list", articleListDirective);
    }
}
