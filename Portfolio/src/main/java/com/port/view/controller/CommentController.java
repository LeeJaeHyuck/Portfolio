package com.port.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.port.biz.product.ProductService;
import com.port.biz.room.RoomService;
import com.port.biz.vo.CommentsVO;
import com.port.biz.vo.MemberVO;

@RestController
public class CommentController {

	@Autowired
	private ProductService productService;
	@Autowired
	private RoomService roomService;

	@RequestMapping(value = "save_product_comment", method = RequestMethod.POST)
	@ResponseBody
	public String saveProductComment(CommentsVO comment, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "fail";
		} else {
			String userId = user.getId();
			comment.setWriter(userId);
			productService.insertProductComment(comment);
			return "success";
		}
	}

	@RequestMapping(value = "comment_product_list", method = RequestMethod.GET)
	public List<CommentsVO> getProductCommentList(CommentsVO commentVO) {

		int pseq = commentVO.getPseq();
		List<CommentsVO> commentList = productService.getProductCommentList(pseq);
		return commentList;
	}

	@RequestMapping(value = "save_room_comment", method = RequestMethod.POST)
	@ResponseBody
	public String saveRoomComment(CommentsVO comment, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "fail";
		} else {
			String userId = user.getId();
			comment.setWriter(userId);
			
			roomService.saveRoomComment(comment);
			return "success";
		}
	}

	@RequestMapping(value = "comment_room_list", method = RequestMethod.GET)
	public List<CommentsVO> getRoomCommentList(CommentsVO comment) {

		int roomNum = comment.getRoomNum();
		List<CommentsVO> commentList = roomService.getRoomCommentList(roomNum);
		return commentList;
	}

	

}
