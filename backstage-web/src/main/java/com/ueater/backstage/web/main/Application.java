package com.ueater.backstage.web.main;

import com.google.common.collect.Maps;
import com.ueater.backstage.web.auth.ShiroTagFreeMarkerConfigurer;
import org.apache.logging.log4j.core.lookup.MainMapLookup;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import java.util.Map;
import java.util.Properties;

import javax.servlet.MultipartConfigElement;

/**
 * Created by fanlei on 2017/3/24.
 */
@Configuration
@EnableAutoConfiguration
@EnableFeignClients(basePackages = "com.ueater.backstage")
@ComponentScan(value = {"com.ueater"})
@SpringBootApplication
@MapperScan("com.ueater.backstage.dao")
public class Application extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(
            SpringApplicationBuilder application) {
        MainMapLookup.setMainArguments("ueater-backstage");
        return application.sources(Application.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @Bean
    public MultipartConfigElement multipartConfigElement() {
        MultipartConfigFactory factory = new MultipartConfigFactory();
        //  单个数据大小
        factory.setMaxFileSize("10240KB"); // KB,MB
        /// 总上传数据大小
        factory.setMaxRequestSize("102400KB");
        return factory.createMultipartConfig();
    }
}



