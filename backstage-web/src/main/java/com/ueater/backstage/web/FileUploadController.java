package com.ueater.backstage.web;

import com.ueater.backstage.service.IUploadService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;

@Controller
@RequestMapping(value = "/upload")
@Slf4j
public class FileUploadController {
    
    @Resource
    private IUploadService uploadService;
    
    @RequestMapping("/file")
    public String uploadFile(@RequestPart("file") MultipartFile file) {

        return uploadService.uploadFile(file);
    }
    @RequestMapping("/image")
    public String uploadImage(@RequestPart("file") MultipartFile file) {
        return uploadService.uploadImage(file);
    }

}
