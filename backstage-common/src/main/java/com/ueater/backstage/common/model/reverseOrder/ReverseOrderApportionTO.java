package com.ueater.backstage.common.model.reverseOrder;

import lombok.Data;

import java.util.List;

/**
 * @author fanlei
 * @version 1.0.0
 * @date 八月 21 2017 上午5:46
 * <p/>
 * 创建逆向申请单时，从订单系统拉取的分摊信息
 */

@Data
public class ReverseOrderApportionTO {

    private List<ReverseOrderItemApportionTO> reverseOrderItemApportionTOList;

    private Double expressFee;

}
