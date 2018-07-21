package com.ueater.backstage.common.model.backstageorder;

/**
 * 订单状态enum
 *
 * @author xurupeng
 * @version 1.0.0
 * @date 2017年5月3日 下午3:42:12
 * @see
 */
public enum BackstageOrderStatusEnum {

    TO_BE_PAID(0, "待支付"),          //新订单（待支付）

    ALREADY_PAID(100, "已支付"),        //已支付（待审核）

    AUDITED(200, "待拣货"),            //已审核（待拣货）

    PICKING_UP(300, "拣货中"),            //拣货中（待拣货完成）

    PICKING_COMPLETE(400, "拣货完成"),    //拣货完成（待取货）

    PICK_UP(500, "已取货"),            //已取货（待配送）

    IN_DISTRIBUTION(600, "配送中"),    //配送中（待送达）

    SERVED(700, "已送达"),                //已送达（待确认收货）

    CONFIRM_RECEIPT(800, "确认收货"),    //确认收货

    ORDER_FULFILLMENT( 1000, "订单完成"),//订单完成（不可进行任何操作）

    ORDER_CANCEL(-100, "顾客已取消"),    //已取消，顾客取消

    ORDER_CANCEL_AUTO(-101, "已超时取消"),//超时未支付系统自动取消

    ORDER_CANCEL_LACK_CUSTOMER(-103, "已缺货取消"),//缺货取消

    ORDER_OVERTIME_CANCEL(-200, "已拒收");        //拒收

    private Integer state;

    private String stateName;

    BackstageOrderStatusEnum(Integer state, String stateName) {
        this.state = state;
        this.stateName = stateName;
    }

    public Integer getState() {
        return state;
    }

    public String getStateName() {
        return stateName;
    }



}
