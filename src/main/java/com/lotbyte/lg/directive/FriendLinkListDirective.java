package com.lotbyte.lg.directive;

import com.lotbyte.lg.entity.XxFriendLink;
import com.lotbyte.lg.service.XxFriendLinkService;
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
public class FriendLinkListDirective implements TemplateDirectiveModel {
    /**
     * 变量名称
     */
    private static final String VARIABLE_NAME = "friendLinkList";

    private Logger logger = LoggerFactory.getLogger(FriendLinkListDirective.class);
    @Resource
    private XxFriendLinkService friendLinkService;
    @Override
    public void execute(Environment environment, Map map, TemplateModel[] templateModels, TemplateDirectiveBody templateDirectiveBody) throws TemplateException, IOException {
        Integer type = Integer.parseInt(map.get("type").toString());
        List<XxFriendLink> list = friendLinkService.queryXxFriendLinks(type);
        DefaultObjectWrapperBuilder builder = new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_25);
        environment.setVariable(VARIABLE_NAME, builder.build().wrap(list));
        templateDirectiveBody.render(environment.getOut());
    }
}
