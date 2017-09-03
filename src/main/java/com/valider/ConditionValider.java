package com.valider;

/**
 * Created by ASUS on 2017-09-03.
 */
public class ConditionValider {

    public static void validNull(Object value){
        if(value == null){
            throw  new  IllegalArgumentException("值为空!");
        }
    }

}
