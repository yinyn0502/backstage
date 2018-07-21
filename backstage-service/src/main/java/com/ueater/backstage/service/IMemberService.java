package com.ueater.backstage.service;

import com.ueater.backstage.common.dto.member.*;
import com.ueater.tool.response.Response;


public interface IMemberService {

	/**
	 * (后台)查询用户信息列表
	 * @param pageCount
	 * @param currentPage
	 * @param mobile
	 * @param cardNo
	 * @return
	 */
	MemberBackstageInfoDTO listMemberBackstage(Integer pageCount, Integer currentPage, String mobile, String cardNo,Long storeId);

    /**
     * 获取门店下注册会员
     * @param storeId
     * @return
     */
	MemberBackstageInfoDTO listMemberByStoreId(Long storeId);

	/**
	 * (后台)查询用户信息详情
	 * @param memberId
	 * @return
	 */
	MemberBackstageDetailDTO getMemberBackstage(Long memberId,String mobile);

	/**
	 * 冻结卡
	 * @param memberId
	 * @return
	 */
	Boolean memberCardFrozen(Long memberId);

	/**
	 * 绑定会员卡
	 * @param memberBackstageSaveOrUpdateDTO
	 * @return
	 */
	Boolean memberBindingCard(MemberBackstageSaveOrUpdateDTO memberBackstageSaveOrUpdateDTO);

	/**
	 * 解冻卡
	 * @param memberId
	 * @return
	 */
	Boolean memberCardThaw(Long memberId);

	/**
	 * 添加会员
	 * @param memberBackstageSaveOrUpdateDTO
	 * @return
	 */
	Boolean createMember(MemberBackstageSaveOrUpdateDTO memberBackstageSaveOrUpdateDTO);

	/**
	 * 修改会员
	 * @param memberDetailModifyDTO
	 * @return
	 */
	Boolean modifyMember(MemberDetailModifyDTO memberDetailModifyDTO);

	/**
	 * 会员退卡
	 * @param memberId
	 * @param cardNo
	 * @return
	 */
	Boolean memberCardRetreat(Long memberId,String cardNo);

	/**
	 * 获取会员卡信息
	 * @param cardNo
	 * @return
	 */
	MemberCardDTO memberCardDetail(String cardNo);

	/**
	 * 检查会员名称
	 * @param memberDTO
	 * @return
	 */
	Boolean memberCheckName(MemberDTO memberDTO);

}
