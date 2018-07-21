package com.ueater.backstage.common.dto.member;

import lombok.Data;

@Data
public class MemberBackstageSaveOrUpdateDTO {

    /**
     * 用户id
     */
    private Long memberId;

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
     * 开卡门店
     */
    private Long storeId;

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
    private String cardNo;//需要绑卡

    /**
     * 家庭日类型
     */
    private Integer familyDayType;

    /**
     * 开始使用时间
     */
    private Long startTime;

    //----------------------------------------------------------------------


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

    /**
     * 纪念日
     */
    private String strFamilyDay;

    /**
     * 生日
     */
    private String strBrithday;

    /**
     * 开始使用时间
     */
    private String strStartTime;;
}
