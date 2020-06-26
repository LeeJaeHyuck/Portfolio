package com.port.biz.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.port.biz.cart.CartService;
import com.port.biz.vo.CartVO;
import com.port.biz.vo.OrdersVO;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO dao;

	@Autowired
	private CartService cartService;

	@Override
	public int selectMaxOseq() {
		return dao.selectMaxOseq();
	}

	// return값: 주문 oseq
	@Override
	public void insertOrderAll(OrdersVO orders) {
		// 주문 번호를 할당받는다.
		int oseq = selectMaxOseq();
		orders.setOseq(oseq);

		// 주문 테이블에 주문번호와 아이디를 저장한다.
		dao.insertOrder(orders);

		// 장바구니에서 목록을 가져온다.
		List<CartVO> cartList = cartService.listCart(orders.getId());

		// 장바구니에 있는 주문상세 내역을 order_detail 테이블에 저장한다.
		for (CartVO cVo : cartList) {
			System.out.println("장바구니 내역: " + cVo);

			orders.setOseq(orders.getOseq()); // 주문번호 설정
			orders.setPseq(cVo.getPseq()); // 상품번호 설정
			orders.setQuantity(cVo.getQuantity()); // 상품개수 설정

			insertOrderDetail(orders);

			// cart 테이블에 주문처리를 완료로 수정한다.
			cartService.updateCart(cVo.getCseq());
		}

	}

	@Override
	public void insertOrder(OrdersVO orders, CartVO cart) {
		// 주문 번호를 할당받는다.
		int oseq = selectMaxOseq();
		orders.setOseq(oseq);

		// 주문 테이블에 주문번호와 아이디를 저장한다.
		dao.insertOrder(orders);

		// 장바구니에서 목록을 가져온다.
		CartVO cVo = cartService.selectCart(cart);

		// 장바구니에 있는 주문상세 내역을 order_detail 테이블에 저장한다.
		orders.setOseq(orders.getOseq()); // 주문번호 설정
		orders.setPseq(cVo.getPseq()); // 상품번호 설정
		orders.setQuantity(cVo.getQuantity()); // 상품개수 설정

		insertOrderDetail(orders);

		// cart 테이블에 주문처리를 완료로 수정한다.
		cartService.updateCart(cVo.getCseq());

	}

	@Override
	public void directOrder(OrdersVO orders, int pseq, int qty) {
		// 주문 번호를 할당받는다.
		int oseq = selectMaxOseq();
		orders.setOseq(oseq);

		// 주문 테이블에 주문번호와 아이디를 저장한다.
		dao.insertOrder(orders);

		// 장바구니에 있는 주문상세 내역을 order_detail 테이블에 저장한다.
		orders.setOseq(orders.getOseq()); // 주문번호 설정
		orders.setPseq(pseq); // 상품번호 설정
		orders.setQuantity(qty); // 상품개수 설정

		insertOrderDetail(orders);

	}

	@Override
	public void insertOrderDetail(OrdersVO vo) {
		dao.insertOrderDetail(vo);
	}

	@Override
	public List<OrdersVO> listOrderById(OrdersVO vo) {
		return dao.listOrderById(vo);
	}

	@Override
	public List<Integer> selectSeqOrdering(String id) {
		return dao.selectSeqOrdering(id);
	}

	@Override
	public List<OrdersVO> listOrder(String member_name) {
		return dao.listOrder(member_name);
	}

	@Override
	public void updateOrderResult(String oseq) {
		dao.updateOrderResult(oseq);
	}

	@Override
	public List<Integer> allOrder(String id) {
		return dao.allOrder(id);
	}

	@Override
	public void orderDelete(int odseq) {
		OrdersVO orderDetail = dao.orderCheckByOdseq(odseq);
		int oseq = orderDetail.getOseq();
		dao.orderDetailDelete(odseq);
		
		List<OrdersVO> order = dao.orderCheckByOseq(oseq);
		if(order == null) {
			dao.orderDelete(oseq);
		}
	}

}
