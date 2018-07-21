package com.ueater.backstage.common.dto.member;

import lombok.Data;

@Data
public class MemberBackstageSaveDTO {

    /**
     * 用户名称
     */
    private String userName;

    /**
     * 用户邮箱
     */
    private String email;

    /**
     * 用户手机号
     */
    private String mobile;

    /**
     * 纪念意义的日子
     */
    private Long familyDay;//需转换

    /**
     * 生日
     */
    private Long brithday;//需转换

    /**
     * 性别
     */
    private Integer sex;

    /**
     * 证件类型
     */
    private Integer identityType;

    /**
     * 证件号
     */
    private String identityNo;

    /**
     * 地址
     */
    private String address;

    /**
     * 职业
     */
    private String occupation;

    /**
     * 备注
     */
    private String remarks;

    /**
     * 用户等级
     */
    private Integer level;

    /**
     * 用户类型:个人用户、企业用户
     */
    private Integer type;

    /**
     * 验证状态:4种状态表示手机和邮箱验证情况
     */
    private Integer verifyStatus;

    /**
     * 注册渠道
     */
    private Integer registryChannel;

    /**
     * 注册日期
     */
    private Long registDate;//需转换

    /**
     * 会员卡号
     */
    private Long cardNo;//需要绑卡

}
