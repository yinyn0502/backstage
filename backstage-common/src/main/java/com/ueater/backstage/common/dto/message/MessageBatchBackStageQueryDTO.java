package com.ueater.backstage.common.dto.message;

import lombok.Data;

@Data
public class MessageBatchBackStageQueryDTO {
    private Integer currentPage;//当前页
    private Integer pageCount;//每页条数
    private Long startDate;//开始时间
    private Long endDate;//结束时间
    private Integer appType;//设备类型
    private String strStartDate;//开始时间
    private String strEndDate;//结束时间
    private Integer pageNum;//当前页
    private Integer pageSize;//每页条数
}
