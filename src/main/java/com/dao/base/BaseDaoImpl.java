package com.dao.base;

import com.ibatis.sqlmap.client.SqlMapClient;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

public class BaseDaoImpl extends SqlMapClientDaoSupport {
	@Resource(name = "sqlMapClient_basic")
	private SqlMapClient sqlMapClient;
	@SuppressWarnings("deprecation")
	@PostConstruct
	public void initSqlMapClient() {
		super.setSqlMapClient(sqlMapClient);
	}
}