package com.ueater.backstage.common.model.couponmanage;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by mayumeng on 2018-03-08.
 */
@Data
public class CouponActivityCreateDTO {

    private String couponAttributeIds;//返回时显示的

    private Integer createAttributeActivity;//是否创建领劵活动1:是 0:否

    private Long activityId;

    private String couponName;

    private String couponSubName;

    private String description;

    private String couponIntroduce;

    private Long startTime;

    private Long endTime;

    private Integer continueDate;

    private Long couponType;

    private List<CreateActivityProductDTO> createActivityProductDTOS;

    private List<CreateActivityProductGroupDTO> createActivityProductGroupDTOS;

    private List<CreateActivityProductDTO> expCreateActivityProductDTOS;

    private List<CreateActivityProductGroupDTO> expCreateActivityProductGroupDTOS;

    private List<Integer> memberLevel;

    private List<Integer> useChannel;//全选为null

    private Integer memberCount;

    private Integer totalCount;

    private Integer qualificationType;

    private BigDecimal qualificationValue;//满多少钱

    private Integer benefitType;

    private Integer benefitType1;

    private Integer benefitType2;

    private BigDecimal benefitValue;//减/折 多少

    private Integer budget;

    private String lastHandler;

    private Long handleTime;

    private String handler;

    private String strStartTime;

    private String strEndTime;

    private String strStoreIds;

    private String storeId;

    private String strProductIds;

    private String exstrProductIds;

    private String strMemberLevel;

    private String sMemberCount;

    private String sTotalCount;

    private String sQualificationValue;
    private String sBenefitValue;
    private String sBenefitValues;

    private String strCouponType;

    private Integer qualificationScope;

    private String categoryIdsTop;

    private String strUseChannel;

    private String couponIntroduce2;
    private String couponIntroduce3;


    private List<JsonActivityProductDTO> jsonActivityProductDTOList;

   /* public boolean check() {
        if (couponName == null ) {
            return false;
        }
        if (description != null ) {
            return false;
        }
        if (couponIntroduce == null) {
            return false;
        }
        if (startTime == null) {
            return false;
        }
        if (endTime == null) {
            return false;
        }
        if (storeIds == null || storeIds.size() == 0) {
            return false;
        }
        if (qualificationType == null) {
            return false;
        }
        if (benefitValue == null) {
            return false;
        }
        if (benefitType == null) {
            return false;
        }
        if (handler == null) {
            return false;
        }
        return true;
    }*/
}
