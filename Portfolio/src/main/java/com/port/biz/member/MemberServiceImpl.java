package com.port.biz.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.port.biz.vo.AddressVO;
import com.port.biz.vo.MemberVO;
import com.port.biz.vo.PagingVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;

	@Override
	public MemberVO login(String id) {
		return dao.login(id);
	}

	@Override
	public MemberVO getMember(MemberVO vo) {
		return dao.getMember(vo.getId());
	}

	@Override
	public void signUp(MemberVO vo) {
		dao.signUp(vo);

	}

	@Override
	public List<AddressVO> findAddr(String dong) {
		return dao.findAddr(dong);
	}

	@Override
	public void memberUpdate(MemberVO member) {
		dao.memberUpdate(member);
	}

	@Override
	public MemberVO findId(MemberVO member) {
		return dao.findId(member);
	}

	@Override
	public MemberVO findPwd(MemberVO member) {
		return dao.findPwd(member);
	}

	@Override
	public List<MemberVO> getMemberList() {
		return dao.getMemberList();
	}

	@Override
	public List<MemberVO> pagingMember(PagingVO paging) {
		return dao.pagingMember(paging);
	}

	@Override
	public int countMemberList(MemberVO vo) {
		return dao.countMemberList(vo);
	}

	@Override
	public void deleteMember(String id) {
		dao.deleteMember(id);
	}

	@Override
	public void changeMember(MemberVO member) {
		dao.changeMember(member);
	}

}
