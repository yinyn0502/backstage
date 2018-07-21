package com.ueater.backstage.service.impl;

import com.ueater.backstage.common.config.ServerMethodConfig;
import com.ueater.backstage.common.constant.Constant;
import com.ueater.backstage.outerservice.FileUploadApi;
import com.ueater.backstage.service.IUploadService;
import com.ueater.tool.feign.FeignConfigHandler;
import com.ueater.tool.response.Response;
import com.ueater.tool.util.ObjectJudgmentUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;

@Slf4j
@Service
public class UploadService implements IUploadService {

    @Resource
    private FeignConfigHandler feignConfigHandler;

    @Override
    public String uploadFile(MultipartFile file) {
        if (file == null) {
            return null;
        }
        FileUploadApi fileUploadApi = null;
        try {
            fileUploadApi = feignConfigHandler.target(FileUploadApi.class, Constant.Image.getHOST(), ServerMethodConfig.ImageApi.IMAGE_BACKSTAGE_IMAGE_UPLOAD);
        }catch (Exception e){
            log.info("uploadFile error, exception:{}", e);
        }
        try {
            if(fileUploadApi != null ){
                Response<String> response = fileUploadApi.uploadFile(file);
                if( response.getCode()==0
                        && !ObjectJudgmentUtil.isNullOrEmpty(response.getData())){
                    return response.getData();
                }
            }
        }catch (Exception e){
            log.error("uploadFile error, exception: {}",e);
        }
        return null;
    }

    @Override
    public String uploadImage(MultipartFile file) {
        if (file == null) {
            return null;
        }
        FileUploadApi fileUploadApi = null;
        try {
            fileUploadApi = feignConfigHandler.target(FileUploadApi.class, Constant.Image.getHOST(), ServerMethodConfig.ImageApi.IMAGE_BACKSTAGE_FILE_UPLOAD);
        }catch (Exception e){
            log.info("uploadImage error, exception:{}", e);
        }
        try {
            if(fileUploadApi != null ){
                Response<String> response = fileUploadApi.uploadImage(file);
                if( response.getCode()==0
                        && !ObjectJudgmentUtil.isNullOrEmpty(response.getData())){
                    return response.getData();
                }
            }
        }catch (Exception e){
            log.error("uploadImage error, exception: {}",e);
        }
        return null;
    }


}
