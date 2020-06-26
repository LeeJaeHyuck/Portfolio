package com.port.biz.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.port.biz.vo.AddressVO;
import com.port.biz.vo.MemberVO;
import com.port.biz.vo.PagingVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public MemberVO login(String id){
		return mybatis.selectOne("MemberDAO.login", id);
	}
	
	public MemberVO getMember(String id){
		return mybatis.selectOne("MemberDAO.getMember", id);
	}
	
	public List<MemberVO> getMemberList(){
		return mybatis.selectList("MemberDAO.getMemberList");
	}
	
	public void signUp(MemberVO member) {
		mybatis.insert("MemberDAO.signUp", member);
	}
	
	public List<AddressVO> findAddr(String dong) {
		return mybatis.selectList("MemberDAO.findAddr", dong);		
	}
	
	public void memberUpdate(MemberVO member) {
		mybatis.update("MemberDAO.updateMember", member);
	}
	
	public MemberVO findId(MemberVO member) {
		return mybatis.selectOne("MemberDAO.findId", member);
	}
	
	public MemberVO findPwd(MemberVO member) {
		return mybatis.selectOne("MemberDAO.findPwd", member);
	}
	
	public List<MemberVO> pagingMember(PagingVO paging){
		return mybatis.selectList("MemberDAO.pagingMember", paging);
	}

	public int countMemberList(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.countMemberList", vo);
	}
	
	public void deleteMember(String id) {
		mybatis.update("MemberDAO.deleteMember", id);
	}
	
	public void changeMember(MemberVO member) {
		mybatis.update("MemberDAO.changeMember", member);
	}
}
