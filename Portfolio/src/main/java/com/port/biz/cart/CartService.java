package com.port.biz.cart;

import java.util.List;

import com.port.biz.vo.CartVO;

public interface CartService {

	
	List<CartVO> listCart(String id);
	
	public void insertCart(CartVO vo);
	
	public void deleteCart(int cseq);
	
	public void updateCart(int cseq);
	
	void allDeleteCart(String id);
	
	CartVO selectCart(CartVO vo);
}
