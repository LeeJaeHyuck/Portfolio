package com.port.biz.member;

import java.util.List;

import com.port.biz.vo.AddressVO;
import com.port.biz.vo.MemberVO;
import com.port.biz.vo.PagingVO;

public interface MemberService {
	
	MemberVO login(String id);
	
	MemberVO getMember(MemberVO vo);
	
	List<MemberVO> getMemberList();
	
	void signUp(MemberVO vo);
	
	List<AddressVO> findAddr(String dong);
	
	void memberUpdate(MemberVO member);
	
	MemberVO findId(MemberVO member);
	
	MemberVO findPwd(MemberVO member);
	
	List<MemberVO> pagingMember(PagingVO paging);
	
	int countMemberList(MemberVO vo);
	
	void deleteMember(String id);
	
	void changeMember(MemberVO member);
}
