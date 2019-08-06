package com.lotbyte.lg.configurers;

import com.lotbyte.lg.directive.BrandListDirective;
import freemarker.template.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component
public class BrandListConfig {
    @Autowired
    Configuration configuration;
    @Autowired
    private BrandListDirective brandListDirective;
    @PostConstruct
    public void setSharedVariable(){
        // 将标签注册到配置文件
        configuration.setSharedVariable("brand_list", brandListDirective);
    }
}
