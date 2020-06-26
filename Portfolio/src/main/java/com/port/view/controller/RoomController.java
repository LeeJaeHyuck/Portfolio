package com.port.view.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.port.biz.room.RoomService;
import com.port.biz.vo.BookVO;
import com.port.biz.vo.CommentsVO;
import com.port.biz.vo.MemberVO;
import com.port.biz.vo.PagingVO;
import com.port.biz.vo.RoomVO;

@Controller
public class RoomController {

	@Autowired
	private RoomService roomService;
/*
	@RequestMapping(value = "room_list")
	public String roomList(Model model, @RequestParam(value = "person", defaultValue = "") String person) {
		List<RoomVO> roomList = roomService.getRoomList(person);

		model.addAttribute("roomList", roomList);

		return "room/roomList";
	}
*/
	@RequestMapping("room_list")
	public String roomList(Model model, 
			@RequestParam(value = "person", defaultValue = "", required = false) String person,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		
		int total = roomService.countRoomList(person);
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
		
		paging.setPerson(person);
		
		model.addAttribute("person", person);
		model.addAttribute("paging", paging);
		model.addAttribute("roomList", roomService.pagingRoom(paging));
		return "room/roomList";
	}

	@RequestMapping(value = "room_detail")
	public String roomDetail(RoomVO room, Model model, @RequestParam(value = "roomNum") String roomNum) {
		room = roomService.getRoom(roomNum);
		model.addAttribute("room", room);
		return "room/roomDetail";
	}

	@RequestMapping(value = "calendar")
	public String calendar2(@RequestParam(value = "roomNum") String roomNum, HttpServletRequest request) {
		List<BookVO> bookList = roomService.getBookList(roomNum);
		request.setAttribute("roomNum", roomNum);
		request.setAttribute("bookList", bookList);
		return "room/Calendar";
	}

	@RequestMapping(value = "reserve_room_form")
	public String reserveRoomForm(BookVO book, HttpSession session, Model model) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "member/loginForm";
		} else {
			model.addAttribute("user", user);
			model.addAttribute("book", book);
			model.addAttribute("room", roomService.getRoom(book.getRoomNum()));
			return "room/reserveForm";
		}
	}

	@RequestMapping(value = "reserve_room")
	public String reserveRoom(BookVO book, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "member/loginForm";
		} else {
			SimpleDateFormat fm = new SimpleDateFormat("yyyyMMdd");
			Date parseDate = null;

			try {
				parseDate = fm.parse(book.getDate());
			} catch (ParseException e) {
				e.printStackTrace();
			}

			book.setReserveDate(parseDate);
			book.setId(user.getId());
			book.setPhone(user.getPhone());
			book.setName(user.getName());

			roomService.reserveRoom(book);

			return "redirect:reserve_list";
		}
	}

	@RequestMapping(value = "delete_room_comment")
	public String deleteComment(CommentsVO comment) {
		roomService.deleteComment(comment.getCoseq());
		return "redirect:room_detail?roomNum=" + comment.getRoomNum();
	}

	

}
