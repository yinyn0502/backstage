package com.ueater.backstage.service.impl;


import com.ueater.backstage.common.config.ServerMethodConfig;
import com.ueater.backstage.common.constant.Constant;
import com.ueater.backstage.common.dto.member.*;
import com.ueater.backstage.common.util.DateChangeUtil;
import com.ueater.backstage.outerservice.MemberApi;
import com.ueater.backstage.service.IMemberService;
import com.ueater.tool.annotation.SystemLog;
import com.ueater.tool.feign.FeignConfigHandler;
import com.ueater.tool.response.Response;
import com.ueater.tool.util.BeanCopierUtil;
import com.ueater.tool.util.MobileUtil;
import com.ueater.tool.util.ObjectJudgmentUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Slf4j
@Service
public class MemberService implements IMemberService{


	@Resource
	private FeignConfigHandler feignConfigHandler;

	/**
	 * (后台)查询用户信息列表
	 * @param pageCount
	 * @param currentPage
	 * @param mobile
	 * @param cardNo
	 * @return
	 */
	@SystemLog
	@Override
	public MemberBackstageInfoDTO listMemberBackstage(Integer pageCount, Integer currentPage, String mobile, String cardNo,Long storeId) {
		MemberApi memberApi = null;
		try {
			memberApi = feignConfigHandler.target(MemberApi.class, Constant.Member.getHOST(), ServerMethodConfig.MemberApi.MEMBER_BACKSTAGE_LIST_MEMBERINFO);
		}catch (Exception e){
			log.error("listMemberBackstage memberApi connection error",e);
		}
		try {
			if( memberApi != null ){
				Response<MemberBackstageInfoDTO> memberBackstageInfoDTOResponse = memberApi.listMemberBackstage(pageCount, currentPage, "".equals(mobile)?null:mobile, "".equals(cardNo)?null:cardNo,storeId);
				log.info("listMemberBackstage memberBackstageInfoDTOResponse:"+memberBackstageInfoDTOResponse);
				if( memberBackstageInfoDTOResponse.getCode()==0
						&& !ObjectJudgmentUtil.isNullOrEmpty(memberBackstageInfoDTOResponse.getData())){
					return memberBackstageInfoDTOResponse.getData();
				}
			}
		}catch (Exception e){
			log.error("listMemberBackstage error",e);
		}
		return null;
	}

    @Override
    public MemberBackstageInfoDTO listMemberByStoreId(Long storeId) {
        MemberApi memberApi = null;
        try {
            memberApi = feignConfigHandler.target(MemberApi.class, Constant.Member.getHOST(), ServerMethodConfig.MemberApi.MEMBER_BACKSTAGE_LIST_MEMBERINFO);
        }catch (Exception e){
            log.error("listMemberBackstage memberApi connection error",e);
        }
        try {
            if( memberApi != null ){
                Response<MemberBackstageInfoDTO> memberBackstageInfoDTOResponse = memberApi.listMemberByStoreId(storeId);
                log.info("listMemberBackstage memberBackstageInfoDTOResponse:"+memberBackstageInfoDTOResponse);
                if( memberBackstageInfoDTOResponse.getCode() == 0
                        && !ObjectJudgmentUtil.isNullOrEmpty(memberBackstageInfoDTOResponse.getData())){
                    return memberBackstageInfoDTOResponse.getData();
                }
            }
        }catch (Exception e){
            log.error("listMemberByStoreId error", e);
        }
        return null;
    }

    /**
	 * (后台)查询用户信息详情
	 * @param memberId
	 * @return
	 */
	@SystemLog
	@Override
	public MemberBackstageDetailDTO getMemberBackstage(Long memberId,String mobile) {
		MemberApi memberApi = null;
		try {
			memberApi = feignConfigHandler.target(MemberApi.class, Constant.Member.getHOST(), ServerMethodConfig.MemberApi.MEMBER_INFO_BATCH);
		}catch (Exception e){
			log.error("getMemberBackstage memberApi connection error",e);
		}
		try {
			if( memberApi != null ){
				Response<MemberBackstageDetailDTO> memberBackstageDetailDTOResponse = memberApi.getMemberBackstage(memberId,mobile);
				log.info("getMemberBackstage memberBackstageDetailDTOResponse:"+memberBackstageDetailDTOResponse);
				if( memberBackstageDetailDTOResponse.getCode() == 0
						&& !ObjectJudgmentUtil.isNullOrEmpty(memberBackstageDetailDTOResponse.getData()) ){
					return memberBackstageDetailDTOResponse.getData();
				}
			}
		}catch (Exception e){
			log.error("getMemberBackstage error",e);
		}
		return null;
	}

	/**
	 * 冻结卡
	 * @param memberId
	 * @return
	 */
	@SystemLog
	@Override
	public Boolean memberCardFrozen(Long memberId) {
		MemberApi memberApi = null;
		try {
			memberApi = feignConfigHandler.target(MemberApi.class, Constant.Member.getHOST(), ServerMethodConfig.MemberApi.MEMBER_CARD_FROZEN);
		}catch (Exception e){
			log.error("memberCardFrozen memberApi connection error",e);
		}
		try {
			if( memberApi != null ) {
				Response<Object> frozenResponse = memberApi.memberCardFrozen(memberId);
				log.info("memberCardFrozen frozenResponse:" + frozenResponse);
				if (frozenResponse.getCode() == 0
						&& !ObjectJudgmentUtil.isNullOrEmpty(frozenResponse.getData())) {
					return true;
				}
			}
		}catch (Exception e){
			log.error("memberCardFrozen error",e);
		}
		return false;
	}

	/**
	 * 绑定会员卡
	 * @param memberBackstageSaveOrUpdateDTO
	 * @return
	 */
	@SystemLog
	@Override
	public Boolean memberBindingCard(MemberBackstageSaveOrUpdateDTO memberBackstageSaveOrUpdateDTO) {
		MemberApi memberApi = null;
		try {
			memberApi = feignConfigHandler.target(MemberApi.class, Constant.Member.getHOST(), ServerMethodConfig.MemberApi.MEMBER_CARD_BINDING);
		}catch (Exception e){
			log.error("memberCardBinding memberApi connection error",e);
		}
		try {
			if( memberApi != null ) {
				if( !ObjectJudgmentUtil.isNullOrEmpty(memberBackstageSaveOrUpdateDTO.getStrBrithday()) ){
					memberBackstageSaveOrUpdateDTO.setBrithday(DateChangeUtil.specificDateChangeDate(memberBackstageSaveOrUpdateDTO.getStrBrithday()));
				}
				if( !ObjectJudgmentUtil.isNullOrEmpty(memberBackstageSaveOrUpdateDTO.getMobile()) ){
					memberBackstageSaveOrUpdateDTO.setUserName(MobileUtil.getSmilingFaceMobile(memberBackstageSaveOrUpdateDTO.getMobile()));
				}
				Response<Object> bindingResponse = memberApi.memberBindingCard(memberBackstageSaveOrUpdateDTO);
				log.info("memberCardBinding bindingResponse:" + bindingResponse);
				if (bindingResponse.getCode() == 0
						&& !ObjectJudgmentUtil.isNullOrEmpty(bindingResponse.getData())) {
					return true;
				}
			}
		}catch (Exception e){
			log.error("memberCardBinding error",e);
		}
		return false;
	}

	/**
	 * 解冻卡
	 * @param memberId
	 * @return
	 */
	@SystemLog
	@Override
	public Boolean memberCardThaw(Long memberId) {
		MemberApi memberApi = null;
		try {
			memberApi = feignConfigHandler.target(MemberApi.class, Constant.Member.getHOST(), ServerMethodConfig.MemberApi.MEMBER_CARD_THAW);
		}catch (Exception e){
			log.error("memberCardThaw memberApi connection error",e);
		}
		try {
			if( memberApi != null ){
				Response<Object> thawResponse = memberApi.memberCardThaw(memberId);
				log.info("memberCardThaw thawResponse:"+thawResponse);
				if( thawResponse.getCode() == 0
						&& !ObjectJudgmentUtil.isNullOrEmpty(thawResponse.getData()) ){
					return true;
				}
			}
		}catch (Exception e){
			log.error("memberCardThaw error",e);
		}
		return false;
	}

	/**
	 * 添加会员
	 * @param memberBackstageSaveOrUpdateDTO
	 * @return
	 */
	@SystemLog
	@Override
	public Boolean createMember(MemberBackstageSaveOrUpdateDTO memberBackstageSaveOrUpdateDTO) {
		MemberApi memberApi = null;
		try {
			memberApi = feignConfigHandler.target(MemberApi.class, Constant.Member.getHOST(), ServerMethodConfig.MemberApi.MEMBER_CREATE);
		}catch (Exception e){
			log.error("createMember memberApi connection error",e);
		}
		try {
			if( memberApi != null ){
				if( !ObjectJudgmentUtil.isNullOrEmpty(memberBackstageSaveOrUpdateDTO.getStrStartTime()) ){
					memberBackstageSaveOrUpdateDTO.setStartTime(DateChangeUtil.dateTimeChangeDate(memberBackstageSaveOrUpdateDTO.getStrStartTime()));
				}
				if( !ObjectJudgmentUtil.isNullOrEmpty(memberBackstageSaveOrUpdateDTO.getStrFamilyDay()) ){
					memberBackstageSaveOrUpdateDTO.setFamilyDay(DateChangeUtil.monthAndDayChangeDate(memberBackstageSaveOrUpdateDTO.getStrFamilyDay()));
				}
				Response<Object> saveResponse = memberApi.createMember(memberBackstageSaveOrUpdateDTO);
				log.info("createMember saveResponse:"+saveResponse);
				if( saveResponse.getCode() == 0
						&& !ObjectJudgmentUtil.isNullOrEmpty(saveResponse.getData()) ){
					return true;
				}
			}
		}catch (Exception e){
			log.error("createMember error",e);
		}
		return false;
	}

	/**
	 * 修改会员
	 * @param memberDetailModifyDTO
	 * @return
	 */
	@SystemLog
	@Override
	public Boolean modifyMember(MemberDetailModifyDTO memberDetailModifyDTO) {
		MemberApi memberApi = null;
		try {
			memberApi = feignConfigHandler.target(MemberApi.class, Constant.Member.getHOST(), ServerMethodConfig.MemberApi.MEMBER_BACKSTAGE_LIST_MEMBERINFO);
		}catch (Exception e){
			log.error("createMember memberApi connection error",e);
		}
		try {
			if( memberApi != null ){
				MemberBackstageSaveOrUpdateDTO memberBackstageSaveOrUpdateDTO = new MemberBackstageSaveOrUpdateDTO();
				BeanCopierUtil.copy(MemberDetailModifyDTO.class,memberDetailModifyDTO,MemberBackstageSaveOrUpdateDTO.class,memberBackstageSaveOrUpdateDTO);

				//校验参数是否没修改过
				if( ObjectJudgmentUtil.isNullOrEmpty(memberDetailModifyDTO.getMobile())
						|| ( !ObjectJudgmentUtil.isNullOrEmpty(memberDetailModifyDTO.getPrimaryMobile())
							&& memberDetailModifyDTO.getPrimaryMobile().trim().equals(memberDetailModifyDTO.getMobile().trim())) ){
					memberBackstageSaveOrUpdateDTO.setMobile(null);
				}

				Response<Object> modifyResponse = memberApi.modifyMember(memberBackstageSaveOrUpdateDTO);
				log.info("createMember modifyResponse:"+modifyResponse);
				if( modifyResponse.getCode() == 0
						&& !ObjectJudgmentUtil.isNullOrEmpty(modifyResponse.getData()) ){
					return true;
				}
			}
		}catch (Exception e){
			log.error("modifyMember error",e);
		}
		return false;
	}

	/**
	 * 会员退卡
	 * @param memberId
	 * @param cardNo
	 * @return
	 */
	@SystemLog
	@Override
	public Boolean memberCardRetreat(Long memberId, String cardNo) {
		try {
			MemberApi memberApi = null;
			try {
				memberApi = feignConfigHandler.target(MemberApi.class, Constant.Member.getHOST(), ServerMethodConfig.MemberApi.MEMBER_CARD_RETREAT);
			}catch (Exception e){
				log.error("createMember memberApi connection error",e);
			}
			Response<Object> objectResponse = memberApi.memberCardRetreat(memberId, cardNo);
			if( objectResponse.getCode() == 0
					&& !ObjectJudgmentUtil.isNullOrEmpty(objectResponse.getData()) ){
				return true;
			}
		}catch (Exception e){
			log.error("memberCardRetreat error",e);
		}
		return null;
	}

	/**
	 * 查询会员卡信息
	 * @param cardNo
	 * @return
	 */
	@Override
	public MemberCardDTO memberCardDetail(String cardNo) {
		try {
			MemberApi memberApi = null;
			try {
				memberApi = feignConfigHandler.target(MemberApi.class, Constant.Member.getHOST(), ServerMethodConfig.MemberApi.MEMBER_CARD_DETAIL);
			}catch (Exception e){
				log.error("memberCardDetail memberApi connection error",e);
			}
			Response<MemberCardDTO> memberCardDTOResponse = memberApi.memberCardDetail(cardNo);
			if( memberCardDTOResponse.getCode() == 0
					&& !ObjectJudgmentUtil.isNullOrEmpty(memberCardDTOResponse.getData()) ){
				return memberCardDTOResponse.getData();
			}
		}catch (Exception e){
			log.error("memberCardDetail error",e);
		}
		return null;
	}

	/**
	 * 检查会员名称
	 * @param memberDTO
	 * @return
	 */
	@Override
	public Boolean memberCheckName(MemberDTO memberDTO) {
		try {
			MemberApi memberApi = null;
			try {
				memberApi = feignConfigHandler.target(MemberApi.class, Constant.Member.getHOST(), ServerMethodConfig.MemberApi.MEMBER_CHECK_NAME);
			}catch (Exception e){
				log.error("memberCardDetail memberApi connection error",e);
			}
			Response<Object> objectResponse = memberApi.memberCheckName(memberDTO);
			if( objectResponse.getCode() == 0
					&& !ObjectJudgmentUtil.isNullOrEmpty(objectResponse.getData()) ){
				return true;
			}
		}catch (Exception e){
			log.error("memberCardDetail error",e);
		}
		return false;
	}
}
