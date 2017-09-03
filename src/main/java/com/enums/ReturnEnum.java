package com.enums;

/**
 * Created by ASUS on 2017-09-03.
 */
public enum ReturnEnum {


    SUCCESS("000","操作成功"),
    PARAMS_ERROR("004","参数错误"),
    SERVER_ERROR("005","服务内部错误"),
    TIMEOUT_ERROR("006","服务超时"),
    UK_ERROR("007","唯一性冲突"),
    REMOTE_SERVICE_ERROR("010","外部服务不可用");


    public String code;
    public String dc;

    ReturnEnum(String code, String dc) {
        this.code = code;
        this.dc = dc;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDc() {
        return dc;
    }

    public void setDc(String dc) {
        this.dc = dc;
    }
}
