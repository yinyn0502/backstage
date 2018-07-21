package com.ueater.backstage.web.test;

/**
 * Created by caoli on 2017/9/5.
 */

import javax.naming.AuthenticationException;
import javax.naming.Context;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;

public class AdLoginUtil {
    /**
     *
     * @param userName AD域认证，用户的登录名
     * @param passWord AD域认证，用户的密碼
     */
    public static Map<Integer,String> validAdUser(String userName, String passWord){
        Integer flag=0;
        Map<Integer,String> map=new HashMap<Integer,String>();
        String host = "ueater.local";//AD域IP，必须填写正确
        String domain = "@ueater.local";//域名后缀，例.@noker.cn.com
        String port = "389"; //端口，一般默认389
        String url = new String("ldap://" + host + ":" + port);//固定写法
        String user = userName.indexOf(domain) > 0 ? userName : userName
                + domain;//网上有别的方法，但是在我这儿都不好使，建议这么使用
        Hashtable env = new Hashtable();//实例化一个Env
        DirContext ctx = null;
        env.put(Context.SECURITY_AUTHENTICATION, "simple");//LDAP访问安全级别(none,simple,strong),一种模式，这么写就行
        env.put(Context.SECURITY_PRINCIPAL, user); //用户名
        env.put(Context.SECURITY_CREDENTIALS, passWord);//密码
        env.put(Context.INITIAL_CONTEXT_FACTORY,
                "com.sun.jndi.ldap.LdapCtxFactory");// LDAP工厂类
        env.put(Context.PROVIDER_URL, url);//Url
        try {
            ctx = new InitialDirContext(env);// 初始化上下文
            map.put(200,"身份验证成功");
            System.out.println("身份验证成功!");
        } catch (AuthenticationException e) {
            map.put(301,"身份验证失败");
            System.out.println("身份验证失败!");
            e.printStackTrace();
        } catch (javax.naming.CommunicationException e) {
            map.put(302,"AD域连接失败");
            System.out.println("AD域连接失败!");
            e.printStackTrace();
        } catch (Exception e) {
            map.put(303,"身份验证未知异常");
            System.out.println("身份验证未知异常!");
            e.printStackTrace();
        } finally{
            if(null!=ctx){
                try {
                    ctx.close();
                    ctx=null;
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return map;
    }


    /**
     *
     * @param userName AD域认证，用户的登录名
     * @param passWord AD域认证，用户的密碼
     */
    public static int validAdUsers(String userName, String passWord){
        int flag=0;
        String host = "ueater.local";//AD域IP，必须填写正确
        String domain = "@ueater.local";//域名后缀，例.@noker.cn.com
        String port = "389"; //端口，一般默认389
        String url = new String("ldap://" + host + ":" + port);//固定写法
        String user = userName.indexOf(domain) > 0 ? userName : userName
                + domain;//网上有别的方法，但是在我这儿都不好使，建议这么使用
        Hashtable env = new Hashtable();//实例化一个Env
        DirContext ctx = null;
        env.put(Context.SECURITY_AUTHENTICATION, "simple");//LDAP访问安全级别(none,simple,strong),一种模式，这么写就行
        env.put(Context.SECURITY_PRINCIPAL, user); //用户名
        env.put(Context.SECURITY_CREDENTIALS, passWord);//密码
        env.put(Context.INITIAL_CONTEXT_FACTORY,
                "com.sun.jndi.ldap.LdapCtxFactory");// LDAP工厂类
        env.put(Context.PROVIDER_URL, url);//Url
        try {
            ctx = new InitialDirContext(env);// 初始化上下文
            flag=200;
            System.out.println("身份验证成功!");
        } catch (AuthenticationException e) {
            flag=301;
            System.out.println("身份验证失败!");
            e.printStackTrace();
        } catch (javax.naming.CommunicationException e) {
            flag=302;
            System.out.println("AD域连接失败!");
            e.printStackTrace();
        } catch (Exception e) {
            flag=303;
            System.out.println("身份验证未知异常!");
            e.printStackTrace();
        } finally{
            if(null!=ctx){
                try {
                    ctx.close();
                    ctx=null;
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return flag;
    }



    public static void main(String[] args) {
        int flag=AdLoginUtil.validAdUsers("caoli","Cl19811102!");
        System.out.println(flag);
    }
}