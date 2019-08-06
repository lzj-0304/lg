package com.lotbyte.lg.configurers;

import com.lotbyte.lg.directive.GoodsListDirective;
import freemarker.template.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component
public class GoodsListConfig {
    @Autowired
    Configuration configuration;
    @Autowired
    private GoodsListDirective goodsListDirective;
    @PostConstruct
    public void setSharedVariable(){
        // 将标签注册到配置文件
        configuration.setSharedVariable("goods_List", goodsListDirective);
    }
}
