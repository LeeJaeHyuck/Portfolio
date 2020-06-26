package com.port.biz.contact;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.port.biz.vo.ContactVO;

@Repository
public class ContactDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertContact(ContactVO contact) {
		mybatis.insert("ContactDAO.insertContact", contact);
	}
	
	public List<ContactVO> getContactList(){
		return mybatis.selectList("ContactDAO.getContactList");
	}
	
	public List<ContactVO> getContactListById(String id){
		return mybatis.selectList("ContactDAO.getContactListById", id);
	}
	
	public ContactVO getContact(int cseq) {
		return mybatis.selectOne("ContactDAO.getContact", cseq);
	}
	
	public int selectMaxCseq() {
		return mybatis.selectOne("ContactDAO.selectMaxCseq");
	}
	
	public void updateContact(ContactVO contact) {
		mybatis.update("ContactDAO.updateContact", contact);
	}
	
	public void deleteContact(int cseq) {
		mybatis.delete("ContactDAO.deleteContact", cseq);
	}
	
	public void updateReply(ContactVO contact) {
		mybatis.update("ContactDAO.updateReply", contact);
	}
}
