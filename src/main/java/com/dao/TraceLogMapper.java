package com.dao;

import com.dao.base.BaseDaoImpl;
import com.model.Company;
import com.model.TraceLog;
import org.springframework.stereotype.Component;

@Component("traceLogMapper")
public class TraceLogMapper extends BaseDaoImpl {

    public String getNameSpace(){return "TraceLogMapper";}

    public long insert(TraceLog record){
        return (Long)getSqlMapClientTemplate().insert(getNameSpace()+"."+"insert",record);
    }

}