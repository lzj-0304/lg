package com.lotbyte.lg.configurers;

import com.lotbyte.lg.directive.AdListDirective;
import freemarker.template.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component
public class AdLinkListConfig {
    @Autowired
    Configuration configuration;
    @Autowired
    private AdListDirective adListDirective;
    @PostConstruct
    public void setSharedVariable(){
        // 将标签注册到配置文件
        configuration.setSharedVariable("ad_list", adListDirective);
    }
}
