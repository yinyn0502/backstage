package com.ueater.backstage.common.model.price;

import lombok.Data;

/**
 * Created by chengyuxiang on 2017/7/14.
 * <p/>
 * 会员对象
 */
@Data
public class MemberDimensionTO {

    private Integer type;//member:appType,level

    private Integer value;//appType,level
}
