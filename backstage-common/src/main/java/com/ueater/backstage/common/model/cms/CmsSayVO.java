package com.ueater.backstage.common.model.cms;

import lombok.Data;

import java.util.List;

/**
 * eat说
 */

@Data
public class CmsSayVO {
    private Long id;//资源类型id
    private String imagePath;//图片路径
    private String filePath;//文件路径
    private String title;//标题
    private Integer sort;

}
