package com.lotbyte.lg.directive;

import com.lotbyte.lg.entity.XxPromotion;
import com.lotbyte.lg.service.XxPromotionService;
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
 * 促销商品
 */
@Component
public class PromotionDirective implements TemplateDirectiveModel {
    /**
     * 变量名称
     */
    private static final String VARIABLE_NAME = "promotionList";

    private Logger logger = LoggerFactory.getLogger(PromotionDirective.class);
    @Resource
    private XxPromotionService promotionService;
    @Override
    public void execute(Environment environment, Map map, TemplateModel[] templateModels, TemplateDirectiveBody templateDirectiveBody) throws TemplateException, IOException {
        Long productCategoryId=Long.parseLong(map.get("productCategoryId").toString());
        List<XxPromotion> rootList =  promotionService.queryPromotionsByProductCategoryId(productCategoryId);
        DefaultObjectWrapperBuilder builder = new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_25);
        environment.setVariable(VARIABLE_NAME, builder.build().wrap(rootList));
        templateDirectiveBody.render(environment.getOut());
    }
}
