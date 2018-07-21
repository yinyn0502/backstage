package com.ueater.backstage.common.model.cms;

import lombok.Data;

@Data
public class CmsResourceInfoTO {
    private Long id;
    private String createdBy;       // 创建人
    private Integer entityIdType;   // 	实体id类型
    private String entityIdValue;   // 实体值
    private String imageValue;      // 资源图片地址
    private Long resourceTypeId;    // 资源类型id
    private Integer  sort;             // 资源位置
    private Integer formerSort;      //原来的资源位置
    private String targetTitle;     // 目标标题
    private Integer targetType;     // 目标链接类型
    private String targetValue;     // 目标链接值
    private String textValue;       // 文本值
    private String titleValue;      // 标题值
    private String updatedBy;       // 	更新人

}
