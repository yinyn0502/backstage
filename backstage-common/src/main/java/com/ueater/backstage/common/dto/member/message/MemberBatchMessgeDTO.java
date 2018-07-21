package com.ueater.backstage.common.dto.member.message;

import java.util.Date;


import lombok.Data;

@Data
public class MemberBatchMessgeDTO {

	private String title;//标题

    private String content;//推送内容

    private String targetValue;;//文案链接

    private Integer targetType;//路径指向类型

    private Integer businessType;//文案类型

    private Integer appType;//设备类型

    private Integer messageType;//消息类型
    
    private Long templateId;//发送消息模板id

    private Long bookTime;//发送时间
    
    private String jpushMessageIds;;//极光编号

    private String targets;//目标人群
    
    private Boolean isBatch;
    
    private Boolean isBook;//是否预约发送
    
    
    
}
