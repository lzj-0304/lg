package com.lotbyte.lg.directive;

import com.lotbyte.lg.entity.XxNavigation;
import com.lotbyte.lg.service.XxNavigationService;
import freemarker.core.Environment;
import freemarker.template.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Component
public class NavigationListDirective implements TemplateDirectiveModel {
    /**
     * 变量名称
     */
    private static final String VARIABLE_NAME = "navigations";

    private Logger logger = LoggerFactory.getLogger(NavigationListDirective.class);
    @Resource
    private XxNavigationService navigationService;

    @Override
    public void execute(Environment environment, Map map, TemplateModel[] templateModels, TemplateDirectiveBody templateDirectiveBody) throws TemplateException, IOException {
        Integer position = Integer.parseInt(map.get("position").toString());
        List<XxNavigation> list = navigationService.queryXxNavigationsByPosition(position);
        DefaultObjectWrapperBuilder builder = new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_25);
        environment.setVariable(VARIABLE_NAME, builder.build().wrap(list));
        templateDirectiveBody.render(environment.getOut());
    }
}
