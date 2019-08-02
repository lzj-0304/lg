package com.lotbyte.lg.directive;

import com.lotbyte.lg.entity.XxAdPosition;
import com.lotbyte.lg.service.XxAdPositionService;
import freemarker.core.Environment;
import freemarker.template.Template;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import javax.annotation.Resource;
import java.io.IOException;
import java.io.StringReader;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

@Component
public class AdListDirective extends BaseDirective {

    /**
     * 变量名称
     */
    private static final String VARIABLE_NAME = "adList";

    private Logger logger = LoggerFactory.getLogger(FriendLinkListDirective.class);

    @Resource
    private XxAdPositionService adPositionService;

    @Resource
    private FreeMarkerConfigurer freeMarkerConfigurer;

    @Override
    public void execute(Environment environment, Map map, TemplateModel[] templateModels, TemplateDirectiveBody templateDirectiveBody) throws TemplateException, IOException {
        Integer position = Integer.parseInt(map.get("position").toString());
        XxAdPosition adPosition = adPositionService.getById(position);
        if(null != templateDirectiveBody){
            setLocalVariable(VARIABLE_NAME, adPosition, environment, templateDirectiveBody);
        }else{
            // 执行模板输出
            if(null !=adPosition && StringUtils.isNotBlank(adPosition.getTemplate())){
                Map<String, Object> model = new HashMap<String, Object>();
                model.put(VARIABLE_NAME, adPosition);
                Writer out = environment.getOut();
                new Template("adTemplate", new StringReader(adPosition.getTemplate()), freeMarkerConfigurer.getConfiguration()).process(model, out);
            }
        }
    }
}
