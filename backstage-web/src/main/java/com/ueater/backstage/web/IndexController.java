package com.ueater.backstage.web;

//import com.ueater.tool.response.Response;

import com.ueater.backstage.common.model.SysMenu;
import com.ueater.backstage.common.model.SysUser;
import com.ueater.backstage.service.ISysMenuService;
import com.ueater.tool.annotation.ControllerLog;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
    @Resource
    private ISysMenuService sysMenuService;


    @ControllerLog
    @RequestMapping("/hello")
    public String index(Map<String, Object> model){
        // 直接返回字符串，框架默认会去 spring.view.prefix 目录下的 （index拼接spring.view.suffix）页面
        // 本例为 /WEB-INF/jsp/index.jsp
        model.put("time", new Date());
        model.put("message", "hello CC");
        return "hello";
    }

    /**
     * 首页
     *
     * @return
     */
    @ControllerLog
    @RequestMapping("/index")
    public ModelAndView index(HttpServletRequest request) {
        SysUser sysUser = (SysUser) request.getSession().getAttribute("currentUser");
        if (sysUser == null) {
            ModelAndView m= new ModelAndView("login");
            return m;
        }
        List<SysMenu> menuList=sysMenuService.findByUserIdAndTopMenu(sysUser.getId());
        for(SysMenu s:menuList){

            List<SysMenu> subMenuList=sysMenuService.getChildren(s.getId());
            if(subMenuList!=null&&subMenuList.size()>0) {
                s.setSubSysMenu(subMenuList);
                s.setHasSubSysMenu(true);
                s.setParent(sysMenuService.get(s.getParentId()));
            }
        }

        ModelAndView m= new ModelAndView("index");
        //m.getModel().put("users",users);
        m.getModel().put("menuList", menuList);
        return m;
    }


    /*@RequestMapping("/tabs")
    public ModelAndView tabs() {
        List<SysUserDO> users=sysUserService.listAllSysUser();
        return new ModelAndView("tab", "users", users);
    }*/


  /*  @RequestMapping("/default")
    public ModelAndView tabdefault() {
        List<SysUserDO> users=sysUserService.listAllSysUser();
        return new ModelAndView("default");
    }*/

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

