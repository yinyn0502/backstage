package com.ueater.backstage.service.impl;

import javax.annotation.Resource;

import com.ueater.backstage.common.dto.member.MemberBackstageDTO;
import com.ueater.backstage.common.dto.member.MemberBackstageInfoDTO;
import com.ueater.backstage.common.dto.message.MessageBatchBackStageQueryDTO;
import com.ueater.backstage.common.dto.message.MessageBatchDTO;
import com.ueater.backstage.common.dto.message.MessageBatchInfo;
import com.ueater.backstage.common.enums.backstage.BackstageResponseCode;
import com.ueater.backstage.common.util.JsonUtil;
import com.ueater.tool.response.ResponseCode;
import com.ueater.tool.response.ResponseUtil;
import com.ueater.tool.util.BeanCopierUtil;
import com.ueater.tool.util.DateTimeUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ueater.backstage.common.config.ServerMethodConfig;
import com.ueater.backstage.common.constant.Constant;
import com.ueater.backstage.common.dto.member.message.BatchMessageTO;
import com.ueater.backstage.common.dto.member.message.MemberBatchMessgeDTO;
import com.ueater.backstage.common.util.DateChangeUtil;
import com.ueater.backstage.outerservice.MemberApi;
import com.ueater.backstage.outerservice.MessageApi;
import com.ueater.backstage.service.IMessageService;
import com.ueater.tool.feign.FeignConfigHandler;
import com.ueater.tool.response.Response;
import com.ueater.tool.util.DateTimeUtil;
import com.ueater.tool.util.ObjectJudgmentUtil;

import lombok.extern.slf4j.Slf4j;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class MessageService implements IMessageService{
	
	
	@Resource
	private FeignConfigHandler feignConfigHandler;

	@Autowired
    private  MemberService memberService;
	
	
	@Override
	public Response<String> sendBatchJPushService(BatchMessageTO batchMessage) {
		MemberBatchMessgeDTO memberBatchMessgeDTO = new MemberBatchMessgeDTO();
		BeanUtils.copyProperties(batchMessage, memberBatchMessgeDTO);
		memberBatchMessgeDTO.setTemplateId(Constant.Message.getBatchPushTepletID());
		if(batchMessage.getBookTime()!=null){
			memberBatchMessgeDTO.setBookTime(DateTimeUtil.getFormatDate(batchMessage.getBookTime(), "yyyy-MM-dd HH:mm:ss").getTime());
		}

        //门店发送消息--临时方案后续优化start by yyn
        memberBatchMessgeDTO.setIsBatch(true);
		if (batchMessage.getPersonType() == 0 && batchMessage.getStoreId() != null ) {
            //通过门店id 获取所有注册用户
            MemberBackstageInfoDTO memberInfoList = memberService.listMemberByStoreId(batchMessage.getStoreId());
            StringBuffer sb = new StringBuffer();

            if (memberInfoList != null && memberInfoList.getMemberBackstageDTOList().size() > 0 ) {
                List<MemberBackstageDTO> memberList = memberInfoList.getMemberBackstageDTOList();
                memberList.stream().forEach(m -> sb.append(m.getMobile()).append(","));
            }

            if (sb.length() > 0 ) {
                memberBatchMessgeDTO.setTargets(sb.substring(0, sb.length() - 1));
            }

        }
        //门店发送消息--临时方案后续优化 end

       /* if(batchMessage.getTargets()!=null&&!batchMessage.getTargets().trim().equals("")){
            memberBatchMessgeDTO.setIsBatch(true);
        }else {
            return ResponseUtil.fail(ResponseCode.PARAM_NULL);
        }*/


		/*if(batchMessage.getPersonType()==0){
			memberBatchMessgeDTO.setIsBatch(false);
			memberBatchMessgeDTO.setTargets(Constant.Message.FANOUT);
		}else{
			if(batchMessage.getTargets()!=null&&!batchMessage.getTargets().trim().equals("")){
				memberBatchMessgeDTO.setIsBatch(true);
			}else {
				return ResponseUtil.fail(ResponseCode.PARAM_NULL);
			}
		}*/
		if(batchMessage.getBookType()==0){
			memberBatchMessgeDTO.setIsBook(false);
		}else{
			memberBatchMessgeDTO.setIsBook(true);
		}
		if(memberBatchMessgeDTO.getIsBook()){
			MessageApi messageApi = null;
			try {
				messageApi = feignConfigHandler.target(MessageApi.class, Constant.Message.getHOST(), ServerMethodConfig.MessageApi.MESSAGE_JPUSHBATCHBOOKMESSAGE_POST);
			}catch (Exception e){
				log.error("sendBatchJPush memberApi connection error",e);
				return ResponseUtil.fail(ResponseCode.INVOKE_MESSAGE_ERROR);
			}
			try {
				if( messageApi != null ) {
				    Response<Object> sendBatchMessage = messageApi.sendBatchBookMessage(memberBatchMessgeDTO);
					log.info("sendBatchBookMessage Response:" + sendBatchMessage);
					return buildResponse(sendBatchMessage, true);
				}
			}catch (Exception e){
				log.error("sendBatchBookMessage error",e);
				return ResponseUtil.fail(ResponseCode.INVOKE_MESSAGE_ERROR);
			}
			return ResponseUtil.fail(ResponseCode.INVOKE_MESSAGE_ERROR);
		}else{
			MemberApi memberApi = null;
			try {
				memberApi = feignConfigHandler.target(MemberApi.class, Constant.Member.getHOST(), ServerMethodConfig.MemberApi.MEMBER_SEND_BATCH_MESSAGE);
			}catch (Exception e){
				log.error("sendBatchJPush memberApi connection error",e);
				return ResponseUtil.fail(ResponseCode.INVOKE_MESSAGE_ERROR);
			}
			try {
				if( memberApi != null ) {
				    Response<Object> sendBatchMessage = memberApi.sendBatchMessage(memberBatchMessgeDTO);
					log.info("sendBatchJPush Response:" + sendBatchMessage);
					return buildResponse(sendBatchMessage, false);
				}
			}catch (Exception e){
				log.error("sendBatchJPush error",e);
				return ResponseUtil.fail(ResponseCode.INVOKE_MESSAGE_ERROR);
			}
			return ResponseUtil.fail(ResponseCode.INVOKE_MESSAGE_ERROR);
		}
		
	}

	/**
	 * 抽取类似Response处理逻辑
	 * @param sendBatchMessage
	 * @return
	 */
	private Response<String> buildResponse(Response<Object> sendBatchMessage, boolean isBook) {
		if (!ObjectJudgmentUtil.isNullOrEmpty(sendBatchMessage)&&sendBatchMessage.getCode() == 0) {
            return isBook?ResponseUtil.success("预约消息成功!"):ResponseUtil.success("发送消息成功!");
        }else{
            if (ObjectJudgmentUtil.isNullOrEmpty(sendBatchMessage)){
                return ResponseUtil.fail(ResponseCode.INVOKE_MESSAGE_ERROR);
            } else {
                return ResponseUtil.fail(ResponseCode.INVOKE_MESSAGE_ERROR,sendBatchMessage.getMessage());
            }
        }
	}

	/**
	 * push列表
	 * @param messageBatchBackStageQueryDTO
	 * @return
	 */
	@Override
	public MessageBatchInfo listMessageBatch(MessageBatchBackStageQueryDTO messageBatchBackStageQueryDTO) {
		MessageApi messageApi = null;
		try {
			messageApi = feignConfigHandler.target(MessageApi.class, Constant.Message.getHOST(), ServerMethodConfig.MessageApi.MESSAGE_BATCH_LIST);
		}catch (Exception e){
			log.error("listMessageBatch messageApi connection error",e);
		}
		try {
			if( messageApi != null ){
				if( !ObjectJudgmentUtil.isNullOrEmpty(messageBatchBackStageQueryDTO.getStrStartDate()) ){
					messageBatchBackStageQueryDTO.setStartDate(DateTimeUtil.getDateTime(messageBatchBackStageQueryDTO.getStrStartDate()).getTime());
				}
				if( !ObjectJudgmentUtil.isNullOrEmpty(messageBatchBackStageQueryDTO.getStrEndDate()) ){
					messageBatchBackStageQueryDTO.setEndDate(DateTimeUtil.getDateTime(messageBatchBackStageQueryDTO.getStrEndDate()).getTime());
				}
				if( !ObjectJudgmentUtil.isNullOrEmpty(messageBatchBackStageQueryDTO.getAppType())
						&& messageBatchBackStageQueryDTO.getAppType().equals(2) ){
					messageBatchBackStageQueryDTO.setAppType(null);
				}
				Response<MessageBatchInfo> messageBatchInfoResponse = messageApi.listMessageBatch(messageBatchBackStageQueryDTO);
				log.info("messageBatchInfoResponse:"+messageBatchInfoResponse);
				return messageBatchInfoResponse.getCode() == 0
							&& !ObjectJudgmentUtil.isNullOrEmpty(messageBatchInfoResponse.getData())?messageBatchInfoResponse.getData():null;
			}
		}catch (Exception e){
			log.error("listMessageBatch error",e);
		}
		return null;
	}
	/**
	 * push详情
	 * @param messageBatchId
	 * @return
	 */
	@Override
	public MessageBatchDTO getMessageBatch(Long messageBatchId) {
		MessageApi messageApi = null;
		try {
			messageApi = feignConfigHandler.target(MessageApi.class, Constant.Message.getHOST(), ServerMethodConfig.MessageApi.MESSAGE_BATCH_DETAIL);
		}catch (Exception e){
			log.error("listMessageBatch messageApi connection error",e);
		}
		try {
			if( messageApi != null ){
				Response<MessageBatchDTO> messageBatchDTOResponse = messageApi.getMessageBatch(messageBatchId);
				return messageBatchDTOResponse.getCode() == 0
						&& !ObjectJudgmentUtil.isNullOrEmpty(messageBatchDTOResponse.getData())?messageBatchDTOResponse.getData():null;
			}
		}catch (Exception e){
			log.error("getMessageBatch error",e);
		}
		return null;
	}

}
