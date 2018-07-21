package com.ueater.backstage.outerservice;

import com.ueater.backstage.common.dto.member.*;
import com.ueater.backstage.common.dto.member.message.MemberBatchMessgeDTO;
import com.ueater.backstage.common.dto.message.MessageBatchBackStageQueryDTO;
import com.ueater.backstage.common.dto.message.MessageBatchDTO;
import com.ueater.backstage.common.dto.message.MessageBatchInfo;
import com.ueater.tool.response.Response;

import feign.Param;
import feign.RequestLine;

/**
 * @author xurupeng
 * @version 1.0.0
 * @date 9月 25 2017 下午1:44
 */
public interface MessageApi {

    /**
     * 预约发送一批消息
     * @param memberBackstageSaveOrUpdateDTO
     * @return
     */
    @RequestLine("POST /message/jpushBookBatchMessage HTTP/1.1")
    Response<Object> sendBatchBookMessage(MemberBatchMessgeDTO memberBatchMessgeDTO);

    /**
     * push列表
     * @param messageBatchBackStageQueryDTO
     * @return
     */
    @RequestLine("POST /message/batch/list HTTP/1.1")
    Response<MessageBatchInfo> listMessageBatch(MessageBatchBackStageQueryDTO messageBatchBackStageQueryDTO);

    /**
     * push详情
     * @param messageBatchId
     * @return
     */
    @RequestLine("GET /message/batch/detail?messageBatchId={messageBatchId} HTTP/1.1")
    Response<MessageBatchDTO> getMessageBatch(@Param("messageBatchId") Long messageBatchId);

}
