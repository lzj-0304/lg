package com.lotbyte.lg.configurers;

import com.lotbyte.lg.directive.PromotionDirective;
import freemarker.template.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component
public class PromotionListConfig {
    @Autowired
    Configuration configuration;
    @Autowired
    private PromotionDirective promotionDirective;
    @PostConstruct
    public void setSharedVariable(){
        // 将标签注册到配置文件
        configuration.setSharedVariable("promotion_List", promotionDirective);
    }
}
