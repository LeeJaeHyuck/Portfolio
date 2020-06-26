package com.port.biz.admin;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.port.biz.vo.AdminVO;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public AdminVO getAdmin(String id) {
		return mybatis.selectOne("AdminDAO.getAdmin", id);
	}
}
