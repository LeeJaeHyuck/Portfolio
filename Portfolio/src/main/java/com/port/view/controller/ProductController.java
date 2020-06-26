package com.port.view.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.port.biz.cart.CartService;
import com.port.biz.product.ProductService;
import com.port.biz.vo.CartVO;
import com.port.biz.vo.CommentsVO;
import com.port.biz.vo.MemberVO;
import com.port.biz.vo.PagingVO;
import com.port.biz.vo.ProductVO;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private CartService cartService;

	@RequestMapping(value = "product_detail")
	public String productDetail(@RequestParam(value = "pseq") String pseq, Model model) {
		ProductVO vo = productService.getProduct(pseq);
		model.addAttribute("product", vo);
		return "product/productDetail";
	}

	@RequestMapping(value = "add_cart")
	public String addCart(CartVO vo, Model model, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "member/loginForm";
		} else {
			vo.setId(user.getId());
			cartService.insertCart(vo);
			return "redirect:cart_list";
		}
	}

	@RequestMapping("product_list")
	public String productList(@RequestParam(value = "search", defaultValue = "") String search, ProductVO vo,
			Model model, @RequestParam(value = "kind", defaultValue = "", required = false) String kind,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		vo.setName(search);
		vo.setKind(kind);
		int total = productService.countProductList(vo);
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
		model.addAttribute("productList", productService.pagingProduct(paging));
		return "product/productList";
	}

	@RequestMapping(value = "delete_product_comment")
	public String deleteProductComment(CommentsVO comment) {
		productService.deleteComment(comment.getCoseq());
		return "redirect:product_detail?pseq=" + comment.getPseq();
	}

	@RequestMapping(value = "insert_product_form")
	public String insertProductForm() {
		return "product/admin/productWriteForm";
	}
	
	

	

}
