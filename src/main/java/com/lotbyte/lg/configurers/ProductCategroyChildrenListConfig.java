package com.lotbyte.lg.configurers;

import com.lotbyte.lg.directive.ProductCategoryChildrenListDirective;
import freemarker.template.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component
public class ProductCategroyChildrenListConfig {
    @Autowired
    Configuration configuration;
    @Autowired
    private ProductCategoryChildrenListDirective productCategroyChildrenListDirective;
    @PostConstruct
    public void setSharedVariable(){
        // 将标签注册到配置文件
        configuration.setSharedVariable("product_category_children_List", productCategroyChildrenListDirective);
    }
}
