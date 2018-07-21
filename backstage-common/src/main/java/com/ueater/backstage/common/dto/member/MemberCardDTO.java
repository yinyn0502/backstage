package com.ueater.backstage.common.dto.member;

import lombok.Data;


@Data
public class MemberCardDTO {

    private Long memberId;

    private Integer status;

    private String cardNo;//卡号

    private String cardLevel;//卡类型

}
