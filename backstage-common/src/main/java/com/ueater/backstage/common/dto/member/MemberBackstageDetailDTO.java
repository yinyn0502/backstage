package com.ueater.backstage.common.dto.member;

import lombok.Data;

@Data
public class MemberBackstageDetailDTO {

    private Long id;//会员id

    private String mobile;//手机号

    private Long storeId;   //开卡门店

    private String storeName;

    private Integer familyDayType;//家庭日类型

    private String familyDay;//纪念日

    private Integer level;//等级

    private String levelValue;//等级值

    private String userName;//名称

    private String brithday;//生日

    private String sex;//性别

    private Integer identityType;//证件类型

    private String identityNo;//证件号

    private String address;//地址

    private String occupation;//职业

    private String remarks;//备注

    private String cardNo;//会员卡号

    private String payMemberEffectiveDate;//会员有效时间

    private String storeInfo;

}
