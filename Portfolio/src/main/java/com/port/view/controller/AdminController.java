package com.port.view.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.port.biz.contact.ContactService;
import com.port.biz.member.MemberService;
import com.port.biz.order.OrderService;
import com.port.biz.product.ProductService;
import com.port.biz.room.RoomService;
import com.port.biz.vo.ContactVO;
import com.port.biz.vo.MemberVO;
import com.port.biz.vo.OrdersVO;
import com.port.biz.vo.PagingVO;
import com.port.biz.vo.ProductVO;
import com.port.biz.vo.RoomVO;
import com.port.biz.vo.SalesQuantity;

@Controller
public class AdminController {

	@Autowired
	private ProductService productService;
	@Autowired
	private RoomService roomService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private ContactService contactService;

	@RequestMapping("member_list")
	public String memberList(@RequestParam(value = "search", defaultValue = "") String search, MemberVO vo, Model model,
			@RequestParam(value = "key", defaultValue = "0", required = false) int key,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "member/loginForm";
		} else {
			if (key == 0) {
				vo.setName(search);
				vo.setId(search);
			} else if (key == 1) {
				vo.setId(search);
				vo.setName("");
			} else {
				vo.setName(search);
				vo.setId("");
			}

			int total = memberService.countMemberList(vo);
			int over = 0;
			if (total % 10 > 0) {
				over = total / 10 + 1;
			} else {
				over = total / 10;
			}

			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) {
				cntPerPage = "10";
			} else if (Integer.parseInt(nowPage) < 1) {
				nowPage = "1";
			} else if (Integer.parseInt(nowPage) > over) {
				nowPage = over + "";
			}

			PagingVO paging = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

			if (key == 0) {
				paging.setName(search);
				paging.setId(search);
			} else if (key == 1) {
				paging.setId(search);
				paging.setName("");
			} else {
				paging.setId("");
				paging.setName(search);
			}

			model.addAttribute("key", key);
			model.addAttribute("search", search);
			model.addAttribute("paging", paging);
			model.addAttribute("memberList", memberService.pagingMember(paging));
			return "mypage/admin/memberList";
		}
	}

	@RequestMapping(value = "member_detail")
	public String memberDetail(MemberVO member, Model model, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "member/loginForm";
		} else {
			member = memberService.getMember(member);
			model.addAttribute("member", member);
			return "member/admin/memberDetail";
		}
	}

	@RequestMapping(value = "admin_update_member")
	public String adminUpdateMember(MemberVO member, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "member/loginForm";
		} else {
			memberService.changeMember(member);
			return "redirect:member_list";
		}
	}

	// =========================상품======================================

	@RequestMapping("admin_product_list")
	public String adminProductList(@RequestParam(value = "search", defaultValue = "") String search, ProductVO vo,
			Model model, @RequestParam(value = "kind", defaultValue = "", required = false) String kind,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		vo.setName(search);
		vo.setKind(kind);
		int total = productService.adminCountProductList(vo);
		int over = 0;
		if (total % 8 > 0) {
			over = total / 8 + 1;
		} else {
			over = total / 8;
		}

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "8";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "8";
		} else if (Integer.parseInt(nowPage) < 1) {
			nowPage = "1";
		} else if (Integer.parseInt(nowPage) > over) {
			nowPage = over + "";
		}

		PagingVO paging = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		paging.setName(search);
		paging.setKind(kind);
		model.addAttribute("kind", kind);
		model.addAttribute("search", search);
		model.addAttribute("paging", paging);
		model.addAttribute("productList", productService.adminPagingProduct(paging));
		return "product/productList";
	}

	@RequestMapping(value = "insert_product")
	public String insertProduct(ProductVO product,
			@RequestParam(value = "images", required = false) MultipartFile images, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "member/loginForm";
		} else {
			if (!images.isEmpty()) {
				String root_path = session.getServletContext().getRealPath("WEB-INF/resources/product_images/");
				String fileName = images.getOriginalFilename();
				try {
					images.transferTo(new File(root_path + fileName));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				product.setImage(fileName);
			}
			productService.insertProduct(product);
			return "redirect:product_list";
		}
	}

	@RequestMapping(value = "update_product_form")
	public String updateProductForm(@RequestParam(value = "pseq") String pseq, HttpSession session, Model model) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "member/loginForm";
		} else {
			ProductVO product = productService.getProduct(pseq);
			model.addAttribute("product", product);
			return "product/admin/updateProduct";
		}
	}

	@RequestMapping(value = "update_product")
	public String updateProduct(ProductVO product,
			@RequestParam(value = "images", required = false) MultipartFile images, HttpSession session)
			throws Exception {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "member/loginForm";
		} else {
			if (!images.isEmpty()) {
				String root_path = session.getServletContext().getRealPath("WEB-INF/resources/product_images/");
				String fileName = images.getOriginalFilename();
				try {
					images.transferTo(new File(root_path + fileName));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				product.setImage(fileName);
			}
			productService.updateProduct(product);
			return "redirect:product_detail?pseq=" + product.getPseq(); // 나중에 디테일로 바꿔줌
		}
	}

	@RequestMapping(value = "delete_product")
	public String deleteProduct(@RequestParam(value = "pseq") int pseq) {
		productService.deleteProduct(pseq);
		return "redirect:admin_product_list";
	}
	
	@RequestMapping(value="sales_graph_form")
	public String adminProductSalesChart() {
		return "mypage/admin/salesGraph";
	}
	
	@RequestMapping(value="sales_graph", produces="application/json; charset=utf-8")
	@ResponseBody
	public List<SalesQuantity> sales_record_chart(){
		
		List<SalesQuantity> listSales = productService.getProductSales();
		
		System.out.println("판매 실적>>>>>>");
		System.out.println("    제품명     수량");
		System.out.println("---------------");
		for(SalesQuantity item : listSales) {
			System.out.printf("%10s%3d\n", item.getPname(), item.getQuantity());
		}
		
		System.out.println("================");
		return listSales;
	}

	// ========================주문====================
	@RequestMapping(value = "admin_order_list")
	public String adminOrderList(@RequestParam(value = "key", defaultValue = "") String key, HttpSession session,
			Model model) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "member/loginForm";
		} else {
			List<OrdersVO> orderList = orderService.listOrder(key);
			model.addAttribute("orderList", orderList);
			return "mypage/admin/adminOrderList";
		}
	}

	@RequestMapping(value = "admin_order_save")
	public String adminOrderSave(@RequestParam(value = "result", required = false) String[] result,
			HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "member/loginForm";
		} else {
			for (int i = 0; i < result.length; i++) {
				orderService.updateOrderResult(result[i]);
			}
			return "redirect:admin_order_list";
		}
	}
	
	@RequestMapping(value = "admin_order_del")
	public String adminOrderDelete(@RequestParam(value = "result", required = false) String[] result,
			HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "member/loginForm";
		} else {
			for (int i = 0; i < result.length; i++) {
				orderService.orderDelete(Integer.parseInt(result[i]));
			}
			return "redirect:admin_order_list";
		}
	}

	// =========================작업실======================================
	@RequestMapping(value = "insert_room_form")
	public String insertRoomForm() {
		return "room/admin/roomWriteForm";
	}
	
	@RequestMapping(value="roomNum_check_form")
	public String checkRoomNum(@RequestParam(value="roomNum") String roomNum, Model model) {
		
		
		RoomVO room = roomService.getRoom(roomNum);
		if(room == null) {
			model.addAttribute("result", -1);
			model.addAttribute("roomNum", roomNum);
		} else {
			model.addAttribute("result", 1);
			model.addAttribute("roomNum", roomNum);
		}
		return "room/admin/numCheck";
	}

	@RequestMapping(value = "insert_room")
	public String insertRoom(HttpSession session, RoomVO room, @RequestParam(value = "images") MultipartFile images) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "member/loginForm";
		} else {
			if (!images.isEmpty()) {
				String root_path = session.getServletContext().getRealPath("WEB-INF/resources/room_images/");
				String fileName = images.getOriginalFilename();
				try {
					images.transferTo(new File(root_path + fileName));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				room.setImage(fileName);
			}

			roomService.insertRoom(room);
			return "redirect:room_list";
		}
	}

	@RequestMapping(value = "update_room_form")
	public String updateRoomForm(Model model, @RequestParam(value = "roomNum") String roomNum) {
		model.addAttribute("room", roomService.getRoom(roomNum));
		return "room/admin/updateRoom";
	}

	@RequestMapping(value = "update_room")
	public String updateRoom(HttpSession session, RoomVO room,
			@RequestParam(value = "images", required = false) MultipartFile images) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "member/loginForm";
		} else {
			if (!images.isEmpty()) {
				String root_path = session.getServletContext().getRealPath("WEB-INF/resources/room_images/");
				String fileName = images.getOriginalFilename();
				try {
					images.transferTo(new File(root_path + fileName));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				room.setImage(fileName);
			}
			roomService.updateRoom(room);
			return "redirect:room_list";
		}
	}

	@RequestMapping(value = "delete_room")
	public String deleteRoom(HttpSession session, RoomVO room) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "member/loginForm";
		} else {
			roomService.deleteRoom(room.getRoomNum());
			return "redirect:room_list";
		}
	}

	@RequestMapping(value = "admin_reserve_list")
	public String adminReserveList(@RequestParam(value = "search", defaultValue = "") String search, Model model) {
		model.addAttribute("bookList", roomService.getBookListAll(search));
		return "mypage/admin/adminReserveList";
	}

	@RequestMapping(value = "admin_book_save")
	public String adminBookSave(@RequestParam(value = "result", required = false) String[] result,
			HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "member/loginForm";
		} else {
			for (int i = 0; i < result.length; i++) {
				roomService.updateBook(Integer.parseInt(result[i]));
			}
			return "redirect:admin_reserve_list";
		}
	}

	@RequestMapping(value = "admin_book_del")
	public String adminBookDelete(@RequestParam(value = "result", required = false) String[] result,
			HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "member/loginForm";
		} else {
			for (int i = 0; i < result.length; i++) {
				roomService.deleteBook(Integer.parseInt(result[i]));
			}
			return "redirect:admin_reserve_list";
		}
	}

	// ============================컨택=======================================

	@RequestMapping(value = "update_reply")
	public String updateReply(ContactVO contact, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");
		if (user == null) {
			return "member/loginForm";
		} else {
			contactService.updateReply(contact);
		return "redirect:contact_detail?cseq=" + contact.getCseq();
//			return "redirect:contact_list";
		}
	}
}
