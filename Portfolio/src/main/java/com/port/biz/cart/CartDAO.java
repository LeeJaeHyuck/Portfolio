package com.port.biz.cart;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.port.biz.vo.CartVO;

@Repository
public class CartDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<CartVO> listCart(String id) {
		return mybatis.selectList("CartDAO.listCart", id);
	}
	
	public void insertCart(CartVO vo) {
		mybatis.insert("CartDAO.insertCart", vo);
	}
	
	public void deleteCart(int cseq) {
		mybatis.delete("CartDAO.deleteCart", cseq);		
	}
	
	public void updateCart(int cseq) {
		mybatis.update("CartDAO.updateCart", cseq);
	}
	
	public void allDeleteCart(String id) {
		mybatis.delete("CartDAO.allDeleteCart", id);
	}
	
	public CartVO selectCart(CartVO vo){
		return mybatis.selectOne("CartDAO.selectCart", vo);
	}
	
	public void qtyupdate(CartVO vo) {
		mybatis.update("CartDAO.qtyupdate", vo);
	}
	
}
