package com.ueater.backstage.common.config;

import feign.Feign;
import feign.Request;
import feign.RequestInterceptor;
import feign.RequestTemplate;
import feign.gson.GsonDecoder;
import feign.gson.GsonEncoder;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author fanlei
 * @version 1.0.0
 * @date 四月 12 2017 下午3:35
 */
@Slf4j
@Configuration
public class FeignConfig {

    @Bean
    public Feign.Builder feignBuilder() {
        return Feign.builder()
                .requestInterceptor(new RequestInterceptor() {
                    @Override
                    public void apply(RequestTemplate template) {
                        template.header("Content-Type", "application/json;charset=utf-8");
                        log.info("SendRequest : {}", template);
                    }
                })
                .options(new Request.Options(10 * 1000, 10 * 1000))
                .encoder(new GsonEncoder())
                .decoder(new GsonDecoder());
    }
}
