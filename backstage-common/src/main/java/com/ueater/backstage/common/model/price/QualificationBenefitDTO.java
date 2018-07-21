package com.ueater.backstage.common.model.price;

import lombok.Data;

/**
 * Created by mayumeng on 2017/7/27.
 */
@Data
public class QualificationBenefitDTO {

    private PromoQualificationDTO qualifications;

    private PromoBenefitDTO benefits;

    private Integer step;

}
