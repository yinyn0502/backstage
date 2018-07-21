package com.ueater.backstage.outerservice;

import com.ueater.backstage.common.dto.member.*;
import com.ueater.backstage.common.dto.member.message.MemberBatchMessgeDTO;
import com.ueater.tool.response.Response;

import feign.Param;
import feign.RequestLine;

/**
 * @author xurupeng
 * @version 1.0.0
 * @date 9月 25 2017 下午1:44
 */
public interface MemberApi {

    /**
     * (后台)查询用户信息详情
     * @param memberId
     * @return
     */
    @RequestLine("GET /member/info?memberId={memberId}&mobile={mobile} HTTP/1.1")
    Response<MemberBackstageDetailDTO> getMemberBackstage(@Param("memberId") Long memberId,@Param("mobile") String mobile);

    /**
     * 会员卡冻结
     * @param memberId
     * @return
     */
    @RequestLine("PUT /member/card/frozen?memberId={memberId} HTTP/1.1")
    Response<Object> memberCardFrozen(@Param("memberId") Long memberId);

    /**
     * (后台)查询用户信息列表
     * @param pageCount
     * @param currentPage
     * @param mobile
     * @param cardNo
     * @return
     */
    @RequestLine("GET /member/list/info?pageCount={pageCount}&currentPage={currentPage}&mobile={mobile}&cardNo={cardNo}&storeId={storeId} HTTP/1.1")
    Response<MemberBackstageInfoDTO> listMemberBackstage(@Param("pageCount") Integer pageCount,@Param("currentPage") Integer currentPage,
                                                         @Param("mobile") String mobile,@Param("cardNo") String cardNo,@Param("storeId") Long storeId);


    @RequestLine("GET /member/getMemberListByStoreId?storeId={storeId} HTTP/1.1")
    Response<MemberBackstageInfoDTO> listMemberByStoreId(@Param("storeId") Long storeId);

    /**
     * 会员卡绑卡
     * @param memberBackstageSaveOrUpdateDTO
     * @return
     */
    @RequestLine("PUT /member/bindingCard HTTP/1.1")
    Response<Object> memberBindingCard(MemberBackstageSaveOrUpdateDTO memberBackstageSaveOrUpdateDTO);

    /**
     * 会员卡解冻
     * @param memberId
     * @return
     */
    @RequestLine("PUT /member/card/thaw?memberId={memberId} HTTP/1.1")
    Response<Object> memberCardThaw(@Param("memberId") Long memberId);

    /**
     * 修改会员信息
     * @param memberBackstageSaveOrUpdateDTO
     * @return
     */
    @RequestLine("PUT /member/perfect HTTP/1.1")
    Response<Object> modifyMember(MemberBackstageSaveOrUpdateDTO memberBackstageSaveOrUpdateDTO);

    /**
     * 新增会员信息
     * @param memberBackstageSaveOrUpdateDTO
     * @return
     */
    @RequestLine("POST /member/create HTTP/1.1")
    Response<Object> createMember(MemberBackstageSaveOrUpdateDTO memberBackstageSaveOrUpdateDTO);

    /**
     * 会员退卡
     * @param memberId
     * @param cardNo
     * @return
     */
    @RequestLine("PUT /member/retreat?memberId={memberId}&cardNo={cardNo} HTTP/1.1")
    Response<Object> memberCardRetreat(@Param("memberId") Long memberId,@Param("cardNo") String cardNo);

    /**
     * 会员退卡
     * @param cardNo
     * @return
     */
    @RequestLine("GET /member/card/detail?cardNo={cardNo} HTTP/1.1")
    Response<MemberCardDTO> memberCardDetail(@Param("cardNo") String cardNo);

    /**
     * 检查会员名称
     * @param memberDTO
     * @return
     */
    @RequestLine("POST /member/check/name HTTP/1.1")
    Response<Object> memberCheckName(MemberDTO memberDTO);
    
    
    /**
     * 发送一批消息
     * @param memberBackstageSaveOrUpdateDTO
     * @return
     */
    @RequestLine("POST /member/message/sendBatchMessage HTTP/1.1")
    Response<Object> sendBatchMessage(MemberBatchMessgeDTO memberBatchMessgeDTO);

}
