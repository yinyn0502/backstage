package com.ueater.backstage.common.model.product;

import lombok.Data;

/**
 * 推送pos 分类
 * Created by xurupeng on 2017/7/26.
 */
@Data
public class PosIndustryCategoryDTO {
    private Long id;
    private Long categoryCode;
    private String path;
    private String name;
    private Long parentId;
    private Integer level;
    private Integer isDelete;
    private Boolean existPromo;
}
