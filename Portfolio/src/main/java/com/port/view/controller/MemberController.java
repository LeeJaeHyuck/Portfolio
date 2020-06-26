package com.port.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.port.biz.member.MemberService;
import com.port.biz.product.ProductService;
import com.port.biz.room.RoomService;
import com.port.biz.vo.AddressVO;
import com.port.biz.vo.MemberVO;
import com.port.biz.vo.ProductVO;
import com.port.biz.vo.RoomVO;

@Controller
@SessionAttributes("loginUser")
public class MemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private ProductService productService;
	@Autowired
	private RoomService roomService;

	@RequestMapping("index")
	public String goHome(Model model, HttpSession session,
			@RequestParam(value = "person", defaultValue = "") String person) {
		List<ProductVO> best = productService.getBestProductList();
		List<ProductVO> newPro = productService.getNewProductList();
		List<RoomVO> roomList = roomService.getRoomList(person);
		MemberVO member = (MemberVO) session.getAttribute("loginUser");

		model.addAttribute("bestProduct", best);
		model.addAttribute("newProduct", newPro);
		model.addAttribute("roomList", roomList);
		if (member == null) {
			return "main";
		} else {
			model.addAttribute("name", member.getName());
			return "main";
		}
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginForm() {
		return "member/loginForm";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(MemberVO vo, Model model, HttpSession session) {
		MemberVO member = memberService.login(vo.getId());

		if (member == null) {
			return "member/login_fail2";
		} else if (!member.getPwd().equals(vo.getPwd())) {
			return "member/login_fail";
		} else {
			session.setAttribute("loginUser", member);
			return "redirect:index";
		}
	}

	@RequestMapping(value = "logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:index";
	}

	@RequestMapping(value = "contract")
	public String contractForm() {
		return "member/contract";
	}

	@RequestMapping(value = "sign_up_form")
	public String signUpForm() {
		return "member/signUp";
	}

	@RequestMapping(value = "sign_up", method = RequestMethod.POST)
	public String signUp(MemberVO vo, @RequestParam(value = "regNum1", required = false) String reg1,
			@RequestParam(value = "regNum2", required = false) String reg2) {
		String regidentNum = reg1 + "-" + reg2;
		vo.setRegidentNum(regidentNum);
		memberService.signUp(vo);
		return "member/loginForm";
	}

	@RequestMapping(value = "id_check_form", method = RequestMethod.GET)
	public String idCheckForm(@RequestParam(value = "id") String id, Model model) {
		model.addAttribute("id", id);
		return "member/idCheck";
	}

	@RequestMapping(value = "id_check_form", method = RequestMethod.POST)
	public String idCheck(Model model, MemberVO vo) {

		MemberVO member = memberService.getMember(vo);

		if (member == null) {
			model.addAttribute("result", -1);
		} else {
			model.addAttribute("result", 1);
		}

		model.addAttribute("id", vo.getId());
		return "member/idCheck";
	}

	@RequestMapping(value = "find_addr", method = RequestMethod.GET)
	public String findAddrForm() {
		return "member/findAddr";
	}

	@RequestMapping(value = "find_addr", method = RequestMethod.POST)
	public String findAddr(Model model, AddressVO vo) {
		List<AddressVO> addressList = memberService.findAddr(vo.getDong());
		model.addAttribute("addressList", addressList);
		return "member/findAddr";
	}

	@RequestMapping(value = "find_id", method = RequestMethod.GET)
	public String findIdForm() {
		return "member/findId";
	}

	@RequestMapping(value = "find_id", method = RequestMethod.POST)
	public String findId(MemberVO vo, Model model) {
		MemberVO member = memberService.findId(vo);

		if (member == null) {
			model.addAttribute("result", -1);
			return "member/findId";
		} else {
			model.addAttribute("id", member.getId());
			model.addAttribute("result", 1);
			return "member/findId";
		}
	}

	@RequestMapping(value = "find_pwd", method = RequestMethod.GET)
	public String findPwdForm() {
		return "member/findPwd";
	}

	@RequestMapping(value = "find_pwd", method = RequestMethod.POST)
	public String findPwd(MemberVO vo, Model model) {
		MemberVO member = memberService.findPwd(vo);

		if (member == null) {
			model.addAttribute("result", -1);
			return "member/findPwd";
		} else {
			model.addAttribute("pwd", member.getPwd());
			model.addAttribute("result", 1);
			return "member/findPwd";
		}
	}

//	@RequestMapping(value="member_list")
//	public String memberList(HttpSession session, Model model) {
//		MemberVO user = (MemberVO) session.getAttribute("loginUser");
//		
//		if(user == null) {
//			return "member/loginForm";
//		} else {
//			model.addAttribute("memberList", memberService.getMemberList());
//			return "member/memberList";
//		}
//	}

	

}
