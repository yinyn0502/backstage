package com.ueater.backstage.service;

import org.springframework.web.multipart.MultipartFile;

public interface IUploadService {

    String uploadFile(MultipartFile file);
    String uploadImage(MultipartFile file);
}
