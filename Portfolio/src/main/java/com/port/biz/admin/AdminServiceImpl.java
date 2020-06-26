package com.port.biz.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.port.biz.vo.AdminVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO dao;
	
	@Override
	public AdminVO getAdmin(String id) {
		return dao.getAdmin(id);
	}

}
