package com.lotbyte.lg.configurers;

import com.lotbyte.lg.directive.ProductCategoryRootListDirective;
import freemarker.template.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component
public class ProductCategroyRootListConfig {
    @Autowired
    Configuration configuration;
    @Autowired
    private ProductCategoryRootListDirective productCategoryRootListDirective;
    @PostConstruct
    public void setSharedVariable(){
        // 将标签注册到配置文件
        configuration.setSharedVariable("product_category_root_List", productCategoryRootListDirective);
    }
}
