package com.enums;

/**
 * Created by ASUS on 2017-09-03.
 */
public enum ActionType {


    COMPANY_REGISTER("0001","雇主公司注册"),
    HUNTER_COMPANY_REGISTER("0002","猎头公司注册"),

    COMPANY_LOGIN("0003","雇主登录"),
    HUNTER_COMPANY_LOGIN("0004","猎头公司登录"),

    HUNTER_LOGIN("0005","猎头登录"),


    PAID_2_PT("1001","雇主支付给平台"),
    PAID_2_HUNTER("1002","平台支付给猎头公司"),

    JD_CREATE("3001","职位创建"),
    JD_DISPATHER("3002","职位发布");

    public String code;
    public String dc;

    ActionType(String code, String dc) {
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
