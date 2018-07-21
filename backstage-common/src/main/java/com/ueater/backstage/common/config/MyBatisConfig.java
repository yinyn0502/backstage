package com.ueater.backstage.common.config;

import java.util.Properties;

import javax.sql.DataSource;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.github.pagehelper.PageHelper;
import com.ueater.tool.zkConfigGroups.IZKConfigGroups;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;


import javax.annotation.Resource;


@Configuration
@EnableTransactionManagement
public class MyBatisConfig {

    @Autowired
    private Environment env;

    @Resource(name="ZKConfigGroups")
    private IZKConfigGroups zKConfigGroups;

    @Bean
    public DataSource getDataSource() throws Exception {
        Properties props = new Properties();
        props.put("driverClassName", zKConfigGroups.getConfigString("spring.datasource.driverClassName", "mysql"));
        props.put("url", zKConfigGroups.getConfigString("spring.datasource.url", "mysql"));
        props.put("username", zKConfigGroups.getConfigString("spring.datasource.username", "mysql"));
        props.put("password", zKConfigGroups.getConfigString("spring.datasource.password", "mysql"));
        //检测连接是否有效sql
        props.put("validationQuery", zKConfigGroups.getConfigString("spring.datasource.validationQuery", "mysql"));
        //初始化建立物理连接数10
        props.put("initialSize", zKConfigGroups.getConfigString("spring.datasource.initialSize", "mysql"));
        //最大连接池数量50
        props.put("maxActive", zKConfigGroups.getConfigString("spring.datasource.maxActive", "mysql"));
        //最大空闲数量10
        props.put("maxIdle", zKConfigGroups.getConfigString("spring.datasource.maxIdle", "mysql"));
        //最小空闲数量5
        props.put("minIdle", zKConfigGroups.getConfigString("spring.datasource.minIdle", "mysql"));
        //获取连接最大等待时间（ms）100
        props.put("maxWait", zKConfigGroups.getConfigString("spring.datasource.maxWait", "mysql"));
        //检测需要关闭的空闲连接时（检测间隔时间ms）1000 * 60 * 5
        props.put("timeBetweenEvictionRunsMillis", zKConfigGroups.getConfigString("spring.datasource.timeBetweenEvictionRunsMillis", "mysql"));
        //申请连接时执行validationQuery检测连接是否有效false
        props.put("testOnBorrow", zKConfigGroups.getConfigString("spring.datasource.testOnBorrow", "mysql"));
        return DruidDataSourceFactory.createDataSource(props);
    }

    //    @Bean
//    public SqlSessionFactory sqlSessionFactory(DataSource ds) throws Exception {
//        SqlSessionFactoryBean fb = new SqlSessionFactoryBean();
//        fb.setDataSource(ds);
//        fb.setTypeAliasesPackage(env.getProperty("mybatis.type-aliases-package"));
//        fb.setMapperLocations(new PathMatchingResourcePatternResolver().getResources(env.getProperty("mybatis.mapper-locations")));
//        return fb.getObject();
//    }
    @Bean(name = "sqlSessionFactory")
    public SqlSessionFactory sqlSessionFactoryBean(DataSource ds) {
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        try {
            bean.setDataSource(ds);
            bean.setTypeAliasesPackage(env.getProperty("mybatis.type-aliases-package"));
         /*   bean.setMapperLocations(new PathMatchingResourcePatternResolver()
                    .getResources(env.getProperty("mybatis.mapper-locations")));*/
        } catch (Exception e) {
            e.printStackTrace();
        }
        //分页插件
        PageHelper pageHelper = new PageHelper();
        Properties props = new Properties();
        props.setProperty("reasonable", "true");
        props.setProperty("supportMethodsArguments", "true");
        props.setProperty("returnPageInfo", "check");
        props.setProperty("params", "count=countSql");
        pageHelper.setProperties(props);
        //添加插件
        bean.setPlugins(new Interceptor[]{pageHelper});
        try {
            ResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
            bean.setConfigLocation(resolver.getResource("classpath:mybatis-config.xml"));
            return bean.getObject();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


    @Bean
    public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }




    @Bean
    public PlatformTransactionManager annotationDrivenTransactionManager() throws Exception {
        return new DataSourceTransactionManager(this.getDataSource());
    }

}