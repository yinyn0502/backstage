package com.ueater.backstage.common.dto.member;

import lombok.Data;

import java.util.List;

@Data
public class MemberBackstageInfoDTO {

    private List<MemberBackstageDTO> memberBackstageDTOList;

    private BasePagination basePagination;

}
