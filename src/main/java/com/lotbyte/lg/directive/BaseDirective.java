package com.lotbyte.lg.directive;

import freemarker.core.Environment;
import freemarker.template.*;

import java.io.IOException;

public abstract class BaseDirective implements TemplateDirectiveModel {


    protected void setLocalVariable(String name, Object value, Environment env, TemplateDirectiveBody body) throws TemplateException, IOException {
        DefaultObjectWrapperBuilder builder = new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_25);
        env.setVariable(name, builder.build().wrap(value));
        body.render(env.getOut());
    }
}
