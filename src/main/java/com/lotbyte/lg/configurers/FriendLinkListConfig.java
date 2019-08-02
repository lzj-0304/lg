package com.lotbyte.lg.configurers;

import com.lotbyte.lg.directive.FriendLinkListDirective;
import freemarker.template.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component
public class FriendLinkListConfig {
    @Autowired
    Configuration configuration;
    @Autowired
    private FriendLinkListDirective friendLinkListDirective;
    @PostConstruct
    public void setSharedVariable(){
        // 将标签注册到配置文件
        configuration.setSharedVariable("friend_link_list", friendLinkListDirective);
    }
}
