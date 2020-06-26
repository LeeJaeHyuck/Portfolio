package com.port.biz.order;

import java.util.List;

import com.port.biz.vo.CartVO;
import com.port.biz.vo.OrdersVO;

public interface OrderService {

	int selectMaxOseq();
	
	void insertOrderDetail(OrdersVO vo);
	
	void insertOrder(OrdersVO orders, CartVO cart);
	
	void directOrder(OrdersVO orders, int pseq, int qty);
	
	List<OrdersVO> listOrderById(OrdersVO vo);
	
	List<Integer> selectSeqOrdering(String id);
	
	List<OrdersVO> listOrder(String member_name);
	
	void updateOrderResult(String oseq);
	
	List<Integer> allOrder(String id);

	void insertOrderAll(OrdersVO orders);
	
	void orderDelete(int odseq);
}
