package com.ueater.backstage.web;

import com.ueater.backstage.common.model.SysUser;
import com.ueater.backstage.service.impl.SysUserService;
import com.ueater.tool.annotation.ControllerLog;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


/**    
 * @Description:    
 * @Author:       花荣   
 * @CreateDate:   2018/7/22 16:17     
 */
@Slf4j
@Controller
public class LoginController {
    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    private SysUserService sysUserService;

    @ControllerLog
    @RequestMapping(value="/login",method=RequestMethod.GET)
    public ModelAndView loginForm(){
       ModelAndView model= new ModelAndView("login");
       model.getModel().put("user",new SysUser());
       return model;
    }


    @ControllerLog
    @RequestMapping(value="/home",method=RequestMethod.GET)
    public ModelAndView home(){
        ModelAndView model= new ModelAndView("home");
        return model;
    }

    @ControllerLog
    @RequestMapping(value="/message",method=RequestMethod.GET)
    public ModelAndView message(String content){
        ModelAndView model= new ModelAndView("messages");
        model.getModel().put("message",content);
        return model;
    }


    @RequestMapping(value="/login",method=RequestMethod.POST)
    public String login(SysUser user, boolean rememberMe, RedirectAttributes redirectAttributes,
                        HttpServletRequest request){

        String username = user.getLoginName();
        if(StringUtils.isBlank(user.getLoginName()) || StringUtils.isBlank(user.getPassword())){
            logger.info("用户名或密码为空! ");
            redirectAttributes.addFlashAttribute("message", "用户名或密码为空!");
            return "redirect:login";
        }


        //对密码进行加密后验证
        UsernamePasswordToken token = new UsernamePasswordToken(user.getLoginName(), user.getPassword(),rememberMe);
        //获取当前的Subject
        Subject currentUser = SecurityUtils.getSubject();
        try {
            //在调用了login方法后,SecurityManager会收到AuthenticationToken,并将其发送给已配置的Realm执行必须的认证检查
            //每个Realm都能在必要时对提交的AuthenticationTokens作出反应
            //所以这一步在调用login(token)方法时,它会走到MyRealm.doGetAuthenticationInfo()方法中,具体验证方式详见此方法
            logger.info("对用户[" + username + "]进行登录验证..验证开始");
            currentUser.login(token);
            logger.info("对用户[" + username + "]进行登录验证..验证通过");
            logger.info("用户[" + username + "]登录认证通过(这里可以进行一些认证通过后的一些系统参数初始化操作)");
            SysUser  sysUser = sysUserService.getByLoginName(username);
            request.getSession().setAttribute("currentUser",sysUser);
            request.getSession().setAttribute("loginName",user.getLoginName());
            return "redirect:index";
        }catch(UnknownAccountException uae){
            logger.info("对用户[" + username + "]进行登录验证..验证未通过,未知账户");
            redirectAttributes.addFlashAttribute("message", "未知账户");
        }catch(IncorrectCredentialsException ice){
            logger.info("对用户[" + username + "]进行登录验证..验证未通过,错误的凭证");
            redirectAttributes.addFlashAttribute("message", "密码不正确");
        }catch(LockedAccountException lae){
            logger.info("对用户[" + username + "]进行登录验证..验证未通过,账户已锁定");
            redirectAttributes.addFlashAttribute("message", "账户已锁定");
        }catch(ExcessiveAttemptsException eae){
            logger.info("对用户[" + username + "]进行登录验证..验证未通过,错误次数大于5次,账户已锁定");
            redirectAttributes.addFlashAttribute("message", "用户名或密码错误次数大于5次,账户已锁定");
        }catch (DisabledAccountException sae){
            logger.info("对用户[" + username + "]进行登录验证..验证未通过,帐号已经禁止登录");
            redirectAttributes.addFlashAttribute("message", "帐号已经禁止登录");
        }catch(AuthenticationException ae){
            //通过处理Shiro的运行时AuthenticationException就可以控制用户登录失败或密码错误时的情景
            logger.info("对用户[" + username + "]进行登录验证..验证未通过,堆栈轨迹如下");
            ae.printStackTrace();
            redirectAttributes.addFlashAttribute("message", "用户名或密码不正确");
        }
        return "redirect:login";
    }





}
