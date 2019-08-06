package com.lotbyte.lg.configurers;

import com.lotbyte.lg.directive.ProductCategoryParentListDirective;
import freemarker.template.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component
public class ProductCategroyParentListConfig {
    @Autowired
    Configuration configuration;
    @Autowired
    private ProductCategoryParentListDirective productCategroyParentListDirective;
    @PostConstruct
    public void setSharedVariable(){
        // 将标签注册到配置文件
        configuration.setSharedVariable("product_category_parent_List", productCategroyParentListDirective);
    }
}
