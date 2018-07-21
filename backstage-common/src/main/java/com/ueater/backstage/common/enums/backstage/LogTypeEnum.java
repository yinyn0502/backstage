package com.ueater.backstage.common.enums.backstage;

import com.google.common.collect.Lists;
import com.ueater.backstage.common.enums.cms.AppTypeEnum;
import com.ueater.backstage.common.model.cms.AppTypeTO;

import java.util.List;

public enum LogTypeEnum {

    BACKSTAGE(1, "backstage"),
    ORDER(2, "order"),
    REVERSEORDER(3, "reverseOrder"),
    CMS(4, "cms");

    private Integer type;
    private String desc;

    LogTypeEnum(Integer type, String desc) {
        this.type = type;
        this.desc = desc;
    }

    public Integer getType() {
        return type;
    }

    public String getDesc() {
        return desc;
    }

    public static List<AppTypeTO> list() {
        List<AppTypeTO> appTypeList = Lists.newArrayList();
        AppTypeEnum[] appTypes = AppTypeEnum.values();
        for (AppTypeEnum appType : appTypes) {
            AppTypeTO appTypeTO = new AppTypeTO();
            appTypeTO.setType(appType.getType());
            appTypeTO.setDesc(appType.getDesc());
            appTypeList.add(appTypeTO);
        }
        return appTypeList;
    }

    public static String getDescByType(Integer type) {
        if (type == null) {
            return null;
        }
        LogTypeEnum[] logTypes = LogTypeEnum.values();
        for (LogTypeEnum logTypeEnum : logTypes) {
            if (logTypeEnum.getType().equals(type)) {
                return logTypeEnum.desc;
            }
        }
        return null;
    }

}
