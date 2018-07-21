package com.ueater.backstage.common.model.seckill;

import com.ueater.backstage.common.model.sendcoupon.BasePagination;
import lombok.Data;

import java.util.List;

/**
 * Created by chenyuhua on 2018-03-22.
 */
@Data
public class SeckillActivityListTO {
    private List<SeckillActivityProductTO> seckillQueryResultList;
    private BasePagination basePagination;
}
