package com.ueater.backstage.common.dto.member;

import lombok.Data;

@Data
public class MemberDetailModifyDTO {

    /**
     * 会员id
     */
    private Long memberId;

    /**
     * 用户手机号
     */
    private String mobile;

    /**
     * 原手机号
     */
    private String primaryMobile;

    /**
     * 地址
     */
    private String address;

    /**
     * 原地址
     */
    private String primaryAddress;

    /**
     * 职业
     */
    private String occupation;

    /**
     * 原职业
     */
    private String primaryOccupation;

    /**
     * 每页显示条数
     */
    private Integer pageSize;

    /**
     * 当前页
     */
    private Integer pageNum;

    /**
     * 查询条件手机号
     */
    private String queryMobile;

    /**
     * 查询条件会员卡号
     */
    private String queryCardNo;

}
