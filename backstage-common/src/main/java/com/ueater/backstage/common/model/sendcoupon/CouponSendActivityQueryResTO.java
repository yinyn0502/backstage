package com.ueater.backstage.common.model.sendcoupon;

import lombok.Data;

import java.util.List;

/**
 * Created by chengyuxiang on 2018-03-09.
 */
@Data
public class CouponSendActivityQueryResTO {
    private Long sendActivityId;    // 发券活动id
    private String sendActivityName;// 发券活动名称
    private Integer targetType;     // 目标类型 1.拉新2.沉默激活3.下单奖励4.社群运营5.用户补偿6.品类推广7.目标用户促活8.第三方合作9.其他
    private String targetTypeDesc;
    private String createdBy;       // 创建人
    private String createTime;      // 创建时间
    private String executedBy;      // 执行人
    private String executeTime;     // 执行时间

    private String updatedBy;
    private String updateTime;
    private Integer status;         // 活动状态

    private String mobileText;
    private List<ActivityNameTO> activityNameList;
    private String selectedCouponIds;

    public Boolean getIsShowView() {
        return Boolean.TRUE;
    }
    public Boolean getIsShowEdit() {
        return status == 0 ? Boolean.TRUE : Boolean.FALSE;
    }
    public Boolean getIsShowExecute() {
        return status == 0 ? Boolean.TRUE : Boolean.FALSE;
    }
    public Boolean getIsShowIng() {
        return status == 1 ? Boolean.TRUE : Boolean.FALSE;
    }
    public Boolean getIsShowResult() {
        return status == 2 ? Boolean.TRUE : Boolean.FALSE;
    }
}
