package com.lotbyte.lg.directive;

import com.lotbyte.lg.entity.XxGoods;
import com.lotbyte.lg.service.XxGoodsService;
import freemarker.core.Environment;
import freemarker.template.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;
import java.util.Map;


/**
 * 热销商品
 */
@Component
public class GoodsListDirective implements TemplateDirectiveModel {
    /**
     * 变量名称
     */
    private static final String VARIABLE_NAME = "goodsList";

    private Logger logger = LoggerFactory.getLogger(GoodsListDirective.class);
    @Resource
    private XxGoodsService goodsService;
    @Override
    public void execute(Environment environment, Map map, TemplateModel[] templateModels, TemplateDirectiveBody templateDirectiveBody) throws TemplateException, IOException {
        Long productCategoryId=Long.parseLong(map.get("productCategoryId").toString());
        Integer tag=Integer.parseInt(map.get("tag").toString());
        Integer count=null;
        if(map.containsKey("count")){
           count= Integer.parseInt(map.get("count").toString());
        }
        List<XxGoods> goodsList =  goodsService.queryGoodsByTagAndProductCategoryId(tag,productCategoryId,count);
        DefaultObjectWrapperBuilder builder = new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_25);
        environment.setVariable(VARIABLE_NAME, builder.build().wrap(goodsList));
        templateDirectiveBody.render(environment.getOut());
    }
}
