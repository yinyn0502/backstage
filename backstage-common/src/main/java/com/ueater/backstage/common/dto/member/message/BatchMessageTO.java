package com.ueater.backstage.common.dto.member.message;

import lombok.Data;

@Data
public class BatchMessageTO {

    /**
     * 标题
     */
	private String title;

    /**
     * 推送内容
     */
    private String content;

    /**
     * 文案链接
     */
    private String targetValue;

    /**
     * 路径指向类型
     */
    private Integer targetType;

    /**
     * 文案类型
     */
    private Integer businessType;

    /**
     * 目标
     */
    private Integer personType;

    /**
     * 目标人群
     */
    private String targets;

    /**
     * 设备类型
     */
    private Integer appType;

    /**
     * 预约类型
     */
    private Integer bookType;

    /**
     * 预约时间
     */
    private String bookTime;

    private Long storeId;
}
