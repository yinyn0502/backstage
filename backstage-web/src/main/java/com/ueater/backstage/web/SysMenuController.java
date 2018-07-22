package com.ueater.backstage.web;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.ueater.backstage.common.model.SysMenu;
import com.ueater.backstage.common.model.SysUser;
import com.ueater.backstage.common.util.Constant;
import com.ueater.backstage.common.util.JsonUtil;
import com.ueater.backstage.common.util.Tools;
import com.ueater.backstage.service.ISysMenuService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by caoli on 2017/8/20.
 */
@Slf4j
@Controller
@RequestMapping("/sys/menu")
public class SysMenuController {
    protected org.slf4j.Logger logger = LoggerFactory.getLogger(SysMenuController.class);
    @Resource
    private ISysMenuService sysMenuService;

    @RequiresPermissions("sys:menu:list")
    @RequestMapping("/list")
    @RequiresAuthentication
    public ModelAndView index(HttpServletRequest request) {
        List<SysMenu> list = new ArrayList();
        List<SysMenu> sourcelist =  sysMenuService.getAllList();
        for(SysMenu s:sourcelist){
            if(s.getParentId()!=null){
                s.setParent(sysMenuService.get(s.getParentId()));
            }
        }
        SysUser sysUser= (SysUser) request.getSession().getAttribute("currentUser");
        SysMenu.sortList(list, sourcelist,new Long(0), true);
        ModelAndView m= new ModelAndView("/sys/menu/menuList");
        //m.getModel().put("users",users);
        m.getModel().put("menuList",list);
        String jsonString=  JsonUtil.list2json(list);
        m.getModel().put("dictString",jsonString);
        List<SysMenu> menuListPermit=sysMenuService.findByUserId(sysUser.getId());
        m.getModel().put("menuListPermit",menuListPermit);
        return m;
    }





    @RequiresPermissions(value={"sys:menu:view","sys:menu:add","sys:menu:edit"},logical= Logical.OR)
    @RequestMapping(value = "/form/{id}",method = RequestMethod.GET)
    public ModelAndView form(@PathVariable("id") Long id, HttpServletRequest request) {
        SysUser user=  (SysUser) request.getSession().getAttribute("currentUser");
        ModelAndView m = new ModelAndView("/sys/menu/menuForm");
        if(id==0){
                SysMenu menu=new SysMenu();
                menu.setParentId(new Long(1));
                menu.setParent(sysMenuService.get(new Long(1)));
                m.getModel().put("menu", menu);
                return m;
        }else {
            SysMenu menu = sysMenuService.get(id);
            if (menu.getParentId() == null) {
                SysMenu sysMenu = new SysMenu();
                sysMenu.setParentId(Long.parseLong("1"));
                sysMenu.setParent(sysMenu);
                menu.setParent(sysMenu);
            }
            menu.setParent(sysMenuService.get(menu.getParentId()));
            // 获取排序号，最末节点排序号+30
            if (StringUtils.isBlank(menu.getId().toString())) {
                List<SysMenu> list = Lists.newArrayList();
                List<SysMenu> sourcelist = sysMenuService.getAllList();
                SysMenu.sortList(list, sourcelist, menu.getParentId(), false);
                if (list.size() > 0) {
                    menu.setSort(list.get(list.size() - 1).getSort() + 30);
                }
            }

            m.getModel().put("menu", menu);
            return m;
        }
    }


    /**
     * isShowHide是否显示隐藏菜单
     * @param extId
     * @param isShowHide
     * @return
     */
    @RequiresPermissions("user")
    @ResponseBody
    @RequestMapping(value = "/treeData")
    public List<Map<String, Object>> treeData(String extId,String isShowHide) {
        List<Map<String, Object>> mapList = Lists.newArrayList();
        if(StringUtils.isBlank(extId)){
            extId="1";
        }
        SysMenu sysMenu=sysMenuService.get(Long.parseLong(extId));
        if(sysMenu.getParentId()!=null) {
            List<SysMenu> list = sysMenuService.getAllList();
        for (int i=0; i<list.size(); i++){
            SysMenu e = list.get(i);

                Map<String, Object> map = Maps.newHashMap();
                map.put("id", e.getId());
                map.put("pId", e.getParentId());
                map.put("name", e.getName());
                mapList.add(map);

        }
        }
        return mapList;
    }




    @RequiresPermissions(value={"sys:menu:add","sys:menu:edit"},logical= Logical.OR)
    @RequestMapping(value = "save")
    public String save(SysMenu menu, RedirectAttributes redirectAttributes, HttpServletRequest request) {
        SysUser currentUser=  (SysUser) request.getSession().getAttribute("currentUser");
        int result=0;
        if(menu.getId()==null){
            menu.setDelFlag("0");
            menu.setCreateDate(new Date());
            menu.setUpdateDate(new Date());
            menu.setUpdateBy(currentUser.getId());
            menu.setCreateBy(currentUser.getId());
            if(menu.getParentId()!=null){
                StringBuffer sb=new StringBuffer();
                SysMenu parentMenu=sysMenuService.get(menu.getParentId());
                /*sb.append(parentMenu.getParentIds());
                sb.append(",");
                sb.append(menu.getParentId());
                sb.append(",");
                menu.setParentIds(sb.toString());*/
                menu.setParentIds(Tools.getParentIds(parentMenu,menu.getParentId()));
            }
            result=sysMenuService.save(menu);
        }else {
            SysMenu toBean = sysMenuService.get(menu.getId());
            menu.setUpdateBy(currentUser.getId());
            menu.setUpdateDate(new Date());
            if (toBean.getCreateDate() != null) {
                menu.setCreateDate(toBean.getCreateDate());
            } else {
                menu.setCreateDate(new Date());
            }
            if (toBean.getCreateBy() != null) {
                menu.setCreateBy(toBean.getCreateBy());
            } else {
                menu.setCreateBy(currentUser.getId());
            }

            menu.setDelFlag(toBean.getDelFlag());
            result=sysMenuService.update(menu);
        }
        if(result==1) {
            Tools.addMessage(redirectAttributes, "保存菜单'" + menu.getName() + "'成功");
        }else{
            Tools.addMessage(redirectAttributes, "保存菜单'" + menu.getName() + "'失败");
        }
        return "redirect:/sys/menu/list";
    }







    @RequiresPermissions(value={"sys:menu:view","sys:menu:add","sys:menu:edit"},logical= Logical.OR)
    @RequestMapping(value = "/subform/{id}",method = RequestMethod.GET)
    public ModelAndView subform(@PathVariable("id") Long id) {
        ModelAndView model=new ModelAndView("/sys/menu/menuForm");
        SysMenu newMenu=new SysMenu();
        SysMenu menu=sysMenuService.get(id);
        newMenu.setParent(menu);
        newMenu.setParentId(id);
        List<SysMenu> list= sysMenuService.findAll();
        String jsonString=  JsonUtil.list2json(list);
//        List<SysDict> dictList=sysDictService.getDictList("sys_area_type");
//        String jsonDictListString=JsonUtil.list2json(dictList);

        model.getModel().put("dictString",jsonString);
//        model.getModel().put("jsonDictListString",jsonDictListString);
//        model.getModel().put("dictList",dictList);
        model.getModel().put("list",list);
        model.getModel().put("menu", newMenu);

        return model;
    }




    @RequiresPermissions("sys:menu:del")
    @RequestMapping(value = "delete/{id}")
    public String delete( @PathVariable("id") Long id, HttpServletRequest request,RedirectAttributes redirectAttributes) {
        SysUser currentUser=  (SysUser) request.getSession().getAttribute("currentUser");
        SysMenu menu=sysMenuService.get(id);
        menu.setCreateBy(currentUser.getId());
        menu.setCreateDate(new Date());
        menu.setDelFlag(Constant.DEL_FLAG_ALREADY);
        int flag=sysMenuService.update(menu);
        if(flag==1){
            Tools.addMessage(redirectAttributes, "删除用户成功");
        }else{
            Tools.addMessage(redirectAttributes, "删除用户失败");
        }
        return "redirect:/sys/menu/list";
    }



}


