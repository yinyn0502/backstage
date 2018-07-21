package com.ueater.backstage.common.model.cms;

import lombok.Data;

import java.util.Date;

/**
 * Created by mayumeng on 2017-10-19.
 */
@Data
public class HomePageLabelEditTO {

    private Long id;
    /**
     * 客户端类型
     */
    private Integer appType;

    /**
     * 生效版本
     */
    private String appVersion;

    /**
     * 生效门店ID
     */
    private Long storeId;

    /**
     * 标签名称
     */
    private String labelName;

    /**
     * 标签类型 	0静态页面，1商品列表，2单品页(跳转类型)
     */
    private Integer targetType;

    /**
     * 标签值(跳转链接)
     */
    private String targetValue;

    /**
     * 标签展示优先级(标签位置)
     */
    private Integer priority;

    private Date createTime;

    private Date updateTime;

    private String createdBy;

    private String updatedBy;

    private Integer deleted;

    String cmd;
}
