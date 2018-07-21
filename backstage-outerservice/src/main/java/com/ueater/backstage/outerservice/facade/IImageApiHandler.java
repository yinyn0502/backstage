package com.ueater.backstage.outerservice.facade;

import com.ueater.tool.response.Response;
import org.springframework.web.multipart.MultipartFile;

/**
 * Created by zhangbin on 2017/12/5.
 */
public interface IImageApiHandler {
    Response<String> uploadImage(MultipartFile file);

    Response<String> uploadFile(MultipartFile file);

}
