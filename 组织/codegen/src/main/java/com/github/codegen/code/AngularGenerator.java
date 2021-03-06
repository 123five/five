package com.github.codegen.code;

import com.github.codegen.util.FreeMarkerUtils;
import com.github.codegen.util.StringUtils;
import freemarker.template.Template;

import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * AngularJS生成类
 *
 * @author lee.siu.wah
 * @version 1.0
 * <p>File Created at 2018-07-19<p>
 */
public class AngularGenerator {

    /** 生成方法 */
    public static void generatorMVC(String path, String className) {
        try {
            /** ####### 生成控制器层js ######## */
            // 获取模版对象
            Template template = FreeMarkerUtils.getTemplate("ngController.ftl");
            // 定义数据模型
            Map<String,Object> dataModel = new HashMap<>();
            dataModel.put("name", StringUtils.transferLower(className));

            OutputStreamWriter osw = new OutputStreamWriter(new FileOutputStream(path
                    + "/src/main/webapp/js/controller/"
                    + StringUtils.transferLower(className) + "Controller.js"), "UTF-8");
            template.process(dataModel, osw);
            osw.flush();
            osw.close();
        }catch (Exception ex){
            throw new RuntimeException(ex);
        }
    }
}