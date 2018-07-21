package com.ueater.backstage.common.model.image;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;

/**
 * @author fanlei
 * @version 1.0.0
 * @date 八月 16 2017 下午4:13
 */
@Data
public class ImageUploadTO implements Serializable {

    private Long reverseId;

    private MultipartFile file;
}
