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

	// return��: �ֹ� oseq
	@Override
	public void insertOrderAll(OrdersVO orders) {
		// �ֹ� ��ȣ�� �Ҵ�޴´�.
		int oseq = selectMaxOseq();
		orders.setOseq(oseq);

		// �ֹ� ���̺� �ֹ���ȣ�� ���̵� �����Ѵ�.
		dao.insertOrder(orders);

		// ��ٱ��Ͽ��� ����� �����´�.
		List<CartVO> cartList = cartService.listCart(orders.getId());

		// ��ٱ��Ͽ� �ִ� �ֹ��� ������ order_detail ���̺� �����Ѵ�.
		for (CartVO cVo : cartList) {
			System.out.println("��ٱ��� ����: " + cVo);

			orders.setOseq(orders.getOseq()); // �ֹ���ȣ ����
			orders.setPseq(cVo.getPseq()); // ��ǰ��ȣ ����
			orders.setQuantity(cVo.getQuantity()); // ��ǰ���� ����

			insertOrderDetail(orders);

			// cart ���̺� �ֹ�ó���� �Ϸ�� �����Ѵ�.
			cartService.updateCart(cVo.getCseq());
		}

	}

	@Override
	public void insertOrder(OrdersVO orders, CartVO cart) {
		// �ֹ� ��ȣ�� �Ҵ�޴´�.
		int oseq = selectMaxOseq();
		orders.setOseq(oseq);

		// �ֹ� ���̺� �ֹ���ȣ�� ���̵� �����Ѵ�.
		dao.insertOrder(orders);

		// ��ٱ��Ͽ��� ����� �����´�.
		CartVO cVo = cartService.selectCart(cart);

		// ��ٱ��Ͽ� �ִ� �ֹ��� ������ order_detail ���̺� �����Ѵ�.
		orders.setOseq(orders.getOseq()); // �ֹ���ȣ ����
		orders.setPseq(cVo.getPseq()); // ��ǰ��ȣ ����
		orders.setQuantity(cVo.getQuantity()); // ��ǰ���� ����

		insertOrderDetail(orders);

		// cart ���̺� �ֹ�ó���� �Ϸ�� �����Ѵ�.
		cartService.updateCart(cVo.getCseq());

	}

	@Override
	public void directOrder(OrdersVO orders, int pseq, int qty) {
		// �ֹ� ��ȣ�� �Ҵ�޴´�.
		int oseq = selectMaxOseq();
		orders.setOseq(oseq);

		// �ֹ� ���̺� �ֹ���ȣ�� ���̵� �����Ѵ�.
		dao.insertOrder(orders);

		// ��ٱ��Ͽ� �ִ� �ֹ��� ������ order_detail ���̺� �����Ѵ�.
		orders.setOseq(orders.getOseq()); // �ֹ���ȣ ����
		orders.setPseq(pseq); // ��ǰ��ȣ ����
		orders.setQuantity(qty); // ��ǰ���� ����

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
