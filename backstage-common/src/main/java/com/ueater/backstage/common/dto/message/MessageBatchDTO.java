package com.ueater.backstage.common.dto.message;

import lombok.Data;

@Data
public class MessageBatchDTO {

    private String title;//标题

    private String content;//推送内容

    private String targetValue;;//文案链接

    private String businessTypeValue;//文案类型

    private String targets;//目标人群

    private String appTypeValue;//设备类型

    private String sendTime;//发送时间

    private Integer iosArriveAppCount;//ios到达设备数

    private String iosArriveAppRate;//ios到达设备率

    private Integer androidArriveAppCount;//android到达设备数

    private String androidArriveAppRate;//android到达设备率

    private Integer iosClickCount;//ios点击数

    private String iosClickRate;//ios点击率

    private Integer androidClickCount;//android点击数

    private String androidClickRate;//android点击率

    private Long iosSendTotal;//ios总推送量

    private Long androidSendTotal;//android总推送量

}
