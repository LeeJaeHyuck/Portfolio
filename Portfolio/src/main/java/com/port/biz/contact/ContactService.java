package com.port.biz.contact;

import java.util.List;

import com.port.biz.vo.ContactVO;

public interface ContactService {
	
	void insertContact(ContactVO contact);
	
	List<ContactVO> getContactList();
	
	List<ContactVO> getContactListById(String id);
	
	ContactVO getContact(int cseq);
	
	int selectMaxCseq();
	
	void updateContact(ContactVO contact);
	
	void deleteContact(int cseq);
	
	void updateReply(ContactVO contact);
}
