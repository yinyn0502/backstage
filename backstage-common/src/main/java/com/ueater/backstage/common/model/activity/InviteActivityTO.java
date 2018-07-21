package com.ueater.backstage.common.model.activity;

import lombok.Data;
import org.apache.shiro.SecurityUtils;

/**
 * Created by zhangjiannan on 2018/5/5.
 */
@Data
public class InviteActivityTO {

    private String activityName;
    private Long storeId;
    private Long activityId;//活动id
    private String storeName;
    private Long activityStartTime;
    private String activityStartTimeStr;
    private Long activityEndTime;
    private String activityEndTimeStr;
    private Long createTime;
    private String createTimeStr;

    private String createdBy;
    private Integer inviteeCount;//被邀请
    private Integer inviterCount ;//邀请者
    private Integer orderedCount;//订单数
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
        if (SecurityUtils.getSubject().isPermitted("invite:audit")) {
            return "待审核".equals(this.activityStatus);
        } else {
            return false;
        }
    }

    public Boolean getIsShowRefused() {
        return "审核未通过".equals(this.activityStatus);
    }

}
