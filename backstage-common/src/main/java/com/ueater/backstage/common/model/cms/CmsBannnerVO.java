package com.ueater.backstage.common.model.cms;

import lombok.Data;

@Data
public class CmsBannnerVO {
    private Long id;
    private Integer sort;
    private String imageUrl;
    private String filePath;
    private String title;
    private Integer targetType;
}
