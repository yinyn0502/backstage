package com.ueater.backstage.common.model.seckill;

import lombok.Data;
import org.apache.shiro.SecurityUtils;

/**
 * Created by chenyuhua on 2018-03-22.
 */
@Data
public class SeckillActivityProductTO {

    private Long storeId;//门店
    private String storeName;//门店名称
    private Long activityId;//活动id
    private String activityName;//场次名称
    private String activityStartTime;//场次有效时间
    private String activityEndTime;//场次无效时间
    private Long saleCount;//当前可售商品数
    private String createdBy;//创建人
    private String createTime;//创建时间
    private String activityStatus;//状态
    private String reviewRefuseReason;//审核不通过原因

    public Boolean getIsShowView() {
        return !"未开始".equals(this.activityStatus);
    }

    public Boolean getIsShowEdit() {
        if (createdBy != null && createdBy.equals(SecurityUtils.getSubject().getPrincipal())) {
            return "审核未通过".equals(this.activityStatus) || "待审核".equals(this.activityStatus);
        }
        return false;
    }

    public Boolean getIsShowDisable() {
        return "审核通过".equals(this.activityStatus) || "进行中".equals(this.activityStatus);
    }

    public Boolean getIsShowAudit() {
        if (SecurityUtils.getSubject().isPermitted("seckill:audit")) {
            return "待审核".equals(this.activityStatus);
        } else {
            return false;
        }
    }

    public Boolean getIsShowRefused() {
        return "审核未通过".equals(this.activityStatus);
    }

}
