package com.ueater.backstage.web;

import com.ueater.backstage.common.dto.member.MemberBackstageDetailDTO;
import com.ueater.backstage.common.dto.member.MemberCardDTO;
import com.ueater.backstage.common.dto.member.MemberDTO;
import com.ueater.backstage.service.IMemberService;
import com.ueater.tool.annotation.ControllerLog;
import com.ueater.tool.util.ObjectJudgmentUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * Created by caoli on 2017/8/21.
 */

@Slf4j
@RestController
@RequestMapping(value = "/member")
public class MemberCardController {
	
	@Resource
	IMemberService memberService;

    /**
     * 冻结卡
     * @param memberId
     * @return
     */
    @ControllerLog
    @RequestMapping(value = "/card/frozen",method = RequestMethod.PUT)
    public Boolean memberCardFrozen(Long memberId) {
        if( ObjectJudgmentUtil.isNullOrEmpty(memberId) ){
            return null;
        }
        return memberService.memberCardFrozen(memberId);
    }

    /**
     * 解冻卡
     * @param memberId
     * @return
     */
    @ControllerLog
    @RequestMapping(value = "/card/thaw",method = RequestMethod.PUT)
    public Boolean memberCardThaw(Long memberId) {
        log.info("memberId:"+memberId);
        if( ObjectJudgmentUtil.isNullOrEmpty(memberId) ){
            return null;
        }
        return memberService.memberCardThaw(memberId);
    }

    /**
     * 退卡
     * @param memberId
     * @return
     */
    @ControllerLog
    @RequestMapping(value = "/card/retreat",method = RequestMethod.PUT)
    public Boolean memberCardRetreat(Long memberId, String cardNo) {
        if( ObjectJudgmentUtil.isNullOrEmpty(memberId)
                && ObjectJudgmentUtil.isNullOrEmpty(cardNo) ){
            return null;
        }
        return memberService.memberCardRetreat(memberId,cardNo);
    }

    /**
     * 根据手机号查询会员信息
     * @param mobile
     * @return
     */
    @ControllerLog
    @RequestMapping(value = "/save/query/info",method = RequestMethod.GET)
    public MemberBackstageDetailDTO getMemberInfo(String mobile) {
        if( ObjectJudgmentUtil.isNullOrEmpty(mobile) ){
            return null;
        }
        return memberService.getMemberBackstage(null,mobile);
    }

    /**
     * 根据手机号查询会员信息
     * @param cardNo
     * @return
     */
    @ControllerLog
    @RequestMapping(value = "/card/detail",method = RequestMethod.GET)
    public MemberCardDTO memberCardDetail(String cardNo) {
        if( ObjectJudgmentUtil.isNullOrEmpty(cardNo) ){
            return null;
        }
        return memberService.memberCardDetail(cardNo);
    }

    /**
     * 根据手机号查询会员信息
     * @param userName
     * @return
     */
    @ControllerLog
    @RequestMapping(value = "/check/name",method = RequestMethod.GET)
    public Boolean memberCheckName(String userName) {
        if( ObjectJudgmentUtil.isNullOrEmpty(userName) ){
            return null;
        }
        MemberDTO memberDTO = new MemberDTO();
        memberDTO.setUserName(userName);
        return memberService.memberCheckName(memberDTO);
    }

}