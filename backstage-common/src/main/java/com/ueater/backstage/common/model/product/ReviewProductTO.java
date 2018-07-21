package com.ueater.backstage.common.model.product;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**    
 * @Description:   审核商品实体   
 * @Author:       ajian   
 * @CreateDate:   2018/6/6 11:37     
 */
@Data
public class ReviewProductTO {
    /**
     * 审核列表主键
     */
    private Long queueId;

    /**
     * 库存
     */
    private BigDecimal inventory;

    /**
     * 商品售价
     */
    private BigDecimal price;

    /**
     * 商品ID
     */
    private Long productId;

    /**
     * 审核拒绝原因
     */
    private String reviewRefuseReason;

    /**
     * 审核状态
     */
    private Integer reviewStatus;

    /**
     * 商品标题
     */
    private String title;

    /**
     * 门店ID
     */
    private Long storeId;

    /**
     * 商户ID
     */
    private Long merchantId;

    /**
     * 商品副标题
     */
    private String subTitle;

    /**
     * 商品对应父级所有分类名称面包屑,用逗号分隔
     */
    private String categoryBreadcrumb;//所有父类名称分类

    /**
     * 销售单位
     */
    private String unit;

    /**
     * 规格
     */
    private String specification;

    /**
     * 保质期
     */
    private String qualityGuaranteePeriod;

    /**
     * 存储条件
     */
    private String storageCondition;

    /**
     * 操作记录
     */
//    private List<ReviewRecordDTO> reviewRecordDTOList;

    /**
     * 销售状态
     */
    private Integer saleStatus;

    /**
     * 商户名称
     */
    private String merchantName;



}
