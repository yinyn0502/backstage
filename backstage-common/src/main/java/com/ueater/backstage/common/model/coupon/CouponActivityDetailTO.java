package com.ueater.backstage.common.model.coupon;

import com.ueater.backstage.common.model.couponmanage.CreateActivityProductDTO;
import com.ueater.backstage.common.model.couponmanage.CreateActivityProductGroupDTO;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by chenyuhua on 2018-03-12.
 */
@Data
public class CouponActivityDetailTO {
    private Long activityId;

    private String couponName;

    private String couponSubName;

    private String description;

    private String couponIntroduce;

    private Long startTime;

    private String startTimeStr;

    private Long endTime;

    private String endTimeStr;

    private Integer continueDate;

    private Long couponType;

    private List<Long> storeIds;

    private List<CreateActivityProductDTO> createActivityProductDTOS;

    private List<CreateActivityProductGroupDTO> createActivityProductGroupDTOS;

    private List<CreateActivityProductDTO> expCreateActivityProductDTOS;

    private List<CreateActivityProductGroupDTO> expCreateActivityProductGroupDTOS;

    private String storeName;

    private List<Long> productIds;

    private List<String> productStoreName;//商品信息

//    private List<String> categoryPaths;

    private List<String> categoryName;//分类名字

    private List<Long> expProductIds;

    private List<String> expStoreProductName;//排除商品信息

//    private List<String> expProductIdsCategoryPaths;

    private List<String> expCategoryName;//排除分类名字

    private List<Integer> memberLevel;

    private String memberLevelValue;

    private List<Integer> useChannel;//全选为null

    private String useChannelValue;

    private Integer memberCount;

    private Integer totalCount;

    private Integer qualificationType;

    private BigDecimal qualificationValue;//满多少钱

    private Integer benefitType;

    private BigDecimal benefitValue;//减/折 多少

    private Integer budget;

    private String lastHandler;

    private Long handleTime;

    private String handleTimeStr;

    private String handler;

    private String couponAttributeIds;
}
