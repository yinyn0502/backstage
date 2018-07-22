package com.ueater.backstage.web;

import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import com.ueater.backstage.common.dto.member.*;
import com.ueater.backstage.common.model.couponmanage.StoreNameRequest;
import com.ueater.backstage.common.util.Tools;
import com.ueater.backstage.service.IMemberService;
import com.ueater.tool.annotation.ControllerLog;
import com.ueater.tool.util.ObjectJudgmentUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by caoli on 2017/8/21.
 */

@Slf4j
@Controller
@RequestMapping(value = "/member")
public class MemberController {

	@Resource
	IMemberService memberService;

    /**
     * (后台)查询用户信息列表
     * @param pageNum
     * @param pageSize
     * @param mobile
     * @param cardNo
     * @return
     */
    @ControllerLog
    @RequiresPermissions("member:query:list")
    @RequestMapping(value = "/list/info",method = RequestMethod.GET)
    public ModelAndView listMember(Integer pageSize,Integer pageNum,String mobile,String cardNo,Long storeId) {
        if( ObjectJudgmentUtil.isNullOrEmpty(pageSize)
                && ObjectJudgmentUtil.isNullOrEmpty(pageNum) ){
            pageSize = 10;
            pageNum = 1;
        }
        if( pageNum < 1 || pageSize < 1 ){
            return null;
        }
        try {
            ModelAndView modelAndView = new ModelAndView("/member/list");
            MemberBackstageInfoDTO memberBackstageInfoDTO = memberService.listMemberBackstage(pageSize,pageNum,mobile,cardNo,storeId);
            log.info("listMember memberBackstageInfoDTO:"+memberBackstageInfoDTO);
            //得到会员列表信息
            List<MemberBackstageDTO> memberBackstageDTOList = null;
            //得到分页信息
            PageInfo<MemberBackstageDTO> pageInfo = null;
            List<MemberBackstageDTO> list = null;
            if ( memberBackstageInfoDTO != null
                    && !ObjectJudgmentUtil.isNullOrEmpty(memberBackstageInfoDTO.getMemberBackstageDTOList()) ) {
                BasePagination basePagination = memberBackstageInfoDTO.getBasePagination();
                list = memberBackstageInfoDTO.getMemberBackstageDTOList();
                pageInfo = new PageInfo<MemberBackstageDTO>(list);
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
                pageInfo = new PageInfo<MemberBackstageDTO>(list);
                pageInfo.setTotal(0);
                pageInfo.setEndRow(0);
                pageInfo.setPageSize(pageSize);
                pageInfo.setPages(1);
                pageInfo.setPageNum(pageNum);
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
            modelAndView.getModelMap().put("pageInfo",pageInfo);
            modelAndView.getModelMap().put("mobile",mobile);
            modelAndView.getModelMap().put("cardNo",cardNo);
            modelAndView.getModelMap().put("storeId",storeId);
            modelAndView.getModel().put("pathurl","/member/list/info");
            return modelAndView;
        }catch (Exception e){
            log.error("list",e);
            return null;
        }
    }

    /**
     * (后台)查询用户信息详情
     * @param memberId
     * @return
     */
    @ControllerLog
    @RequestMapping(value = "/info",method = RequestMethod.GET)
    public ModelAndView getMemberBackstage(Long memberId,Integer pageSize,Integer pageNum,String mobile,String cardNo) {
        if( ObjectJudgmentUtil.isNullOrEmpty(memberId) ){
            return null;
        }
        ModelAndView modelAndView = new ModelAndView("/member/detail");

        MemberBackstageDetailDTO memberBackstageDetailDTO = memberService.getMemberBackstage(memberId,null);
        try {
            if(memberBackstageDetailDTO.getStoreId()!=null){
                StoreNameRequest storeNameRequest = new StoreNameRequest();
                List<Long> storeIds = Lists.newArrayList();
                storeIds.add(memberBackstageDetailDTO.getStoreId());
                storeNameRequest.setIds(storeIds);
            }
        }catch (Exception e){
            log.error("query storeName failed!",e);
        }
        modelAndView.getModelMap().put("memberBackstageDetailDTO", memberBackstageDetailDTO);
        modelAndView.getModelMap().put("pageSize",pageSize);
        modelAndView.getModelMap().put("pageNum",pageNum);
        modelAndView.getModelMap().put("mobile",mobile);
        modelAndView.getModelMap().put("cardNo",cardNo);
        return modelAndView;
    }

    /**
     * 注册会员
     * @param memberDTO
     * @param redirectAttributes
     * @return
     */
    @ControllerLog
    @RequestMapping(value = "/register")
    public String memberRegister(MemberBackstageSaveOrUpdateDTO memberDTO, RedirectAttributes redirectAttributes) {
        log.info("memberDTO:"+memberDTO);
        if( ObjectJudgmentUtil.isNullOrEmpty(memberDTO)
                || ObjectJudgmentUtil.isNullOrEmpty(memberDTO.getMobile()) ){
            return null;
        }
        Boolean isSuccess = memberService.createMember(memberDTO);
        if(isSuccess) {
            Tools.addMessage(redirectAttributes, "注册会员成功!");
        }else{
            Tools.addMessage(redirectAttributes, "注册会员失败!");
        }
		return "redirect:/member/list/info";
    }

    @ControllerLog
    @RequestMapping("/hello")
    public String index(Map<String, Object> model){
        // 直接返回字符串，框架默认会去 spring.view.prefix 目录下的 （index拼接spring.view.suffix）页面
        // 本例为 /WEB-INF/jsp/index.jsp
        model.put("time", new Date());
        model.put("message", "hello CC");
        return "hello";
    }

    /**
     * 绑定会员卡弹窗
     * @return
     */
    @ControllerLog
    @RequestMapping(value = "/to/card/binding/{id}",method = RequestMethod.GET)
    public ModelAndView toMmemberCardBinding(@PathVariable("id")Long id,Integer pageSize,Integer pageNum,String mobile,String cardNo) {
        if( ObjectJudgmentUtil.isNullOrEmpty(id) ){
            return null;
        }

        ModelAndView modelAndView = new ModelAndView("/member/bindCard");
        MemberBackstageDetailDTO memberBackstageDetailDTO = memberService.getMemberBackstage(id,null);
        modelAndView.getModelMap().put("memberBackstageDetailDTO", memberBackstageDetailDTO);
        modelAndView.getModelMap().put("pageSize",pageSize);
        modelAndView.getModelMap().put("pageNum",pageNum);
        modelAndView.getModelMap().put("mobile",mobile);
        modelAndView.getModelMap().put("cardNo",cardNo);
        return modelAndView;
    }

    /**
     * 绑定会员卡
     * @param memberBackstageSaveOrUpdateDTO
     * @return
     */
    @ControllerLog
    @RequestMapping(value = "/card/binding")
    public String memberCardBinding(MemberBackstageSaveOrUpdateDTO memberBackstageSaveOrUpdateDTO,RedirectAttributes redirectAttributes) {
        log.info("memberBackstageSaveOrUpdateDTO:"+memberBackstageSaveOrUpdateDTO);
        if( ObjectJudgmentUtil.isNullOrEmpty(memberBackstageSaveOrUpdateDTO)
                || ObjectJudgmentUtil.isNullOrEmpty(memberBackstageSaveOrUpdateDTO.getMemberId())
                || ObjectJudgmentUtil.isNullOrEmpty(memberBackstageSaveOrUpdateDTO.getCardNo()) ){
            return null;
        }
        Boolean isSuccess = memberService.memberBindingCard(memberBackstageSaveOrUpdateDTO);
        if(isSuccess) {
            Tools.addMessage(redirectAttributes, "绑定会员卡信息成功!");
        }else{
            Tools.addMessage(redirectAttributes, "绑定会员卡信息失败!");
        }
        return "redirect:/member/list/info?pageSize="+(memberBackstageSaveOrUpdateDTO.getPageSize()==null?10:memberBackstageSaveOrUpdateDTO.getPageSize())+"" +
                "&pageNum="+(memberBackstageSaveOrUpdateDTO.getPageNum()==null?1:memberBackstageSaveOrUpdateDTO.getPageNum())+"&mobile="+(memberBackstageSaveOrUpdateDTO.getQueryMobile()==null?"":memberBackstageSaveOrUpdateDTO.getQueryMobile())+
                "&cardNo="+(memberBackstageSaveOrUpdateDTO.getQueryCardNo()==null?"":memberBackstageSaveOrUpdateDTO.getQueryCardNo());
    }

    /**
     * 详情 修改会员信息
     * @param modifyDTO
     * @return
     */
    @ControllerLog
    @RequestMapping(value = "/modify")
    public String modifyMember(MemberDetailModifyDTO modifyDTO,RedirectAttributes redirectAttributes) {
        if( ObjectJudgmentUtil.isNullOrEmpty(modifyDTO)
                || ObjectJudgmentUtil.isNullOrEmpty(modifyDTO.getMemberId()) ){
            return null;
        }
        if( !ObjectJudgmentUtil.isNullOrEmpty(modifyDTO.getMobile())
                && !modifyDTO.getMobile().contains("*")
                && !ObjectJudgmentUtil.isNullOrEmpty(modifyDTO.getQueryMobile()) ){
            modifyDTO.setQueryMobile(modifyDTO.getMobile());
        }
        Boolean isSuccess = memberService.modifyMember(modifyDTO);

        if(isSuccess) {
            Tools.addMessage(redirectAttributes, "保存会员信息成功!");
        }else{
            Tools.addMessage(redirectAttributes, "保存会员信息失败!");
        }
        System.out.println("redirect:/member/list/info?pageSize="+(modifyDTO.getPageSize()==null?10:modifyDTO.getPageSize())+"" +
                "&pageNum="+(modifyDTO.getPageNum()==null?1:modifyDTO.getPageNum())+"&mobile="+(modifyDTO.getQueryMobile()==null?"":modifyDTO.getQueryMobile())+
                "&cardNo="+(modifyDTO.getQueryCardNo()==null?"":modifyDTO.getQueryCardNo()));
        return "redirect:/member/list/info?pageSize="+(modifyDTO.getPageSize()==null?10:modifyDTO.getPageSize())+"" +
                "&pageNum="+(modifyDTO.getPageNum()==null?1:modifyDTO.getPageNum())+"&mobile="+(modifyDTO.getQueryMobile()==null?"":modifyDTO.getQueryMobile())+
                "&cardNo="+(modifyDTO.getQueryCardNo()==null?"":modifyDTO.getQueryCardNo());
    }
}