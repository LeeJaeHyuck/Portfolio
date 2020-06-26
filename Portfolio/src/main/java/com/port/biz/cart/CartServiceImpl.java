package com.port.biz.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.port.biz.vo.CartVO;

@Service("cartService")
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDAO dao;
	
	@Override
	public List<CartVO> listCart(String id) {
		return dao.listCart(id);
	}

	@Override
	public void insertCart(CartVO vo) {
		dao.insertCart(vo);
	}

	@Override
	public void deleteCart(int cseq) {
		dao.deleteCart(cseq);
	}

	@Override
	public void updateCart(int cseq) {
		dao.updateCart(cseq);
	}

	@Override
	public void allDeleteCart(String id) {
		dao.allDeleteCart(id);
	}

	@Override
	public CartVO selectCart(CartVO vo) {
		return dao.selectCart(vo);
	}

}
