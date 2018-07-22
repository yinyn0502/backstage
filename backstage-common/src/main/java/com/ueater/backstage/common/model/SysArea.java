package com.ueater.backstage.common.model;

import lombok.Data;

import java.util.Date;

/**    
 * @Description:    
 * @Author:       花荣   
 * @CreateDate:   2018/7/22 16:03     
 */
@Data
public class SysArea {
    private Long id;

    private Long parentId;

    private String parentIds;

    private String name;

    private Long sort;

    private String code;

    private String type;

    private Long createBy;

    private Date createDate;

    private Long updateBy;

    private Date updateDate;

    private String remarks;

    private String delFlag;

    private SysArea parent;
}