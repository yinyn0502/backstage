package com.ueater.backstage.web;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.ueater.backstage.common.model.*;

import com.ueater.backstage.common.util.Collections;
import com.ueater.backstage.common.util.Collections3;
import com.ueater.backstage.common.util.JsonUtil;
import com.ueater.backstage.common.util.Tools;
import com.ueater.backstage.service.*;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
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
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by caoli on 2017/8/29.
 */
@Slf4j
@Controller
@RequestMapping(value = "/sys/role/")
public class SysRoleController{
    private static final Logger logger = LoggerFactory.getLogger(SysRoleController.class);
    @Resource
    private ISysOfficeService sysOfficeService;
    @Resource
    private ISysDictService sysDictService;
    @Resource
    private ISysAreaService sysAreaService;
    @Resource
    private ISysUserService sysUserService;
    @Resource
    private ISysRoleService sysRoleService;
    @Resource
    private ISysMenuService sysMenuService;

    @RequiresPermissions("sys:role:list")
    @RequestMapping(value = {"list", ""})
    public ModelAndView list(SysRole role) {
        ModelAndView model = new ModelAndView("/sys/role/roleList");
        List<SysRole> list=null;
        if(StringUtils.isNotBlank(role.getName())){
            list=sysRoleService.findRoleByName(role.getName());
        }else {
            list = sysRoleService.findAll();
        }

        if (list != null && list.size() > 0) {
            for (SysRole r : list) {
                if (r.getOfficeId() != null) {
                    r.setOffice(sysOfficeService.findById(r.getOfficeId()));
                }
            }
        }
        if (role.getOfficeId() != null) {
            role.setOffice(sysOfficeService.findById(role.getOfficeId()));
        }
        model.getModel().put("list", list);
        String jsonString = JsonUtil.list2json(list);
        List<SysDict> dictList = sysDictService.getDictList("sys_data_scope");
        model.getModel().put("dictString", jsonString);
        model.getModel().put("dictList", dictList);
        return model;
    }



    @RequiresPermissions(value={"sys:role:view","sys:role:add","sys:role:edit"},logical= Logical.OR)
    @RequestMapping(value = "/form/{id}",method = RequestMethod.GET)
    public ModelAndView form(@PathVariable("id") Long id, HttpServletRequest request) {
        ModelAndView model=new ModelAndView("/sys/role/roleForm");
        SysUser user=(SysUser) request.getSession().getAttribute("currentUser");
        if(id==0){
            SysRole role=new SysRole();
            if (user.getOfficeId()!=null){
                role.setOffice(sysOfficeService.findById(user.getOfficeId()));
                role.setOfficeId(user.getOfficeId());
            }
            role.setRoleType("user");

            List<SysDict> dictList=sysDictService.getDictList("sys_data_scope");
            List<SysDict> yesList=sysDictService.getDictList("yes_no");
            model.getModel().put("role", role);
            model.getModel().put("dictList",dictList);
            model.getModel().put("yesList",yesList);
            model.getModel().put("menuList", sysMenuService.findAll());
            model.getModel().put("officeList", sysOfficeService.findAll());
            return model;
        }


        SysRole role=sysRoleService.findById(id);

        if (role.getOffice()==null){
            role.setOffice(sysOfficeService.findById(role.getOfficeId()));
        }
        List<SysDict> dictList=sysDictService.getDictList("sys_data_scope");
        List<SysDict> yesList=sysDictService.getDictList("yes_no");
        model.getModel().put("role", role);
        model.getModel().put("dictList",dictList);
        model.getModel().put("yesList",yesList);
        model.getModel().put("menuList", sysMenuService.findAll());
        model.getModel().put("officeList", sysOfficeService.findAll());
        return model;
    }


    @RequiresPermissions(value={"sys:role:assign","sys:role:auth","sys:role:add","sys:role:edit"},logical=Logical.OR)
    @RequestMapping(value = "save")
    public String save(SysRole role, RedirectAttributes redirectAttributes,HttpServletRequest request) {
        SysUser user=(SysUser) request.getSession().getAttribute("currentUser");
        if(role.getId()==null){
            role.setCreateDate(new Date());
            role.setCreateBy(user.getId());
            role.setUpdateDate(new Date());
            role.setUpdateBy(user.getId());
            role.setDelFlag("0");
            sysRoleService.save(role);
            addMessage(redirectAttributes, "保存角色'" + role.getName() + "'成功");
        }else {


            List<SysRoleMenuKey> roleMenuKeyList = sysRoleService.findRoleMenuKeyListByRoleId(role.getId());
            if (StringUtils.isNotBlank(role.getMenuIds())) {
                List<String> list = Tools.stringToList(role.getMenuIds());
                sysRoleService.deleteMenusToRole(roleMenuKeyList, role.getId());
                for (String menuId : list) {
                    sysRoleService.saveMenuToRole(Long.parseLong(menuId), role.getId());
                }
                if (role.getCreateBy() == null) {
                    role.setCreateBy(user.getId());
                }
                if (role.getCreateDate() == null) {
                    role.setCreateDate(new Date());
                }

                role.setUpdateBy(user.getId());
                role.setUpdateDate(new Date());
                sysRoleService.update(role);
                addMessage(redirectAttributes, "权限设置已经成功");
                return "redirect:/sys/role/list";
            }



            if (!"true".equals(checkName(role.getOldName(), role.getName()))) {
                addMessage(redirectAttributes, "保存角色'" + role.getName() + "'失败, 角色名已存在");
                return "redirect:/sys/role/list";
            }
            if (!"true".equals(checkEnname(role.getOldEnname(), role.getEnname()))) {
                addMessage(redirectAttributes, "保存角色'" + role.getName() + "'失败, 英文名已存在");
                return "redirect:/sys/role/list";
            }
            role.setCreateBy(user.getId());
            role.setCreateDate(new Date());
            role.setUpdateBy(user.getId());
            role.setUpdateDate(new Date());
            role.setDelFlag("0");
            sysRoleService.update(role);
            addMessage(redirectAttributes, "保存角色'" + role.getName() + "'成功");
            return "redirect:/sys/role/list";
        }
        return "redirect:/sys/role/list";
    }


    @RequestMapping(value = "/delete/{id}",method = RequestMethod.GET)
    public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes,HttpServletRequest request) {
        SysUser user=  (SysUser) request.getSession().getAttribute("currentUser");
        SysRole role= sysRoleService.findById(id);
        List<SysRoleMenuKey> roleMenuList=sysRoleService.findRoleMenuKeyListByRoleId(id);
        sysRoleService.deleteMenusToRole(roleMenuList,id);
        List<SysUserRoleKey> sysUserRoleKeyList=sysRoleService.findUserRoleKeyByRoleId(id);
        for(SysUserRoleKey key:sysUserRoleKeyList){
            sysRoleService.outUserInRole(id,key.getUserId());
        }
        role.setDelFlag("1");
        role.setUpdateDate(new Date());
        role.setCreateBy(user.getId());
        int result=sysRoleService.update(role);
        if(result==1) {
            addMessage(redirectAttributes, "角色【" + role.getName() + "】删除成功！");
        }else{
            addMessage(redirectAttributes, "角色【" + role.getName() + "】删除失败！");
        }
        return "redirect:/sys/role/list";
    }




    /**
     * 角色分配页面
     * @param
     * @param request
     * @return
     */
    @RequiresPermissions("sys:role:assign")
    @RequestMapping(value = "/assign/{id}",method = RequestMethod.GET)
    public ModelAndView assign(@PathVariable("id") Long id,RedirectAttributes redirectAttributes,HttpServletRequest request) {
        ModelAndView model=new ModelAndView("/sys/role/roleAssign");
        SysUser user=  (SysUser) request.getSession().getAttribute("currentUser");
        List<SysDict> dictList=sysDictService.getDictList("sys_data_scope");
        SysRole role=sysRoleService.findById(id);
        if(role!=null) {
            List<SysUser> userList = sysUserService.findListByRoleId(role.getId());
            model.getModel().put("userList", userList);
        }
        if(role.getOfficeId()!=null){
           SysOffice office=sysOfficeService.findById(role.getOfficeId());
           role.setOffice(office);
        }
        if(user.getOfficeId()!=null){
            SysOffice userOffice=sysOfficeService.findById(user.getOfficeId());
            user.setOffice(userOffice);
            model.getModel().put("userOffice",userOffice);
        }
        model.getModel().put("user",user);
        model.getModel().put("dictList",dictList);
        model.getModel().put("role",role);
        return model;
    }

    /**
     * 角色分配 -- 打开角色分配对话框
     * @param id
     * @param
     * @return
     */
    @RequiresPermissions("sys:role:assign")
    @RequestMapping(value = "usertorole/{id}",method = RequestMethod.GET)
    public ModelAndView selectUserToRole(@PathVariable("id") Long id, RedirectAttributes redirectAttributes, HttpServletRequest request) {
        ModelAndView model=new ModelAndView("/sys/role/selectUserToRole");
        SysUser user=  (SysUser) request.getSession().getAttribute("currentUser");
        SysRole role=sysRoleService.findById(id);
        List<SysOffice> officeList=sysOfficeService.findAll();
        List<SysUser> userList = sysUserService.findListByRoleId(id);
        model.getModel().put("role", role);
        model.getModel().put("userList", userList);
        logger.info("userList:"+userList);
        model.getModel().put("selectIds", Collections3.extractToString(userList, "name", ","));
        model.getModel().put("officeList", officeList);
        return model;
    }


   /**
     * 角色分配 -- 根据部门编号获取用户列表
     * @param officeId
     * @param response
     * @return
     */

    @RequiresPermissions("sys:role:assign")
    @ResponseBody
    @RequestMapping(value = "users")
    public List<Map<String, Object>> users(String officeId, HttpServletResponse response) {
        List<Map<String, Object>> mapList = Lists.newArrayList();
        SysUser user = new SysUser();
        user.setOffice(sysOfficeService.findById(Long.parseLong(officeId)));
        List<SysUser> userList=sysUserService.findUserByOfficeId(Long.parseLong(officeId));
        for (SysUser e : userList) {
            Map<String, Object> map = Maps.newHashMap();
            map.put("id", e.getId());
            map.put("pId", 0);
            map.put("name", e.getName());
            mapList.add(map);
        }
        return mapList;
    }


/**
     * 角色分配 -- 从角色中移除用户
     * @param
     * @param redirectAttributes
     * @return
     */
    @RequiresPermissions("sys:role:assign")
    @RequestMapping(value = "outrole")
    public String outrole(String userId, String roleId, RedirectAttributes redirectAttributes,HttpServletRequest request) {
        SysRole role = sysRoleService.findById(Long.parseLong(roleId));
        SysUser user=sysUserService.findById(Long.parseLong(userId));
        SysUser currentUser=  (SysUser) request.getSession().getAttribute("currentUser");
        List<SysRole> userRoleList=sysRoleService.getRoleList(Long.parseLong(userId));
        if (currentUser.getId()==user.getId()) {
            addMessage(redirectAttributes, "无法从角色【" + role.getName() + "】中移除用户【" + user.getName() + "】自己！");
        }else {
                int flag = sysRoleService.outUserInRole(Long.parseLong(roleId),Long.parseLong(userId));
                if (flag==0) {
                    addMessage(redirectAttributes, "用户【" + user.getName() + "】从角色【" + role.getName() + "】中移除失败！");
                }else {
                    addMessage(redirectAttributes, "用户【" + user.getName() + "】从角色【" + role.getName() + "】中移除成功！");
                }
        }
        return "redirect:/sys/role/assign/"+role.getId();
    }


   /**
     * 角色分配
     * @param id
     * @param idsArr
     * @param redirectAttributes
     * @return
     */

    @RequiresPermissions("sys:role:assign")
    @RequestMapping(value = "assignrole")
    public String assignRole(String id, String[] idsArr, RedirectAttributes redirectAttributes) {
        SysRole role =sysRoleService.findById(Long.parseLong(id));
        StringBuilder msg = new StringBuilder();
        int newNum = 0;
        for (int i = 0; i < idsArr.length; i++) {
            boolean flag=Tools.isNumeric(idsArr[i].toString());
            if(flag) {
                int result = sysRoleService.assignUserToRole(role.getId(), new Long(idsArr[i].toString()));
                if (result == 1) {
                    SysUser user = sysUserService.findById(new Long(idsArr[i].toString()));
                    msg.append("<br/>新增用户【" + user.getName() + "】到角色【" + role.getName() + "】！");
                    newNum++;
                }
            }

        }
        addMessage(redirectAttributes, "已成功分配 "+newNum+" 个用户"+msg);
        return "redirect:/sys/role/assign/"+role.getId();
    }


   /* @RequiresPermissions("sys:role:auth")
    @RequestMapping(value = "auth")
    public ModelAndView auth(SysRole role, HttpServletRequest request) {
        ModelAndView model=new ModelAndView("/sys/role/roleAuth");
        SysUser user=  (SysUser) request.getSession().getAttribute("currentUser");
        if (role.getOffice()==null){
            role.setOffice(sysOfficeService.findById(user.getOfficeId()));
        }

        model.getModel().put("role", role);
        model.getModel().put("menuList", sysMenuService.findAll());
        model.getModel().put("officeList", sysOfficeService.findAll());
        return model;
    }*/




    @RequiresPermissions("sys:role:auth")
    @RequestMapping(value = "auth")
    public ModelAndView auth(String id, HttpServletRequest request) {
        SysRole role=sysRoleService.findById(Long.parseLong(id));
        ModelAndView model=new ModelAndView("/sys/role/roleAuth");
        SysUser user=  (SysUser) request.getSession().getAttribute("currentUser");
        if (role.getOffice()==null){
            role.setOffice(sysOfficeService.findById(user.getOfficeId()));
        }
        model.getModel().put("role", role);
        model.getModel().put("menuList", sysMenuService.findAll());
        model.getModel().put("officeList", sysOfficeService.findAll());
        String roleMenuIds=sysRoleService.getRoleMenuStringByRoleId(Long.parseLong(id));

        //logger.info("@@@@@@@@@@@@@@@@@@@@@@"+roleMenuIds);


        model.getModel().put("roleMenuIds",roleMenuIds);
        return model;
    }



    /**
     * 验证角色名是否有效
     * @param oldName
     * @param name
     * @return
     */
    @RequiresPermissions("user")
    @ResponseBody
    @RequestMapping(value = "checkName")
    public String checkName(String oldName, String name) {
        String flag="false";
        if (name!=null && name.equals(oldName)) {
            flag="true";
        }

        //SysRole sysRole= sysRoleService.getRoleByName(name);
        if (name!=null && sysRoleService.getRoleByName(name) == null) {
            flag= "true";
        }
        logger.info("flag:"+flag);
        return "true";
    }

    /**
     * 验证角色英文名是否有效
     * @param oldEnname
     * @param enname
     * @return
     */
    @RequiresPermissions("user")
    @ResponseBody
    @RequestMapping(value = "checkEnname")
    public String checkEnname(String oldEnname, String enname) {
        if (enname!=null && enname.equals(oldEnname)) {
            return "true";
        } else if (enname!=null && sysRoleService.getRoleByEnName(enname) == null) {
            return "true";
        }
        return "true";
    }


    /**
     * 添加Flash消息
     */
    protected void addMessage(RedirectAttributes redirectAttributes, String... messages) {
        StringBuilder sb = new StringBuilder();
        for (String message : messages){
            sb.append(message).append(messages.length>1?"<br/>":"");
        }
        redirectAttributes.addFlashAttribute("message", sb.toString());
    }
}
