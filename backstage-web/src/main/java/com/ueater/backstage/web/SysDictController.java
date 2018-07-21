package com.ueater.backstage.web;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ueater.backstage.common.model.SysDict;
import com.ueater.backstage.common.model.SysUser;
import com.ueater.backstage.common.util.Constant;
import com.ueater.backstage.common.util.Tools;
import com.ueater.backstage.service.ISysDictService;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

/**
 * Created by caoli on 2017/9/7.
 */
@Controller
@RequestMapping(value = "/sys/dict/")
public class SysDictController {
    protected org.slf4j.Logger logger = LoggerFactory.getLogger(SysDictController.class);
    @Resource
    private ISysDictService sysDictService;

    @RequiresPermissions("sys:dict:list")
    @RequestMapping(value = {"list", ""})
    public ModelAndView list(String description,String type,String pageNum,String pageSize, HttpServletRequest request, HttpServletResponse response) {
       // List<String> typeList = sysDictService.findTypeList();
        List<SysDict> list=null;
        ModelAndView model=new ModelAndView("/sys/dict/dictList");
        if(StringUtils.isBlank(pageSize)){
            pageSize="10";
        }
        if(StringUtils.isBlank(pageNum)){
            pageNum="1";
        }
        PageHelper.startPage(Integer.parseInt(pageNum), Integer.parseInt(pageSize));

        if(StringUtils.isNotBlank(type)||StringUtils.isNotBlank(description)){
            list= sysDictService.findByProperties(type,description);
        }else{
            list=sysDictService.findAllList();
        }


        PageInfo<SysDict> pageInfo=new PageInfo<SysDict>(list);
        /**
         * 如果不是自查数据库的话，需要和FEN这个架构交互的那么需要加入如下代码

         pageInfo.setTotal(200);
         pageInfo.setPages(10);
         int[] a=new int[10];
         for(int i=0;i<a.length;i++){
         a[i] = i*1;
         }
         pageInfo.setNavigatepageNums(a);
         */
        model.getModel().put("pageInfo",pageInfo);
        StringBuffer sb=new StringBuffer();
        sb.append("/sys/dict/list?");

        model.getModel().put("isparam",Constant.IS_PARAM_YES);
        if(type!=null&&StringUtils.isNotEmpty(type)&&!"null".equals(type)){
            model.getModel().put("type",type);
            sb.append("type="+type);
        }
        if(description!=null&&StringUtils.isNotEmpty(description)&&!"null".equals(description)){
            model.getModel().put("description",description);
            sb.append("description="+description);
        }
        model.getModel().put("pathurl",sb.toString());
        logger.info(pageInfo.toString());
        return model;
    }


    @RequiresPermissions(value={"sys:dict:view","sys:dict:add","sys:dict:edit"},logical= Logical.OR)
    @RequestMapping(value = "form")
    public ModelAndView form(SysDict dict) {
        ModelAndView model=new ModelAndView("/sys/dict/dictForm");
        if(dict.getId()!=null){
            dict=sysDictService.findById(dict.getId());
        }else{
            dict=new SysDict();
        }
        model.getModel().put("dict", dict);
        return model;
    }

    @RequiresPermissions(value={"sys:dict:add","sys:dict:edit"},logical=Logical.OR)
    @RequestMapping(value = "save")
    public String save(SysDict dict,  RedirectAttributes redirectAttributes,HttpServletRequest request) {
        SysUser currentUser=  (SysUser) request.getSession().getAttribute("currentUser");
        int flag=0;
        if(dict.getId()==null){
            //dict=new SysDict();
            dict.setCreateBy(currentUser.getId());
            dict.setCreateDate(new Date());
            dict.setUpdateBy(currentUser.getId());
            dict.setUpdateDate(new Date());
            dict.setDelFlag(Constant.DEL_FLAG_NOT);
            flag=sysDictService.save(dict);
        }else {
            SysDict old=sysDictService.findById(dict.getId());
            dict.setUpdateDate(new Date());
            dict.setUpdateBy(currentUser.getId());
            dict.setCreateDate(old.getCreateDate());
            flag = sysDictService.update(dict);
        }
        if(flag==1) {
            Tools.addMessage(redirectAttributes, "保存字典'" + dict.getLabel() + "'成功");
        }else{
            Tools.addMessage(redirectAttributes, "保存字典'" + dict.getLabel() + "'失败");
        }

        return "redirect:/sys/dict/list";
    }

}
