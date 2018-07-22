package com.ueater.backstage.web.auth;


import com.ueater.backstage.common.model.SysMenu;
import com.ueater.backstage.common.model.SysRole;
import com.ueater.backstage.common.model.SysUser;
import com.ueater.backstage.common.util.Constant;
import com.ueater.backstage.dataservice.ISysMenuDataService;
import com.ueater.backstage.dataservice.ISysRoleDataService;
import com.ueater.backstage.dataservice.ISysUserDataService;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**    
 * @Description: shiro的认证最终是交给了Realm进行执行
 * 所以我们需要自己重新实现一个Realm，此Realm继承AuthorizingRealm   
 * @Author:       花荣   
 * @CreateDate:   2018/7/22 16:23     
 */

public class MyShiroRealm extends AuthorizingRealm {

    protected org.slf4j.Logger logger = LoggerFactory.getLogger(MyShiroRealm.class);
    @Autowired
    private ISysUserDataService sysUserDataService;

    @Autowired
    private ISysRoleDataService sysRoleDataService;

    @Resource
    private ISysMenuDataService sysMenuDataService;


    /**
     * 登录认证
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        //UsernamePasswordToken用于存放提交的登录信息
        UsernamePasswordToken token = (UsernamePasswordToken)authenticationToken;
        logger.info("登录认证!");
        logger.info("AD用户认证！");
        logger.info("username:"+token.getUsername());
        int flag= com.ueater.backstage.common.util.AdLoginUtil.validAdUsers(token.getUsername(),String.valueOf(token.getPassword()));
        SecurityUtils.getSubject().getSession().setTimeout(86400000);
        if(flag==200){
            // 若存在，将此用户存放到登录认证info中，无需自己做密码对比，Shiro会为我们进行密码对比校验

            SysUser  sysUser = sysUserDataService.findByLoginNameAndAdFlag(token.getUsername(), Constant.IS_AD_USER);
            if(sysUser==null){
                sysUser =new SysUser();
                sysUser.setCreateBy(new Long(1));
                sysUser.setCreateDate(new Date());
                sysUser.setUpdateBy(new  Long(1));
                sysUser.setUpdateDate(new Date());
                sysUser.setDelFlag(Constant.DEL_FLAG_NOT);
                sysUser.setLoginName(token.getUsername());
                sysUser.setAdFlag(Constant.IS_AD_USER);
                sysUser.setLoginDate(new Date());
                sysUser.setCompanyId(new Long(1));

                //默認技術部
                sysUser.setOfficeId(new Long(5));
                sysUser.setPassword(String.valueOf(token.getPassword()));
                sysUser.setName(token.getUsername());
                sysUser.setLoginFlag(Constant.LOGIN_FLAG_YES);
                sysUser.setName(token.getUsername());
                sysUserDataService.save(sysUser);
            }else{
                sysUser.setUpdateBy(sysUser.getId());
                sysUser.setUpdateDate(new Date());
                sysUser.setLoginDate(new Date());
                if(!sysUser.getPassword().equals(String.valueOf(token.getPassword()))) {
                    sysUser.setPassword(String.valueOf(token.getPassword()));
                }
                sysUser.setLoginFlag(Constant.LOGIN_FLAG_YES);
                sysUserDataService.update(sysUser);
            }
            return new SimpleAuthenticationInfo(token.getUsername(),String.valueOf(token.getPassword()), getName());

        }else {


            logger.info("普通用户认证！");
            SysUser user = sysUserDataService.findByLoginNameAndAdFlag(token.getUsername(), Constant.IS_AD_SELF_USER);
            if (user != null) {
                logger.info("普通用户: " + user.getLoginName());
                // 若存在，将此用户存放到登录认证info中，无需自己做密码对比，Shiro会为我们进行密码对比校验
                return new SimpleAuthenticationInfo(user.getLoginName(), user.getPassword(), getName());
            }
        }
        return null;
    }
    /**
     * 权限认证（为当前登录的Subject授予角色和权限）
     *
     * 该方法的调用时机为需授权资源被访问时，并且每次访问需授权资源都会执行该方法中的逻辑，这表明本例中并未启用AuthorizationCache，
     * 如果连续访问同一个URL（比如刷新），该方法不会被重复调用，Shiro有一个时间间隔（也就是cache时间，在ehcache-shiro.xml中配置），
     * 超过这个时间间隔再刷新页面，该方法会被执行
     *
     * doGetAuthorizationInfo()是权限控制，
     * 当访问到页面的时候，使用了相应的注解或者shiro标签才会执行此方法否则不会执行，
     * 所以如果只是简单的身份认证没有权限的控制的话，那么这个方法可以不进行实现，直接返回null即可
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String loginName = (String) super.getAvailablePrincipal(principals);
        SysUser user=sysUserDataService.getByLoginName(loginName);
        List<SysRole> roleList=sysRoleDataService.getRoleList(user.getId());
        SimpleAuthorizationInfo info=new SimpleAuthorizationInfo();
        for(SysRole role:roleList){
            info.addRole(role.getName());

        }

       List<SysMenu> menuList=sysMenuDataService.findByUserId(user.getId());
        for (SysMenu menu : menuList){
            if (StringUtils.isNotBlank(menu.getPermission())){
                // 添加基于Permission的权限信息
                for (String permission : StringUtils.split(menu.getPermission(),",")){
                    info.addStringPermission(permission);
                    logger.info("@@@@@@@@@@@@@@@"+permission);
                }
            }
        }

        // 返回null将会导致用户访问任何被拦截的请求时都会自动跳转到unauthorizedUrl指定的地址
        return info;
    }
}
