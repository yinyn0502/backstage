package com.ueater.backstage.common.enums.reverseOrder;

import com.google.common.collect.Lists;
import com.ueater.backstage.common.model.reverseOrder.RefundModeTO;

import java.util.List;


/**
 * 退货模式，上门取货/送往门店
 * Created by chengyuxiang on 2017/8/17.
 */
public enum RefundModeEnum {

    HOME(0, "上门取件"),

    STORE(1, "送往门店");

    private Integer mode;

    private String desc;

    RefundModeEnum(Integer mode, String desc) {
        this.mode = mode;
        this.desc = desc;
    }

    public Integer getMode() {
        return mode;
    }

    public String getDesc() {
        return desc;
    }

    public static List<RefundModeTO> list() {
        List<RefundModeTO> refundModeTOList = Lists.newArrayList();
        RefundModeEnum[] refundModeEnums = RefundModeEnum.values();
        for (RefundModeEnum itemEnum : refundModeEnums) {
            RefundModeTO refundModeTO = new RefundModeTO();
            refundModeTO.setMode(itemEnum.getMode());
            refundModeTO.setDesc(itemEnum.getDesc());
            refundModeTOList.add(refundModeTO);
        }
        return refundModeTOList;
    }

    public static String getDescByMode(Integer mode) {
        if (mode == null) {
            return null;
        }
        RefundModeEnum[] refundModeEnums = RefundModeEnum.values();
        for (RefundModeEnum refundModeEnum : refundModeEnums) {
            if (refundModeEnum.getMode().equals(mode)) {
                return refundModeEnum.desc;
            }
        }
        return null;
    }
}
