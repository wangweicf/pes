package com.result;

import com.enums.ReturnEnum;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Created by ASUS on 2017-09-03.
 */
public class BaseResult<T> {

    public String retCode = ReturnEnum.SUCCESS.getCode();

    public String retMsg;

    public T data;

    public BaseResult() {
    }

    public static BaseResult makeResut(){
        return new BaseResult();
    }

    public static BaseResult makeResut(Object data){
        return new BaseResult(data);
    }

    public static BaseResult makeErrorResut(ReturnEnum returnEnum, String msg){
        return new BaseResult(returnEnum.getCode(),msg);
    }

    public static BaseResult makeErrorResut(ReturnEnum returnEnum, String msg, Object data){
        return new BaseResult(returnEnum.getCode(),msg,data);
    }

    public  Map toMap(){
        Map resultMap = new LinkedHashMap();
        resultMap.put("retCode",getRetCode());
        resultMap.put("retMsg",getRetMsg());
        resultMap.put("data",getData());
        return  resultMap;
    }

    public BaseResult(T data) {
        this.data = data;
    }

    public BaseResult(String retCode, String retMsg, T data) {
        this.retCode = retCode;
        this.retMsg = retMsg;
        this.data = data;
    }

    public BaseResult(String retCode, String retMsg) {
        this.retCode = retCode;
        this.retMsg = retMsg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public String getRetCode() {
        return retCode;
    }

    public void setRetCode(String retCode) {
        this.retCode = retCode;
    }

    public String getRetMsg() {
        return retMsg;
    }

    public void setRetMsg(String retMsg) {
        this.retMsg = retMsg;
    }
}
