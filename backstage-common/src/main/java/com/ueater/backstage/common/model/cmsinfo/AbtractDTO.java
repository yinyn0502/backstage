package com.ueater.backstage.common.model.cmsinfo;


import lombok.Data;

import java.io.Serializable;
import java.util.Date;


@Data
public class AbtractDTO implements Serializable{

    private Long id;

    private Date createTime;

    private Date updateTime;

    private String createdBy;

    private String updatedBy;

    private Integer deleted;
}
