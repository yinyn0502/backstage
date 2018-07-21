package com.ueater.backstage.web;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ueater.backstage.common.model.SysDict;
import com.ueater.backstage.common.model.SysLogWithBLOBs;
import com.ueater.backstage.common.util.Constant;
import com.ueater.backstage.service.ISysDictService;
import com.ueater.backstage.service.ISysLogService;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by caoli on 2017/11/14.
 */
@Controller
@RequestMapping(value = "/syslog/query/")
public class SysLogController {
    protected org.slf4j.Logger logger = LoggerFactory.getLogger(SysDictController.class);
    @Resource
    private ISysLogService sysLogService;

    @RequiresPermissions("syslog:query:list")
    @RequestMapping(value = {"list", ""})
    public ModelAndView list(String bizType, String url, String pageNum, String pageSize, HttpServletRequest request, HttpServletResponse response) {
        // List<String> typeList = sysDictService.findTypeList();
        List<SysLogWithBLOBs> list=null;
        ModelAndView model=new ModelAndView("/syslog/query/list");
        if(StringUtils.isBlank(pageSize)){
            pageSize="10";
        }
        if(StringUtils.isBlank(pageNum)){
            pageNum="1";
        }
        PageHelper.startPage(Integer.parseInt(pageNum), Integer.parseInt(pageSize));

       /* if(StringUtils.isNotBlank(type)||StringUtils.isNotBlank(description)){
            list= sysDictService.findByProperties(type,description);
        }else{
            list=sysDictService.findAllList();
        }*/

       if(StringUtils.isNotBlank(bizType)){
            list=sysLogService.findByProperties(bizType);
       }else {
            list = sysLogService.findAll();
       }
        PageInfo<SysLogWithBLOBs> pageInfo=new PageInfo<SysLogWithBLOBs>(list);

        model.getModel().put("pageInfo",pageInfo);
        StringBuffer sb=new StringBuffer();
        sb.append("/syslog/query/list");

       /* model.getModel().put("isparam", Constant.IS_PARAM_YES);
        if(type!=null&&StringUtils.isNotEmpty(type)&&!"null".equals(type)){
            model.getModel().put("type",type);
            sb.append("type="+type);
        }
        if(description!=null&&StringUtils.isNotEmpty(description)&&!"null".equals(description)){
            model.getModel().put("description",description);
            sb.append("description="+description);
        }*/
        model.getModel().put("pathurl",sb.toString());
        logger.info(pageInfo.toString());
        return model;
    }

}
