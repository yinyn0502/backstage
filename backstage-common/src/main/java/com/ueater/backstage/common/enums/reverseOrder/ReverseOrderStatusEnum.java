package com.ueater.backstage.common.enums.reverseOrder;

/**
 * @author fanlei
 * @version 1.0.0
 * @date 八月 23 2017 下午9:06
 * <p/>
 * 逆向申请单状态文案枚举
 */
public enum ReverseOrderStatusEnum {
    //单子审核
    CHECK_WAIT(0, "待审核", "24小时内eat定会给您答复"),
    CHECK_PASS(100, "审核通过", ""),//状态和文案在 ReverseOrderCheckStatusEnum里

    PACKING(200, "拣货中", "eat正在为您拣选所需要的货品"),
    PACKED(300, "拣货完成", "eat在等待快递哥哥取货哟"),//拣货完成

    TAKEING(400, "取货中", "eat骑士拼命狂奔中"),
    TAKED(500, "已取货", "eat正火速赶往门店"),

    DELIVERYING(600, "配送中", "eat骑士拼命狂奔中"),
    CHANGED(700, "已换货", "记得核对商品，确认订单哦"),
    CONFIRM_RECEIPT(800, "确认收货", "eat收到退回商品啦，感谢配合"),//用户确认收货
    SERVICE_CONFIRM_RECEIPT(900,"确认收货","eat收到退回商品啦，感谢配合"),//客服确认收货（退货和换货的）

    REFUND_CHECK_PASS(1000, "退款审核通过", ""),

    //退款审核
    REFUNDED(1100, "已退款", "退款金额退回原账户，请关注"),//已退款

    REVERSE_COMPLETE(1200, "申请单完成", "eat期待您常来探索美味哦"),

    //审核不通过
    CHECK_REFUSE(-100, "审核不通过", "还需申请，需要重新提交哦"),
    REFUND_CHECK_REFUSE(-200,"退款审核不通过",""),
    //取消
    CANCEL(-300, "已取消", "如需退换货服务请重新发起"),
    LACK_CANCEL(-301, "缺货取消", "因商品暂时缺货，订单已取消"),//缺货取消

    SERVICE_NOT_RECEIPT(-400,"客服未收到货",""),//客服未收到货

    //拒收
    REFUSED(-500,"拒收","");



    private Integer status;
    private String names;
    private String desc;

    ReverseOrderStatusEnum(Integer status, String names, String desc) {
        this.status = status;
        this.names = names;
        this.desc = desc;
    }

    public Integer getStatus() {
        return status;
    }

    public String getNames() {
        return names;
    }

    public String getDesc() {
        return desc;
    }

    public static ReverseOrderStatusEnum getByStatus(Integer status) {
        if (status == null) {
            return null;
        }
        ReverseOrderStatusEnum[] reverseOrderStatusEnums = ReverseOrderStatusEnum.values();
        for (ReverseOrderStatusEnum item : reverseOrderStatusEnums) {
            if (item.getStatus().equals(status)) {
                return item;
            }
        }
        return null;
    }

    public static String getDescByStatus(Integer status) {
        if (status == null) {
            return null;
        }
        ReverseOrderStatusEnum[] reverseOrderStatusEnums = ReverseOrderStatusEnum.values();
        for (ReverseOrderStatusEnum reverseOrderStatusEnum : reverseOrderStatusEnums) {
            if (reverseOrderStatusEnum.getStatus().equals(status)) {
                return reverseOrderStatusEnum.desc;
            }
        }
        return null;
    }

    public static String getNameByStatus(Integer status) {
        if (status == null) {
            return null;
        }
        ReverseOrderStatusEnum[] reverseOrderStatusEnums = ReverseOrderStatusEnum.values();
        for (ReverseOrderStatusEnum reverseOrderStatusEnum : reverseOrderStatusEnums) {
            if (reverseOrderStatusEnum.getStatus().equals(status)) {
                return reverseOrderStatusEnum.names;
            }
        }
        return null;
    }

    /**
     * 检查当前状态是不是终态
     *
     * @param status
     * @return
     */
    public static Boolean isFinalStatus(Integer status) {
        if (status == null) {
            return null;
        }
        if (status.equals(REVERSE_COMPLETE.getStatus())
                || status.equals(CHECK_REFUSE.getStatus())
                || status.equals(CANCEL.getStatus())
                || status.equals(REFUND_CHECK_REFUSE.getStatus())
                || status.equals(LACK_CANCEL.getStatus())) {
            return Boolean.TRUE;
        }
        return Boolean.FALSE;
    }
}
