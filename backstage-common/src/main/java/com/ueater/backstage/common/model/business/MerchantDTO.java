package com.ueater.backstage.common.model.business;

import lombok.Data;

import java.util.Date;

/**    
 * @Description:    商户实体
 * @Author:       ajian   
 * @CreateDate:   2018/6/5 10:27     
 */
@Data
public class MerchantDTO {

    /**
     * id
     */
    private Long id;

    /**
     * 商户名
     */
    private String merchantName;

    /**
     * 供应商id
     */
    private Long vendorId;

    /**
     * 供应商名
     */
    private String vendorName;

    /**
     * 所属门店
     */
    private Long storeId;

    /**
     * 状态
     */
    private Integer status;

    /**
     * 开通时间
     */
    private Long openningTime;

    /**
     * 关闭时间
     */
    private String closeTime;

    /**
     * 创建时间
     */
    private String createTime;

    /**
     * 修改时间
     */
    private String updateTime;

    /**
     * 创建人
     */
    private String createdBy;

    /**
     * 修改人
     */
    private String updatedBy;

}
