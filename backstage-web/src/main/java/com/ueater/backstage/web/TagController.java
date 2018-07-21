package com.ueater.backstage.web;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by caoli on 2017/8/21.
 */

@Slf4j
@RestController
@RequestMapping(value = "/tag")
public class TagController {

    /**
     * 树结构选择标签（treeselect.tag）
     */

    @RequestMapping(value = "/treeselect",method = RequestMethod.GET)
    public ModelAndView treeselect( String url,
                                   String extId,
                                   String checked,
                                   String selectIds,
                                  String isAll,
                                   String module
                                   ) {
        ModelAndView m = new ModelAndView("tagTreeselect");
        m.getModel().put("url",url);    // 树结构数据URL
        m.getModel().put("extId", extId); // 排除的编号ID
        if(StringUtils.isBlank(checked)){
            checked="true";
        }
        m.getModel().put("checked", checked); // 是否可复选
        m.getModel().put("selectIds", selectIds); // 指定默认选中的ID
        m.getModel().put("isAll", isAll);    // 是否读取全部数据，不进行权限过滤
        m.getModel().put("module", module);    // 过滤栏目模型（仅针对CMS的Category树）
        return m;
    }

    /**
     * 图标选择标签（iconselect.tag）
     */

    @RequestMapping(value = "/iconselect")
    public ModelAndView iconselect(HttpServletRequest request) {
        ModelAndView m = new ModelAndView("tagIconselect");
        m.getModel().put("value", request.getParameter("value"));
        return m;
    }

}