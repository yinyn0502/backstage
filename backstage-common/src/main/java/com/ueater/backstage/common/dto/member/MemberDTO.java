package com.ueater.backstage.common.dto.member;

import lombok.Data;

/**
 * @author fanlei
 * @version 1.0.0
 * @date 五月 18 2017 下午1:37
 */
@Data
public class MemberDTO {

    private Long id;//会员id

    private String userName;//会员名称

    private String email;//会员账户

    private String mobile;//手机号

    private Integer level;//等级

    private String levelName;//等级名称

    private Long startTime;//开始时间

    private Long expireTime;//到期时间

    private boolean soonExprie;//是否快到期

    private Long familyDay;//家庭日

    private String sex;//性别

    private String familyDayType;//家庭日类型

    private String cardNo;//会员卡号

}
