package com.ueater.backstage.common.model.couponmanage;


import com.ueater.backstage.common.dto.member.BasePagination;
import lombok.Data;

import java.util.List;

@Data
public class CouponProductBackstageInfoDTO {

    private List<CouponProductBackstageDTO> couponProductBackstageDTOList;

    private BasePagination basePagination;

    private List<JsonActivityProductDTO> jsonActivityProductDTOList;

}
