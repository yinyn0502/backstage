package com.ueater.backstage.web.auth;

import com.google.common.collect.Maps;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Properties;

/**
 * Shiro 配置
 *
 * @author   单红宇(365384722)
 * @myblog  http://blog.csdn.net/catoop/
 * @create    2016年1月13日
 */
@Configuration
public class ShiroConfiguration {

    private static final Logger logger = LoggerFactory.getLogger(ShiroConfiguration.class);


    @Bean
    public EhCacheManager getEhCacheManager() {
        EhCacheManager em = new EhCacheManager();
        em.setCacheManagerConfigFile("classpath:ehcache-shiro.xml");
        return em;
    }

    @Bean(name = "myShiroRealm")
    public MyShiroRealm myShiroRealm(EhCacheManager cacheManager) {
        MyShiroRealm realm = new MyShiroRealm();
        realm.setCacheManager(cacheManager);
        return realm;
    }

    /**
     * 注册DelegatingFilterProxy（Shiro）
     * 集成Shiro有2种方法：
     * 1. 按这个方法自己组装一个FilterRegistrationBean（这种方法更为灵活，可以自己定义UrlPattern，
     * 在项目使用中你可能会因为一些很但疼的问题最后采用它， 想使用它你可能需要看官网或者已经很了解Shiro的处理原理了）
     * 2. 直接使用ShiroFilterFactoryBean（这种方法比较简单，其内部对ShiroFilter做了组装工作，无法自己定义UrlPattern，
     * 默认拦截 /*）
     *
     * @param
     * @return
     * @author SHANHY
     * @create  2016年1月13日
     */
//  @Bean
//  public FilterRegistrationBean filterRegistrationBean() {
//      FilterRegistrationBean filterRegistration = new FilterRegistrationBean();
//      filterRegistration.setFilter(new DelegatingFilterProxy("shiroFilter"));
//      //  该值缺省为false,表示生命周期由SpringApplicationContext管理,设置为true则表示由ServletContainer管理
//      filterRegistration.addInitParameter("targetFilterLifecycle", "true");
//      filterRegistration.setEnabled(true);
//      filterRegistration.addUrlPatterns("/*");// 可以自己灵活的定义很多，避免一些根本不需要被Shiro处理的请求被包含进来
//      return filterRegistration;
//  }

    @Bean(name = "lifecycleBeanPostProcessor")
    public LifecycleBeanPostProcessor getLifecycleBeanPostProcessor() {
        return new LifecycleBeanPostProcessor();
    }

    @Bean
    public DefaultAdvisorAutoProxyCreator getDefaultAdvisorAutoProxyCreator() {
        DefaultAdvisorAutoProxyCreator daap = new DefaultAdvisorAutoProxyCreator();
        daap.setProxyTargetClass(true);
        return daap;
    }

    @Bean(name = "securityManager")
    public DefaultWebSecurityManager getDefaultWebSecurityManager(MyShiroRealm myShiroRealm) {
        DefaultWebSecurityManager dwsm = new DefaultWebSecurityManager();
        dwsm.setRealm(myShiroRealm);
//      <!-- 用户授权/认证信息Cache, 采用EhCache 缓存 -->
        dwsm.setCacheManager(getEhCacheManager());

        return dwsm;
    }

  /*  @Bean
    public AuthorizationAttributeSourceAdvisor getAuthorizationAttributeSourceAdvisor(DefaultWebSecurityManager securityManager) {
        AuthorizationAttributeSourceAdvisor aasa = new AuthorizationAttributeSourceAdvisor();
        aasa.setSecurityManager(securityManager);
        return aasa;
    }*/

    /**
     * 加载shiroFilter权限控制规则（从数据库读取然后配置）
     *
     * @author SHANHY
     * @create  2016年1月14日
     */
    private void loadShiroFilterChain(ShiroFilterFactoryBean shiroFilterFactoryBean){
        /////////////////////// 下面这些规则配置最好配置到配置文件中 ///////////////////////
        Map<String, String> filterChainDefinitionMap = new LinkedHashMap<String, String>();
        // authc：该过滤器下的页面必须验证后才能访问，它是Shiro内置的一个拦截器org.apache.shiro.web.filter.authc.FormAuthenticationFilter
        filterChainDefinitionMap.put("/sys", "authc");// 这里为了测试，只限制/user，实际开发中请修改为具体拦截的请求规则
        // anon：它对应的过滤器里面是空的,什么都没做
        logger.info("##################从数据库读取权限规则，加载到shiroFilter中##################");
        //filterChainDefinitionMap.put("/user/edit/**", "authc,perms[user:edit]");// 这里为了测试，固定写死的值，也可以从数据库或其他配置中读取
        //filterChainDefinitionMap.put("/sys/area/**", "authc,perms[sys:area:list]");

        filterChainDefinitionMap.put("/login", "anon");
        filterChainDefinitionMap.put("/logout", "anon");
        filterChainDefinitionMap.put("/**", "anon");//anon 可以理解为不拦截
        filterChainDefinitionMap.put("/tag/**", "anon");//anon 可以理解为不拦截
        filterChainDefinitionMap.put("/member/**", "anon");//anon 可以理解为不拦截
        filterChainDefinitionMap.put("/order/return/**", "anon");//anon 可以理解为不拦截
        filterChainDefinitionMap.put("/activity/**", "anon");
        filterChainDefinitionMap.put("/coupondistribution/**", "anon");
        filterChainDefinitionMap.put("/coupon/**", "anon");
        filterChainDefinitionMap.put("/message/**", "anon");

        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);
    }

    /**
     * ShiroFilter<br/>
     * 注意这里参数中的 StudentService 和 IScoreDao 只是一个例子，因为我们在这里可以用这样的方式获取到相关访问数据库的对象，
     * 然后读取数据库相关配置，配置到 shiroFilterFactoryBean 的访问规则中。实际项目中，请使用自己的Service来处理业务逻辑。
     *
     * @param
     * @param
     * @param
     * @return
     * @author SHANHY
     * @create  2016年1月14日
     */
    @Bean(name = "shiroFilter")
    public ShiroFilterFactoryBean getShiroFilterFactoryBean(DefaultWebSecurityManager securityManager) {

        ShiroFilterFactoryBean shiroFilterFactoryBean = new MyShiroFilterFactoryBean();
        // 必须设置 SecurityManager
        shiroFilterFactoryBean.setSecurityManager(securityManager);
        // 如果不设置默认会自动寻找Web工程根目录下的"/login.jsp"页面
        shiroFilterFactoryBean.setLoginUrl("/login");
        // 登录成功后要跳转的连接
        shiroFilterFactoryBean.setSuccessUrl("/index");
        shiroFilterFactoryBean.setUnauthorizedUrl("/403");


        loadShiroFilterChain(shiroFilterFactoryBean);
        return shiroFilterFactoryBean;
    }

    /**
     * 开启Shiro的注解(如@RequiresRoles,@RequiresPermissions),需借助SpringAOP扫描使用Shiro注解的类,并在必要时进行安全逻辑验证
     * 配置以下两个bean(DefaultAdvisorAutoProxyCreator(可选)和AuthorizationAttributeSourceAdvisor)即可实现此功能
     * @return
     */
    @Bean
    @DependsOn({"lifecycleBeanPostProcessor"})
    public DefaultAdvisorAutoProxyCreator advisorAutoProxyCreator(){
        DefaultAdvisorAutoProxyCreator advisorAutoProxyCreator = new DefaultAdvisorAutoProxyCreator();
        advisorAutoProxyCreator.setProxyTargetClass(true);
        return advisorAutoProxyCreator;
    }

   /* @Bean
    public AuthorizationAttributeSourceAdvisor getAuthorizationAttributeSourceAdvisor(DefaultWebSecurityManager securityManager) {
        AuthorizationAttributeSourceAdvisor aasa = new AuthorizationAttributeSourceAdvisor();
        aasa.setSecurityManager(securityManager);
        return aasa;
    }*/

    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(DefaultWebSecurityManager securityManager){
        System.out.println("开启了Shiro注解支持");
        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
        authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
        return authorizationAttributeSourceAdvisor;
    }


   /*
   @Bean(name = "freemarkerConfig")
    public static ShiroTagFreeMarkerConfigurer getFreemarkerConfig() {
        ShiroTagFreeMarkerConfigurer shiroTagFreeMarkerConfigurer = new ShiroTagFreeMarkerConfigurer();
        shiroTagFreeMarkerConfigurer.setTemplateLoaderPath("/resources/             template");
        Map<String, Object> variables = Maps.newHashMap();
        shiroTagFreeMarkerConfigurer.setFreemarkerVariables(variables);
        Properties settings = new Properties();
        settings.put("template_update_delay", "0");
        settings.put("defaultEncoding", "UTF-8");
        settings.put("url_escaping_charset", "UTF-8");
        settings.put("locale", "zh_CN");
        settings.put("boolean_format", "true,false");
        settings.put("datetime_format", "yyyy-MM-dd HH:mm:ss");
        settings.put("date_format", "yyyy-MM-dd");
        settings.put("time_format", "HH:mm:ss");
        settings.put("number_format", "0.######");
        settings.put("whitespace_stripping", "true");
//        settings.put("auto_import", "/ftl/spring.ftl as s");
        shiroTagFreeMarkerConfigurer.setFreemarkerSettings(settings);
        return shiroTagFreeMarkerConfigurer;
    }
*/

}