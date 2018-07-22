package com.ueater.backstage.web;


import com.ueater.backstage.common.model.SysMenu;
import com.ueater.backstage.common.model.SysUser;
import com.ueater.backstage.service.ISysMenuService;
import com.ueater.tool.annotation.ControllerLog;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/")
public class IndexController {
    private static Logger logger = LoggerFactory.getLogger(IndexController.class);
    @Autowired
    private ISysMenuService sysMenuService;

    /**
     * 首页
     *
     * @return
     */
    @ControllerLog
    @RequestMapping("/index")
    public ModelAndView index(HttpServletRequest request) {
        SysUser sysUser = (SysUser) request.getSession().getAttribute("currentUser");
        log.info("当前登录人 {}", sysUser);

        ModelAndView view= new ModelAndView("index");
        if (sysUser != null ) {
            List<SysMenu> menuList=sysMenuService.findByUserIdAndTopMenu(sysUser.getId());
            for(SysMenu s:menuList){

                List<SysMenu> subMenuList=sysMenuService.getChildren(s.getId());
                if(subMenuList!=null&&subMenuList.size()>0) {
                    s.setSubSysMenu(subMenuList);
                    s.setHasSubSysMenu(true);
                    s.setParent(sysMenuService.get(s.getParentId()));
                }
            }
            view.getModel().put("menuList", menuList);
            return view;
        }else {
            return new ModelAndView("login");
        }
    }

  @RequestMapping("/logout")
  public void logout(HttpServletResponse response) {

      //在这里执行退出系统前需要清空的数据
      Subject subject = SecurityUtils.getSubject();
      subject.logout();
      try {
        response.sendRedirect("login");

      } catch (Exception e) {
          log.error("logout error {}", e);
      }
  }
}

