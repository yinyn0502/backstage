package com.ueater.backstage.outerservice.facade.impl;

import com.ueater.backstage.outerservice.ImageUploadApi;
import com.ueater.backstage.outerservice.facade.IImageApiHandler;
import com.ueater.tool.response.Response;
import com.ueater.tool.response.ResponseCode;
import com.ueater.tool.response.ResponseUtil;
import feign.Feign;
import feign.codec.Encoder;
import feign.form.spring.SpringFormEncoder;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;

@Service
public class ImageApiHandler implements IImageApiHandler {

    @Resource
    private MultipartSupportImageClient multipartSupportImageClient;

    @Override
    public Response<String> uploadImage(MultipartFile file) {
        if (file == null) {
            return ResponseUtil.fail(ResponseCode.PARAM_NULL);
        }
        try {
            Response<String> response = multipartSupportImageClient.uploadCmsImage(file);
            if(response!=null){
                return response;
            }else{
                return ResponseUtil.fail(ResponseCode.INVOKE_IMAGE_ERROR);
            }
        } catch (Exception e) {
            return ResponseUtil.fail(ResponseCode.INVOKE_IMAGE_ERROR);
        }
    }

    @Override
    public Response<String> uploadFile(MultipartFile file) {
        if (file == null) {
            return ResponseUtil.fail(ResponseCode.PARAM_NULL);
        }
        try {
            Response<String> response = multipartSupportImageClient.uploadCmsFile(file);
            if(response!=null){
                return response;
            }else{
                return ResponseUtil.fail(ResponseCode.INVOKE_IMAGE_ERROR);
            }
        } catch (Exception e) {
            return ResponseUtil.fail(ResponseCode.INVOKE_IMAGE_ERROR);
        }
    }

    @FeignClient(
            name = "imageUpload",
            url = "${image.upload.host}",
            configuration = MultipartSupportImageClient.MultipartSupportConfig.class
    )
    private interface MultipartSupportImageClient extends ImageUploadApi {

        @Slf4j
        @Configuration
        class MultipartSupportConfig {

            @Bean("feignBuilderImage")
            public Feign.Builder feignBuilderImage() {
                return Feign.builder();
            }

            @Bean
            @Primary
            @Scope("prototype")
            public Encoder feignSpringFormEncoder() {
                return new SpringFormEncoder();
            }
        }
    }
    
}
