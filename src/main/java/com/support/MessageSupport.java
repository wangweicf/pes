package com.support;

import com.constants.ST;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.stereotype.Component;

/**
 * Created by ASUS on 2017-09-03.
 */
@Component
@Qualifier("messageSupport")
public class MessageSupport implements InitializingBean{

    @Autowired
    CacheManager cacheManager;

    public Cache messageValidCodeCache;

    @Override
    public void afterPropertiesSet() throws Exception {
        messageValidCodeCache = cacheManager.getCache("messageValidCode");
    }

    public void addMessageValidCode(String tel,String bizType, String validCode){
        messageValidCodeCache.put(tel + ST.SEPARATE + bizType, validCode);
    }

    public String getMessageValidCode(String tel,String bizType){
        return (String)messageValidCodeCache.get(tel + ST.SEPARATE + bizType).get();
    }

    public String generateMessageValidCode(String tel,String bizType){
        // TODO 生产前再补充算法，方便测试阶段
        String code = "000000";
        addMessageValidCode(tel, bizType, code);
        return code;
    }

}
