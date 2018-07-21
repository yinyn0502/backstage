package com.ueater.backstage.common.dto.message;

import lombok.Data;

@Data
public class MessageBatchStatisticsDTO {

    private Long id;

    private String sendTime;//发送时间

    private String bookTime;//预约发送时间

    private String title;//推送标题

    private String businessType;//业务类型

    private String appType;//设备类型

    private Integer arriveAppCount;//到达设备数

    private String arriveAppRate;//到达设备率

    private Integer clickCount;//点击数

    private String clickRate;//点击率

    private String status;//状态

    private Long sendTotal;//总推送数

}
