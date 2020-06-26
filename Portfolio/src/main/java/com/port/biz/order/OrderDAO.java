package com.port.biz.order;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.port.biz.vo.OrdersVO;

@Repository
public class OrderDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int selectMaxOseq() {
		return mybatis.selectOne("OrderDAO.selectMaxOseq");
	}
	
	public void insertOrder(OrdersVO vo) {
		mybatis.insert("OrderDAO.insertOrder", vo);
	}
	
	public void insertOrderDetail(OrdersVO vo) {
		mybatis.insert("OrderDAO.insertOrderDetail", vo);
	}
	
	public List<OrdersVO> listOrderById(OrdersVO vo){
		return mybatis.selectList("OrderDAO.listOrderById", vo);
	}
	
	public List<Integer> selectSeqOrdering(String id){
		return mybatis.selectList("OrderDAO.selectSeqOrdering", id);
	}
	
	public List<OrdersVO> listOrder(String member_name){
		return mybatis.selectList("OrderDAO.listOrder", member_name);
	}
	
	public void updateOrderResult(String oseq) {
		mybatis.update("OrderDAO.updateOrderResult", oseq);
	}
	
	public List<Integer> allOrder(String id){
		return mybatis.selectList("OrderDAO.allOrder", id);
	}
	
	public List<OrdersVO> orderCheckByOseq(int oseq) {
		return mybatis.selectList("OrderDAO.orderCheckByOseq", oseq);
	}
	
	public OrdersVO orderCheckByOdseq(int odseq) {
		return mybatis.selectOne("OrderDAO.orderCheckByOdseq", odseq);
	}
	
	public void orderDelete(int oseq) {
		mybatis.delete("OrderDAO.orderDelete", oseq);
	}
	
	public void orderDetailDelete(int odseq) {
		mybatis.delete("OrderDAO.orderDetailDelete", odseq);
	}
	
}
