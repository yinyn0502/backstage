package com.ueater.backstage.outerservice;

import com.ueater.tool.response.Response;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author fanlei
 * @version 1.0.0
 * @date 九月 13 2017 上午10:08
 */
public interface FileUploadApi {

    @RequestMapping(
            value = "/image/backstage/image/upload",
            method = RequestMethod.POST
    )
    @ResponseBody
    Response<String> uploadImage(@RequestPart("file") MultipartFile file);

    @RequestMapping(
            value = "/image/backstage/file/upload",
            method = RequestMethod.POST
    )
    @ResponseBody
    Response<String> uploadFile(@RequestPart("file") MultipartFile file);
}
