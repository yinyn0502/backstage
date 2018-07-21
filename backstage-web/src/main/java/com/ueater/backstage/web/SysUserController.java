package com.ueater.backstage.web;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ueater.backstage.common.model.SysDict;
import com.ueater.backstage.common.model.SysUser;
import com.ueater.backstage.common.util.Constant;
import com.ueater.backstage.common.util.PropertyCopy;
import com.ueater.backstage.common.util.Tools;
import com.ueater.backstage.service.*;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.Logical;
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
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

/**
 * Created by caoli on 2017/8/31.
 */
@Slf4j
@Controller
@RequestMapping(value = "/sys/user/")
public class SysUserController {
    /**
     * 日志对象
     */
    protected org.slf4j.Logger logger = LoggerFactory.getLogger(SysUserController.class);
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


    @RequiresPermissions("sys:user:index")
    @RequestMapping(value = {"index"})
    public ModelAndView index(SysUser user) {
        ModelAndView model=new ModelAndView("/sys/user/index");
        return model;
    }

    @RequiresPermissions("sys:user:index")
    @RequestMapping(value = {"list", ""})
    public ModelAndView list(SysUser user, String pageNum,String pageSize,HttpServletRequest request, HttpServletResponse response) {
        ModelAndView model=new ModelAndView("/sys/user/userList");
        if(StringUtils.isBlank(pageSize)){
            pageSize="10";
        }
        if(StringUtils.isBlank(pageNum)){
            pageNum="1";
        }
        List<SysUser> list=null;
        if(StringUtils.isNotBlank(user.getLoginName())||StringUtils.isNotBlank(user.getName())||user.getOfficeId()!=null){
           list= sysUserService.findLikeLoginName(user.getLoginName(),user.getName(),user.getOfficeId(),user.getCompanyId());
        }else {
            list = sysUserService.findAll();
        }
        list=sysUserService.initOffice(list);
        PageHelper.startPage(Integer.parseInt(pageNum), Integer.parseInt(pageSize));
        PageInfo<SysUser> pageInfo=new PageInfo<SysUser>(list);
        model.getModel().put("pageInfo",pageInfo);
        model.getModel().put("pathurl","/sys/user/list");
        return model;
    }



    @RequiresPermissions(value={"sys:user:view","sys:user:add","sys:user:edit"},logical= Logical.OR)
    @RequestMapping(value = "/form/{id}",method = RequestMethod.GET)
    public ModelAndView form(@PathVariable("id") Long id, HttpServletRequest request) {
        ModelAndView model=new ModelAndView("/sys/user/userForm");
        //是否可用
        List<SysDict> yesList = sysDictService.getDictList("yes_no");
        //用户类型
        List<SysDict> userTypeList = sysDictService.getDictList("sys_user_type");
        SysUser user=null;
        if(id==0){
              user=new SysUser();
              user.setOfficeId(new Long(5));//默认技术部
              user.setCompanyId(new Long(1));//默认总公司
        }else {
            user = sysUserService.findById(id);
            user.setRoleList(sysRoleService.getRoleList(user.getId()));
        }
            if (user.getOfficeId() != null) {
                user.setOffice(sysOfficeService.findById(user.getOfficeId()));
            }
            if (user.getCompany() == null || user.getCompany().getId() == null) {
                if (user.getOffice().getParentIds() != null) {
                    user.setCompany(sysOfficeService.findById(Long.parseLong(Tools.getCompayId(user.getOffice().getParentIds()))));
                } else {
                    user.setCompany(sysOfficeService.findById(Long.parseLong("1")));
                }
            }
            model.getModel().put("yesList", yesList);
            model.getModel().put("userTypeList", userTypeList);
            model.getModel().put("user", user);
            model.getModel().put("allRoles", sysRoleService.findAll());
        return model;
    }

    /**
     * 验证登录名是否有效
     * @param oldLoginName
     * @param loginName
     * @return
     */
    @ResponseBody
    @RequiresPermissions(value={"sys:user:add","sys:user:edit"},logical=Logical.OR)
    @RequestMapping(value = "checkLoginName")
    public String checkLoginName(String oldLoginName, String loginName) {
        if (loginName !=null && loginName.equals(oldLoginName)) {
            return "true";
        } else if (loginName !=null && sysUserService.getByLoginName(loginName) == null) {
            return "true";
        }
        return "false";
    }


    @RequiresPermissions(value={"sys:user:add","sys:user:edit"},logical=Logical.OR)
    @RequestMapping(value = "save")
    public String save(SysUser user, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        SysUser currentUser=  (SysUser) request.getSession().getAttribute("currentUser");
        int flag=0;
        if(user.getId()==null){
            user.setPassword(user.getNewPassword());
            user.setCreateDate(new Date());
            user.setCreateBy(currentUser.getId());
            user.setUpdateDate(new Date());
            user.setUpdateBy(currentUser.getId());
            user.setDelFlag(Constant.DEL_FLAG_NOT);
            user.setAdFlag(Constant.IS_AD_SELF_USER);
            flag=sysUserService.save(user);
        }else {
            // 如果新密码为空，则不更换密码
            if (StringUtils.isNotBlank(user.getNewPassword())) {
                user.setPassword(user.getNewPassword());
            }
            SysUser toUser = sysUserService.findById(user.getId());
            String[] nullp = PropertyCopy.getNullPropertyNames(user);
            try {
                PropertyCopy.copyPropertiesExclude(user, toUser, nullp);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (!"true".equals(checkLoginName(user.getOldLoginName(), user.getLoginName()))) {
                Tools.addMessage(redirectAttributes, "保存用户'" + user.getLoginName() + "'失败，登录名已存在");
                //return form(user, model);
            }

            // 保存用户信息
            toUser.setUpdateBy(currentUser.getId());
            toUser.setUpdateDate(new Date());
            flag=sysUserService.update(toUser);
        }
        if(flag==1) {
            Tools.addMessage(redirectAttributes, "保存用户'" + user.getLoginName() + "'成功");
        }else{
            Tools.addMessage(redirectAttributes, "保存用户'" + user.getLoginName() + "'失败");
        }
        return "redirect:/sys/user/list";
    }



    @RequiresPermissions("sys:user:del")
    @RequestMapping(value = "delete/{id}")
    public String delete( @PathVariable("id") Long id, HttpServletRequest request,RedirectAttributes redirectAttributes) {
            SysUser currentUser=  (SysUser) request.getSession().getAttribute("currentUser");
            SysUser user=sysUserService.findById(id);
            user.setCreateBy(currentUser.getId());
            user.setCreateDate(new Date());
            user.setDelFlag(Constant.DEL_FLAG_ALREADY);
            int flag=sysUserService.update(user);
            if(flag==1){
                Tools.addMessage(redirectAttributes, "删除用户成功");
            }else{
                Tools.addMessage(redirectAttributes, "删除用户失败");
            }
            return "redirect:/sys/user/list";
        }








}
