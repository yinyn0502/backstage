package com.ueater.backstage.common.enums.backstage;

import com.ueater.tool.response.IResponseCode;

public enum BackstageResponseCode implements IResponseCode {

    BACKSTAGE_SECKILL_CAN_NOT_AUDIT_OWNER(Integer.valueOf(400001), "backstage_seckill_can_not_audit_owner", "不能审核自己创建的秒杀活动"),

    BACKSTAGE_SHARE_CAN_NOT_AUDIT_OWNER(Integer.valueOf(400002), "backstage_share_can_not_audit_owner", "不能审核自己创建的邀请有礼活动");
    private Integer code;
    private String message;
    private String desc;

    private BackstageResponseCode(Integer code, String message, String desc) {
        this.code = code;
        this.message = message;
        this.desc = desc;
    }

    public Integer getCode() {
        return this.code;
    }

    public String getMessage() {
        return this.message;
    }

    public String getDesc() {
        return this.desc;
    }

    public static BackstageResponseCode getByCode(Integer code) {
        BackstageResponseCode[] responseCodes = values();
        BackstageResponseCode[] var2 = responseCodes;
        int var3 = responseCodes.length;

        for(int var4 = 0; var4 < var3; ++var4) {
            BackstageResponseCode responseCode = var2[var4];
            if(responseCode.getCode().equals(code)) {
                return responseCode;
            }
        }

        return null;
    }

    public String toString() {
        return "ResponseCode{code=" + this.code + ", message=\'" + this.message + '\'' + ", desc=\'" + this.desc + '\'' + '}';
    }
}
