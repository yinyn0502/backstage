package com.ueater.backstage.common.enums.reverseOrder;

import com.google.common.collect.Lists;
import com.ueater.backstage.common.model.reverseOrder.ReverseReasonVO;
import com.ueater.backstage.common.model.reverseOrder.ReverseServiceVO;

import java.util.Arrays;
import java.util.List;

import static com.ueater.backstage.common.enums.reverseOrder.ReverseReasonEnum.COMMODITY_PACKING_DAMAGE;

/**
 * 逆向单服务类型
 */

public enum ReverseServiceEnum {

    // 退货单((商品质量有问题/商品包装破损/商品发错货/商品与描述不符/无理由退货)
    RETURN_GOODS(0, "退货", Arrays.asList(ReverseReasonEnum.QUALITY_QUESTION_RETURN.getType(), COMMODITY_PACKING_DAMAGE.getType(),
            ReverseReasonEnum.GOODS_SHIPPED_WRONG.getType(), ReverseReasonEnum.INCONSISTENT_WITH_DESCRIPTION.getType(), ReverseReasonEnum.NO_REASON.getType())),

    // 换货单(商品质量有问题/商品包装破损/商品发错货/商品与描述不符)
    EXCHANGE_GOODS(1, "换货", Arrays.asList(ReverseReasonEnum.QUALITY_QUESTION_RETURN.getType(), COMMODITY_PACKING_DAMAGE.getType(),
            ReverseReasonEnum.GOODS_SHIPPED_WRONG.getType(), ReverseReasonEnum.INCONSISTENT_WITH_DESCRIPTION.getType())),

    // 退款单(未收到商品)
    REFUND(2, "仅退款", Arrays.asList(ReverseReasonEnum.RECEIVE_NO_GOODS.getType())),
    // 补`发单(未收到商品)
    SUPPLY_GOODS(3, "补发货", Arrays.asList(ReverseReasonEnum.RECEIVE_NO_GOODS.getType())),

    RESTAURANT_REFUND(4, "餐厅订单退款", Arrays.asList(ReverseReasonEnum.QUALITY_QUESTION_RETURN.getType(), ReverseReasonEnum.COMMODITY_PACKING_DAMAGE.getType(),
            ReverseReasonEnum.GOODS_SHIPPED_WRONG.getType(), ReverseReasonEnum.INCONSISTENT_WITH_DESCRIPTION.getType()));

    private Integer type;
    private String serviceName;
    private List<Integer> reasonList;

    ReverseServiceEnum(Integer type, String serviceName, List<Integer> reasonList) {
        this.type = type;
        this.serviceName = serviceName;
        this.reasonList = reasonList;
    }

    public Integer getType() {
        return type;
    }

    public static String getServiceNameByType(Integer type) {
        if (type == null) {
            return null;
        }
        ReverseServiceEnum[] reverseServiceEnums = ReverseServiceEnum.values();
        for (ReverseServiceEnum reverseServiceEnum : reverseServiceEnums) {
            if (reverseServiceEnum.getType().equals(type)) {
                return reverseServiceEnum.serviceName;
            }
        }
        return null;
    }

    public static List<Integer> getReasonListNameByType(Integer type) {
        if (type == null) {
            return null;
        }
        ReverseServiceEnum[] reverseServiceEnums = ReverseServiceEnum.values();
        for (ReverseServiceEnum reverseServiceEnum : reverseServiceEnums) {
            if (reverseServiceEnum.getType().equals(type)) {
                return reverseServiceEnum.reasonList;
            }
        }
        return null;
    }

    public static ReverseServiceVO getReverseServiceVO(Integer type) {
        if (type == null) {
            return null;
        }
        ReverseServiceEnum[] reverseServiceEnums = ReverseServiceEnum.values();
        for (ReverseServiceEnum reverseServiceEnum : reverseServiceEnums) {
            if (reverseServiceEnum.getType().equals(type)) {
                ReverseServiceVO ReverseServiceVO = new ReverseServiceVO();
                ReverseServiceVO.setType(type);
                ReverseServiceVO.setServiceName(reverseServiceEnum.serviceName);
                List<ReverseReasonVO> reasonTOList = Lists.newArrayList();
                for (Integer reasonType : reverseServiceEnum.reasonList) {
                    ReverseReasonVO ReverseReasonVO = new ReverseReasonVO();
                    ReverseReasonVO.setType(reasonType);
                    ReverseReasonVO.setDesc(ReverseReasonEnum.getReason(reasonType));
                    reasonTOList.add(ReverseReasonVO);
                }
                ReverseServiceVO.setReasonList(reasonTOList);
                return ReverseServiceVO;
            }
        }
        return null;
    }

}
