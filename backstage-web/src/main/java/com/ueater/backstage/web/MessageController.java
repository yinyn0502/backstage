package com.ueater.backstage.web;

import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import com.ueater.backstage.common.dto.member.BasePagination;
import com.ueater.backstage.common.dto.member.message.BatchMessageTO;
import com.ueater.backstage.common.dto.message.MessageBatchBackStageQueryDTO;
import com.ueater.backstage.common.dto.message.MessageBatchDTO;
import com.ueater.backstage.common.dto.message.MessageBatchInfo;
import com.ueater.backstage.common.dto.message.MessageBatchStatisticsDTO;
import com.ueater.backstage.common.util.Constant;
import com.ueater.backstage.common.util.Tools;
import com.ueater.backstage.service.IMessageService;
import com.ueater.tool.annotation.ControllerLog;
import com.ueater.tool.response.Response;
import com.ueater.tool.response.ResponseCode;
import com.ueater.tool.util.ObjectJudgmentUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.util.List;

@Slf4j
@Controller
@RequestMapping(value = "/message")
public class MessageController {
	
	@Resource
	private IMessageService messageService;


    @ControllerLog
    @RequestMapping(value = "/jpush",method = RequestMethod.POST)
    public String sendPushMessage(BatchMessageTO batchMessage,RedirectAttributes redirectAttributes) {
        if( ObjectJudgmentUtil.isNullOrEmpty(batchMessage) ){
            return null;
        }
        Response<String> sendBatchJPushResponse = messageService.sendBatchJPushService(batchMessage);

        if(!ObjectJudgmentUtil.isNullOrEmpty(sendBatchJPushResponse)&&sendBatchJPushResponse.getCode().equals(ResponseCode.SUCCESS.getCode())) {
            Tools.addMessage(redirectAttributes, sendBatchJPushResponse.getData());
        }else{
            StringBuilder errMsgBuilder = new StringBuilder("发送消息异常");
            if (!ObjectJudgmentUtil.isNullOrEmpty(sendBatchJPushResponse)&&!ObjectJudgmentUtil.isNullOrEmpty(sendBatchJPushResponse.getMessage())){
                errMsgBuilder.append(":");
                errMsgBuilder.append(sendBatchJPushResponse.getMessage().get(0).getMessage());
            }
            Tools.addMessage(redirectAttributes, errMsgBuilder.toString());
        }
        return "redirect:/message/list";
    }
    
    @ControllerLog
    @RequestMapping(value = "/toEdit",method = RequestMethod.GET)
    public ModelAndView toEdit() {
        ModelAndView modelAndView = new ModelAndView("/message/message_edit");
		return modelAndView;
		
    }

    /**
     * push列表
     * @param messageBatchBackStageQueryDTO
     * @return
     */
    @ControllerLog
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public ModelAndView listMessageBatch(MessageBatchBackStageQueryDTO messageBatchBackStageQueryDTO) {
        messageBatchBackStageQueryDTO.setCurrentPage(messageBatchBackStageQueryDTO.getPageNum());
        messageBatchBackStageQueryDTO.setPageCount(messageBatchBackStageQueryDTO.getPageSize());
        if( ObjectJudgmentUtil.isNullOrEmpty(messageBatchBackStageQueryDTO.getCurrentPage()) ){
            messageBatchBackStageQueryDTO.setCurrentPage(1);
        }
        if( ObjectJudgmentUtil.isNullOrEmpty(messageBatchBackStageQueryDTO.getPageCount()) ){
            messageBatchBackStageQueryDTO.setPageCount(10);
        }
        ModelAndView modelAndView = new ModelAndView("/message/list");

        MessageBatchInfo messageBatchInfo = messageService.listMessageBatch(messageBatchBackStageQueryDTO);
        PageInfo<MessageBatchStatisticsDTO> pageInfo = null;
        List<MessageBatchStatisticsDTO> list = null;
        if ( messageBatchInfo != null
                && !ObjectJudgmentUtil.isNullOrEmpty(messageBatchInfo.getMessageBatchStatisticsDTOList()) ) {
            BasePagination basePagination = messageBatchInfo.getBasePagination();
            list = messageBatchInfo.getMessageBatchStatisticsDTOList();
            pageInfo = new PageInfo<MessageBatchStatisticsDTO>(list);
            /**
             * 如果不是自查数据库的话，需要和FEN这个架构交互的那么需要加入如下代码
             */
            pageInfo.setTotal(basePagination.getTotalCount());
            pageInfo.setEndRow(list.size());
            pageInfo.setPageSize(Integer.valueOf(basePagination.getPageCount()));
            pageInfo.setPages(basePagination.getTotalCount() % basePagination.getPageCount() == 0 ? basePagination.getTotalCount().intValue() / basePagination.getPageCount() : basePagination.getTotalCount().intValue() / basePagination.getPageCount() + 1);
            pageInfo.setPageNum(basePagination.getCurrentPage());
            int[] a = new int[basePagination.getTotalCount() % basePagination.getPageCount() == 0 ? basePagination.getTotalCount().intValue() / basePagination.getPageCount() : basePagination.getTotalCount().intValue() / basePagination.getPageCount() + 1];
            for (int i = 0; i < a.length; i++) {
                a[i] = i * 1;
            }
            pageInfo.setNavigatepageNums(a);
            pageInfo.setFirstPage(1);
            pageInfo.setLastPage(basePagination.getTotalCount() % basePagination.getPageCount() == 0 ? basePagination.getTotalCount().intValue() / basePagination.getPageCount() : basePagination.getTotalCount().intValue() / basePagination.getPageCount() + 1);
            if (pageInfo.getPageNum() == pageInfo.getLastPage()) {
                pageInfo.setHasNextPage(false);
                pageInfo.setIsLastPage(true);
                pageInfo.setNextPage(pageInfo.getLastPage());
            } else {
                pageInfo.setHasNextPage(true);
                pageInfo.setIsLastPage(false);
                pageInfo.setNextPage(pageInfo.getPageNum() + 1);
            }
            if (pageInfo.getPageNum() == pageInfo.getFirstPage()) {
                pageInfo.setHasPreviousPage(false);
                pageInfo.setIsFirstPage(true);
                pageInfo.setPrePage(pageInfo.getFirstPage());
            } else {
                pageInfo.setHasPreviousPage(true);
                pageInfo.setIsFirstPage(false);
                pageInfo.setPrePage(pageInfo.getPageNum() - 1);
            }
        } else {
            list = Lists.newArrayList();
            pageInfo = new PageInfo<MessageBatchStatisticsDTO>(list);
            pageInfo.setTotal(0);
            pageInfo.setEndRow(0);
            pageInfo.setPageSize(messageBatchBackStageQueryDTO.getPageCount());
            pageInfo.setPages(1);
            pageInfo.setPageNum(messageBatchBackStageQueryDTO.getCurrentPage());
            int[] a = new int[1];
            for (int i = 0; i < a.length; i++) {
                a[i] = i * 1;
            }
            pageInfo.setNavigatepageNums(a);
            pageInfo.setFirstPage(1);
            pageInfo.setLastPage(1);
            if (pageInfo.getPageNum() == pageInfo.getLastPage()) {
                pageInfo.setHasNextPage(false);
                pageInfo.setIsLastPage(true);
                pageInfo.setNextPage(pageInfo.getLastPage());
            } else {
                pageInfo.setHasNextPage(true);
                pageInfo.setIsLastPage(false);
                pageInfo.setNextPage(pageInfo.getPageNum() + 1);
            }
            if (pageInfo.getPageNum() == pageInfo.getFirstPage()) {
                pageInfo.setHasPreviousPage(false);
                pageInfo.setIsFirstPage(true);
                pageInfo.setPrePage(pageInfo.getFirstPage());
            } else {
                pageInfo.setHasPreviousPage(true);
                pageInfo.setIsFirstPage(false);
                pageInfo.setPrePage(pageInfo.getPageNum() - 1);
            }
        }
        modelAndView.getModel().put("isparam", Constant.IS_PARAM_YES);
        StringBuffer sb = new StringBuffer();
        sb.append("/message/list?");
        if ( !ObjectJudgmentUtil.isNullOrEmpty(messageBatchBackStageQueryDTO.getStrStartDate()) ) {
            sb.append("&strStartDate=" + messageBatchBackStageQueryDTO.getStrStartDate());
        }
        if ( !ObjectJudgmentUtil.isNullOrEmpty(messageBatchBackStageQueryDTO.getStrEndDate()) ) {
            sb.append("&strEndDate=" + messageBatchBackStageQueryDTO.getStrEndDate());
        }
        if ( !ObjectJudgmentUtil.isNullOrEmpty(messageBatchBackStageQueryDTO.getAppType()) ) {
            sb.append("&appType=" + messageBatchBackStageQueryDTO.getAppType());
        }
        modelAndView.getModel().put("strStartDate",messageBatchBackStageQueryDTO.getStrStartDate());
        modelAndView.getModel().put("strEndDate",messageBatchBackStageQueryDTO.getStrEndDate());
        modelAndView.getModel().put("appType",messageBatchBackStageQueryDTO.getAppType());

        modelAndView.getModel().put("pathurl", sb.toString());
        modelAndView.getModel().put("pageInfo", pageInfo);
        return modelAndView;
    }

    @ControllerLog
    @RequestMapping(value = "/detail",method = RequestMethod.GET)
    public ModelAndView getMessageBatch(Long id) {
        ModelAndView modelAndView = new ModelAndView("/message/detail");
        MessageBatchDTO messageBatch = messageService.getMessageBatch(id);
        modelAndView.getModel().put("messageBatch",messageBatch);
        return modelAndView;
    }

    /**
     * 添加Flash消息
     */
    protected void addMessage(RedirectAttributes redirectAttributes, String... messages) {
        StringBuilder sb = new StringBuilder();
        for (String message : messages){
            sb.append(message).append(messages.length>1?"<br/>":"");
        }
        redirectAttributes.addFlashAttribute("message", sb.toString());
    }

}
