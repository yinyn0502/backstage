package com.ueater.backstage.common.model.activity;

import com.ueater.backstage.common.model.sendcoupon.BasePagination;
import lombok.Data;

import java.util.List;

/**
 * Created by zhangjiannan on 2018/5/9.
 */
@Data
public class InviteActivityListTO {
    private List<InviteActivityTO> inviteActivityTOS;
    private BasePagination basePagination;
}
