package com.ueater.backstage.common.enums.cms;

import com.google.common.collect.Lists;
import com.ueater.backstage.common.model.cms.AppTypeTO;

import java.util.List;

/**
 * @author fanlei
 * @version 1.0.0
 * @date 五月 16 2017 上午11:02
 */
public enum AppTypeEnum {

    IOS(0, "iOS"), ANDROID(1, "Android"), H5(2, "微信商城");

    private Integer type;
    private String desc;

    AppTypeEnum(Integer type, String desc) {
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
        AppTypeEnum[] appTypes = AppTypeEnum.values();
        for (AppTypeEnum appType : appTypes) {
            if (appType.getType().equals(type)) {
                return appType.desc;
            }
        }
        return null;
    }
}
