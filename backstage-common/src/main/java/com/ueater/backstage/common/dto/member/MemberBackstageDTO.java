package com.ueater.backstage.common.dto.member;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 客服后台 会员列表
 */
@Data
public class MemberBackstageDTO {

    private Long memberId;//会员id

    private String name;//	姓名

    private String mobile;//手机号

    private String registDate;//注册时间

    private BigDecimal points;//积分数量

    private Integer couponCount;//礼券数量

    private Integer age;//年龄

    private Integer level;//会员等级

    private String levelName;//会员等级名称

    private String cardStatus;//会员卡状态

    private String remarks;//备注

    private Boolean unbinding;//是否解绑

    private Boolean backCard;//是否退卡

}
