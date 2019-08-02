package com.lotbyte.lg.configurers;

import com.lotbyte.lg.directive.NavigationListDirective;
import freemarker.template.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component
public class NavigationListConfig  {
    @Autowired
    Configuration configuration;
    @Autowired
    private NavigationListDirective navigationListDirective;
    @PostConstruct
    public void setSharedVariable(){
        // 将标签注册到配置文件
        configuration.setSharedVariable("navigation_list", navigationListDirective);
    }
}
