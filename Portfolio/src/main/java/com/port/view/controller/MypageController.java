package com.port.view.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.port.biz.cart.CartService;
import com.port.biz.contact.ContactService;
import com.port.biz.member.MemberService;
import com.port.biz.order.OrderService;
import com.port.biz.product.ProductService;
import com.port.biz.room.RoomService;
import com.port.biz.vo.AddressVO;
import com.port.biz.vo.BookVO;
import com.port.biz.vo.CartVO;
import com.port.biz.vo.ContactVO;
import com.port.biz.vo.MemberVO;
import com.port.biz.vo.OrdersVO;
import com.port.biz.vo.ProductVO;

@Controller
public class MypageController {
	@Autowired
	private CartService cartService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ProductService productService;
	@Autowired
	private RoomService roomService;
	@Autowired
	private ContactService contactService;

	@RequestMapping("mypage")
	public String mypage(HttpSession session, Model model) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");
		if (user == null) {
			return "member/loginForm";
		} else {
			String regNum = user.getRegidentNum();

			model.addAttribute("regNum1", regNum.substring(0, 6));
			model.addAttribute("regNum2", regNum.substring(7, 14));
			model.addAttribute("user", user);
			return "mypage/mypage";
		}
	}

	@RequestMapping(value = "cart_list")
	public String cartList(HttpSession session, Model model) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "member/loginForm";
		} else {
			model.addAttribute("cartList", cartService.listCart(user.getId()));

			return "mypage/cartList";
		}
	}

	@RequestMapping(value = "delete_cart", method = RequestMethod.POST)
	public String deleteCart(@RequestParam(value = "cseq", required = false) int cseq) {
		cartService.deleteCart(cseq);
		return "redirect:cart_list";
	}

	@RequestMapping(value = "all_delete_cart")
	public String allDeleteCart(HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");
		cartService.allDeleteCart(user.getId());
		return "redirect:cart_list";
	}

	@RequestMapping(value = "change_addr", method = RequestMethod.GET)
	public String changeAddrForm() {
		return "mypage/findAddr";
	}

	@RequestMapping(value = "change_addr", method = RequestMethod.POST)
	public String changeAddr(Model model, AddressVO vo) {
		List<AddressVO> addressList = memberService.findAddr(vo.getDong());
		model.addAttribute("addressList", addressList);
		return "mypage/findAddr";
	}

	@RequestMapping(value = "pay_form")
	public String payForm(HttpSession session, Model model, CartVO vo) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "member/loginForm";
		} else {
			vo.setId(user.getId());
			List<CartVO> cartList = new ArrayList<CartVO>();
			CartVO cart = cartService.selectCart(vo);
			cartList.add(cart);
			int totalPrice = cart.getPrice2() * cart.getQuantity();
			model.addAttribute("totalPrice", totalPrice);
			model.addAttribute("cartList", cartList);
			model.addAttribute("user", user);
			return "mypage/payForm";
		}
	}

	@RequestMapping(value = "insert_order")
	public String insertOrder(OrdersVO orders, @RequestParam(value = "cseq") int[] cseq, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "member/loginForm";
		} else {
			orders.setId(user.getId());
			if (cseq.length > 1) {
				orderService.insertOrderAll(orders);
			} else {
				CartVO vo = new CartVO();
				vo.setId(user.getId());
				vo.setCseq(cseq[0]);
				CartVO cart = cartService.selectCart(vo);
				orderService.insertOrder(orders, cart);
			}

			return "redirect:order_list"; // 나중에 주문내역으로 보내줄거임.
		}
	}

	@RequestMapping(value = "direct_pay_form")
	public String directPayForm(HttpSession session, Model model, @RequestParam(value = "pseq") String pseq,
			@RequestParam(value = "quantity") int qty) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "member/loginForm";
		} else {
			ProductVO product = productService.getProduct(pseq);
			model.addAttribute("quantity", qty);
			model.addAttribute("product", product);
			model.addAttribute("user", user);
			return "mypage/directPayForm";
		}
	}

	@RequestMapping(value = "direct_insert_order")
	public String directInsertOrder(HttpSession session, @RequestParam(value = "pseq") int pseq,
			@RequestParam(value = "qty") int qty, OrdersVO orders) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "member/loginForm";
		} else {
			orders.setId(user.getId());
			orderService.directOrder(orders, pseq, qty);
			return "redirect:order_list"; // 여기도 나중에 주문내역으로 보내줌
		}

	}

	@RequestMapping(value = "all_pay_form")
	public String allPayForm(HttpSession session, Model model, CartVO vo) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");
		int totalPrice = 0;
		if (user == null) {
			return "member/loginForm";
		} else {
			vo.setId(user.getId());
			List<CartVO> cartList = cartService.listCart(user.getId());
			for (CartVO cart : cartList) {
				totalPrice += cart.getPrice2() * cart.getQuantity();
			}
			model.addAttribute("totalPrice", totalPrice);
			model.addAttribute("cartList", cartList);
			model.addAttribute("user", user);
		}
		return "mypage/payForm";
	}

	@RequestMapping(value = "update_member")
	public String updateMember(HttpSession session, SessionStatus status, MemberVO member, @RequestParam(value="pass") String pass) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");
		if (user == null) {
			return "member/loginForm";
		} else {
			if(member.getPwd().equals("")) {
				member.setPwd(pass);
			}
			memberService.memberUpdate(member);
			status.isComplete();
			session.setAttribute("loginUser", memberService.getMember(member));
			return "redirect:mypage";
		}
	}

	@RequestMapping(value = "order_list")
	public String orderList(HttpSession session, Model model, OrdersVO order) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");
		if (user == null) {
			return "member/loginForm";
		} else {
			List<Integer> oseqList = orderService.allOrder(user.getId());
			List<OrdersVO> orderList = new ArrayList<OrdersVO>();

			for (int oseq : oseqList) {
				order.setId(user.getId());
				order.setOseq(oseq);

				// 주문 변호별 주문내역 조회
				List<OrdersVO> listBySeq = orderService.listOrderById(order);

				// 각 주문별 내용 축약
				OrdersVO vo = new OrdersVO();
				vo.setRegdate(listBySeq.get(0).getRegdate());
				vo.setOseq(listBySeq.get(0).getOseq());
				if (listBySeq.size() > 1) {
					vo.setPname(listBySeq.get(0).getPname() + " 외 " + (listBySeq.size() - 1) + "건");
				} else {
					vo.setPname(listBySeq.get(0).getPname());
				}

				int totalPrice = 0;
				for (int i = 0; i < listBySeq.size(); i++) {
					totalPrice += listBySeq.get(i).getPrice2() * listBySeq.get(i).getQuantity();
					vo.setResult(listBySeq.get(i).getResult());
				}
				vo.setPrice2(totalPrice);

				orderList.add(vo);

			}

			model.addAttribute("orderList", orderList);

			return "mypage/orderList";
		}
	}

	@RequestMapping(value = "order_detail")
	public String orderDetail(@RequestParam(value = "oseq") String oseq, HttpSession session, Model model,
			OrdersVO vo) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "member/loginForm";
		} else {
			vo.setId(user.getId());
			vo.setResult("1");
			List<OrdersVO> orderList = orderService.listOrderById(vo);
			int price = 0;

			for (OrdersVO order : orderList) {
				price += (order.getPrice2() * order.getQuantity());
			}

			model.addAttribute("orderDetail", orderList.get(0));
			model.addAttribute("orderList", orderList);
			model.addAttribute("totalPrice", price);

			return "mypage/orderDetail";
		}

	}

	@RequestMapping(value = "reserve_list")
	public String reserveList(HttpSession session, Model model) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "member/loginForm";
		} else {
			List<BookVO> bookList = roomService.getBookListById(user.getId());
			model.addAttribute("bookList", bookList);
			return "mypage/reserveList";
		}
	}

	@RequestMapping(value = "my_contact_list")
	public String myContactList(HttpSession session, Model model) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "member/loginForm";
		} else {
			List<ContactVO> contactList = contactService.getContactListById(user.getId());
			model.addAttribute("contactList", contactList);
			return "mypage/contactList";
		}
	}

	@RequestMapping(value = "delete_member")
	public String deleteMember(MemberVO member, SessionStatus status) {
		memberService.deleteMember(member.getId());
		status.setComplete();
		return "redirect:index";
	}
	
	@RequestMapping(value = "order_del")
	public String OrderDelete(@RequestParam(value = "result", required = false) String[] result,
			HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "member/loginForm";
		} else {
			for (int i = 0; i < result.length; i++) {
				orderService.orderDelete(Integer.parseInt(result[i]));
			}
			return "redirect:order_list";
		}
	}
	
	@RequestMapping(value = "book_del")
	public String BookDelete(@RequestParam(value = "result", required = false) String[] result,
			HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "member/loginForm";
		} else {
			for (int i = 0; i < result.length; i++) {
				roomService.deleteBook(Integer.parseInt(result[i]));
			}
			return "redirect:reserve_list";
		}
	}
}
