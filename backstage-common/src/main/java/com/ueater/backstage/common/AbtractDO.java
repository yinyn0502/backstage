package com.ueater.backstage.common;


import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author fanlei
 * @version 1.0.0
 * @date 四月 06 2017 上午11:01
 */
@Data
public class AbtractDO implements Serializable{

    private Long id;

    private Date createTime;

    private Date updateTime;

    private String createdBy;

    private String updatedBy;

    private Integer deleted;
}
