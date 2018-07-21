package com.ueater.backstage.service;

import com.ueater.backstage.common.dto.member.message.BatchMessageTO;
import com.ueater.backstage.common.dto.member.message.MemberBatchMessgeDTO;
import com.ueater.backstage.common.dto.message.MessageBatchBackStageQueryDTO;
import com.ueater.backstage.common.dto.message.MessageBatchDTO;
import com.ueater.backstage.common.dto.message.MessageBatchInfo;
import com.ueater.tool.response.Response;

public interface IMessageService {

	Response<String> sendBatchJPushService(BatchMessageTO batchMessage);
	/**
	 * push列表
	 * @param messageBatchBackStageQueryDTO
	 * @return
	 */
	MessageBatchInfo listMessageBatch(MessageBatchBackStageQueryDTO messageBatchBackStageQueryDTO);
	/**
	 * push详情
	 * @param messageBatchId
	 * @return
	 */
	MessageBatchDTO getMessageBatch(Long messageBatchId);

}
