package com.ueater.backstage.common.dto.message;

import com.ueater.backstage.common.dto.member.BasePagination;
import lombok.Data;

import java.util.List;

@Data
public class MessageBatchInfo {

    private BasePagination basePagination;

    private List<MessageBatchStatisticsDTO> messageBatchStatisticsDTOList;

}
