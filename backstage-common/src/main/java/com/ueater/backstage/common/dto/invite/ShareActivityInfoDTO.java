package com.ueater.backstage.common.dto.invite;

import lombok.Data;
import org.apache.shiro.SecurityUtils;

/**
 * Created by mayumeng on 2018-05-08.
 */
@Data
public class ShareActivityInfoDTO {

    private Long storeId;

    private String storeName;

    private String status;

    private String reviewRefuseReason;

    private Integer orderedCount;

    private Integer inviteCount;

    private Integer inviteeCount;

    private String createdBy;

    private Long createTime;
    private String createTimeStr;

    private Long activityStartTime;
    private String activityStartTimeStr;

    private Long activityEndTime;
    private String activityEndTimeStr;

    private String activityName;

    private Long activityId;

    //待审核 启用中 审核不通过 已禁用 已过期
    public Boolean getIsShowView() {
        return true;
    }

    public Boolean getIsShowEdit() {
        if (createdBy != null && createdBy.equals(SecurityUtils.getSubject().getPrincipal())) {
            return "审核不通过".equals(this.status) || "待审核".equals(this.status)
                    || "进行中".equals(this.status) || "审核通过".equals(this.status);
        }
        return false;
    }

    public Boolean getIsShowDisable() {
        //return "启用中".equals(this.status) || "待审核".equals(this.status) || "审核不通过".equals(this.status);
        return "进行中".equals(this.status) || "审核通过".equals(this.status);
    }

    public Boolean getIsShowAudit() {
        if (SecurityUtils.getSubject().isPermitted("invite:audit")) {
            return "待审核".equals(this.status) ;
        } else {
            return false;
        }
    }

    public Boolean getIsShowRefused() {
        return "审核不通过".equals(this.status);
    }


}
