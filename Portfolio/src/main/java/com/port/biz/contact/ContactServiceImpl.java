package com.port.biz.contact;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.port.biz.vo.ContactVO;

@Service("contactService")
public class ContactServiceImpl implements ContactService {
	
	@Autowired
	private ContactDAO dao;
	
	@Override
	public void insertContact(ContactVO contact) {
		int cseq = dao.selectMaxCseq();
		contact.setCseq(cseq);
		
		dao.insertContact(contact);
	}

	@Override
	public List<ContactVO> getContactList() {
		return dao.getContactList();
	}

	@Override
	public ContactVO getContact(int cseq) {
		return dao.getContact(cseq);
	}

	@Override
	public int selectMaxCseq() {
		return dao.selectMaxCseq();
	}

	@Override
	public List<ContactVO> getContactListById(String id) {
		return dao.getContactListById(id);
	}

	@Override
	public void updateContact(ContactVO contact) {
		dao.updateContact(contact);
	}

	@Override
	public void deleteContact(int cseq) {
		dao.deleteContact(cseq);
	}

	@Override
	public void updateReply(ContactVO contact) {
		dao.updateReply(contact);
	}

}
