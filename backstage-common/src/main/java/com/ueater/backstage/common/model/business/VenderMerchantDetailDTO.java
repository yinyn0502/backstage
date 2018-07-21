package com.ueater.backstage.common.model.business;

import lombok.Data;

import java.util.List;

/**    
 * @Description:  供应商实体类
 * @Author:       ajian   
 * @CreateDate:   2018/6/5 15:21     
 */
@Data
public class VenderMerchantDetailDTO {

    /**
     * 供应商id
     */
    private Long venderId;

    /**
     * 供应商状态
     */
    private Integer venderStatus;

    /**
     * 商户名
     */
    private String merchantName;

    /**
     * 商户状态
     */
    private Integer merchantStatus;

    /**
     * 商户大码
     */
    private List<Long> merchantMainProductIds;

    /**
     * 对应分类
     */
    private String categoryPath;

    /**
     * 所属门店
     */
    private Long storeId;

    /**
     * 创建日期
     */
    private String createTime;

    /**
     * 创建人
     */
    private String createdBy;

    /**
     * 操作对象
     */
    private Integer activationFlag;

    /**
     * 错误描述
     */
    private String errorDesc;

    /**
     * 所属门店名称
     */
    private String storeName;

}
