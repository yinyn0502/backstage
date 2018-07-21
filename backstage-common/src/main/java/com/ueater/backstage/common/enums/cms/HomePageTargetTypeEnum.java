package com.ueater.backstage.common.enums.cms;

import com.google.common.collect.Lists;
import com.ueater.backstage.common.model.cms.HomePageTargetTypeTO;

import java.util.List;

/**
 * Created by zhangjiannan on 2018/1/15.
 */
public enum HomePageTargetTypeEnum {
    WEBPAGE_self(1, "当前页打开H5"),
    NATIVE_SELF(2, "当前页打开本地页"),
    WEBPAGE_NEW(3, "新页打开H5"),
    NATIVE_NEW(4, "新页打开本地页");
    private Integer type;
    private String desc;

    HomePageTargetTypeEnum(Integer type, String desc) {
        this.type = type;
        this.desc = desc;
    }

    public Integer getType() {
        return type;
    }

    public String getDesc() {
        return desc;
    }

    public static List<HomePageTargetTypeTO> list() {
        List<HomePageTargetTypeTO> appTypeList = Lists.newArrayList();
        HomePageTargetTypeEnum[] homePageTargetTypes = HomePageTargetTypeEnum.values();
        for (HomePageTargetTypeEnum homePageTargetType : homePageTargetTypes) {
            HomePageTargetTypeTO homePageTargetTypeTO = new HomePageTargetTypeTO();
            homePageTargetTypeTO.setType(homePageTargetType.getType());
            homePageTargetTypeTO.setDesc(homePageTargetType.getDesc());
            appTypeList.add(homePageTargetTypeTO);
        }
        return appTypeList;
    }

    public static String getDescByType(Integer type) {
        if (type == null) {
            return null;
        }
        HomePageTargetTypeEnum[] homePageTargetTypes = HomePageTargetTypeEnum.values();
        for (HomePageTargetTypeEnum homePageTargetType : homePageTargetTypes) {
            if (homePageTargetType.getType().equals(type)) {
                return homePageTargetType.desc;
            }
        }
        return null;
    }

}
