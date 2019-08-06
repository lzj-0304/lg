package com.lotbyte.lg.directive;

import com.lotbyte.lg.entity.XxBrand;
import com.lotbyte.lg.service.XxBrandService;
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
 * 品牌列表
 */
@Component
public class BrandListDirective implements TemplateDirectiveModel {
    /**
     * 变量名称
     */
    private static final String VARIABLE_NAME = "brandList";

    private Logger logger = LoggerFactory.getLogger(BrandListDirective.class);
    @Resource
    private XxBrandService brandService;
    @Override
    public void execute(Environment environment, Map map, TemplateModel[] templateModels, TemplateDirectiveBody templateDirectiveBody) throws TemplateException, IOException {

        Integer count =null;
        if(map.containsKey("count")){
            count=Integer.parseInt(map.get("count").toString());
        }
        Long productCategoryId=null;
        if(map.containsKey("productCategoryId")){
            productCategoryId = Long.parseLong(map.get("productCategoryId").toString());
        }
        List<XxBrand> brandsList =  brandService.queryXxBrandsByProductCategoryId(productCategoryId,count);
        DefaultObjectWrapperBuilder builder = new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_25);
        environment.setVariable(VARIABLE_NAME, builder.build().wrap(brandsList));
        templateDirectiveBody.render(environment.getOut());
    }
}
