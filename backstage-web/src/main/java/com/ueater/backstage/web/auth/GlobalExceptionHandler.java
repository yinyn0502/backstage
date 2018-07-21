package com.ueater.backstage.web.auth;


import freemarker.core.InvalidReferenceException;
import org.apache.shiro.authz.UnauthenticatedException;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;


/**
 * Created by caoli on 2017-3-21.
 */


public class GlobalExceptionHandler {
    public static final String DEFAULT_ERROR_VIEW = "error";

   @ExceptionHandler(value = Exception.class)
    public ModelAndView defaultErrorHandler(HttpServletRequest req, Exception e) throws Exception {
        ModelAndView mav = new ModelAndView();

       /* if (e instanceof UnauthorizedException){
            mav.addObject("exception", "没有该权限");
            mav.addObject("url", req.getRequestURL());
        }else if(e instanceof freemarker.core.InvalidReferenceException){
            mav.addObject("exception", "Freemaker模板出错");
            mav.addObject("url", req.getRequestURL());

        }
         else {
            mav.addObject("exception", e);
            mav.addObject("url", req.getRequestURL());
        }
        */


        mav.setViewName(DEFAULT_ERROR_VIEW);
        return mav;
    }





/* @ExceptionHandler(value = Exception.class)
    public String defaultErrorHandler(HttpServletRequest req, Exception e,RedirectAttributes redirectAttributes) throws Exception {


        if (e instanceof UnauthorizedException){
           *//*
*/
/* mav.addObject("exception", "没有该权限");
            mav.addObject("url", req.getRequestURL());*//*
*/
/*
            Tools.addMessage(redirectAttributes,"没有该权限");
            return "redirect:/sys/user/login";
        }else if(e instanceof UnauthenticatedException){
           *//*
*/
/* mav.addObject("exception", "请重新登录");
            mav.addObject("url", req.getRequestURL());*//*
*/
/*
            Tools.addMessage(redirectAttributes,"请重新登录");
            return "redirect:/sys/user/login";
        }

        else {
          *//*
*/
/*  mav.addObject("exception", e);
            mav.addObject("url", req.getRequestURL());*//*
*/
/*
            return "redirect:/sys/user/error";

        }
      *//*
*/
/*  mav.setViewName(DEFAULT_ERROR_VIEW);*//*
*/
/*

    }*/

}

