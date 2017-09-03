package com.enums;

/**
 * Created by ASUS on 2017-09-03.
 */
public enum UrType {

    COMPANY("COMPANY","雇主公司"),
    HUNTER("HUNTER","猎头"),
    COMPANY_HUNTER("COMPANY_HUNTER","猎头公司"),
    PT_ADMIN("PT_ADMIN","平台运营");

    public String code;
    public String dc;

    UrType(String code, String dc) {
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
