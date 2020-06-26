package com.port.biz.product;

import java.util.List;

import com.port.biz.vo.CommentsVO;
import com.port.biz.vo.PagingVO;
import com.port.biz.vo.ProductVO;
import com.port.biz.vo.SalesQuantity;

public interface ProductService {
	
	List<ProductVO> getBestProductList();
	
	List<ProductVO> getNewProductList();
	
	List<ProductVO> getProductList();
	
	List<ProductVO> getProductListByKind(ProductVO vo);
	
	ProductVO getProduct(String pseq);
	
	int countProductList(ProductVO vo);
	
	int adminCountProductList(ProductVO vo);
	
	List<ProductVO> pagingProduct(PagingVO paging);
	
	List<ProductVO> adminPagingProduct(PagingVO paging);
	
	List<CommentsVO> getProductCommentList(int pseq);
	
	void insertProductComment(CommentsVO comment);
	
	void updateComment(CommentsVO comment);
	
	void deleteComment(int coseq);
	
	void insertProduct(ProductVO product);
	
	void updateProduct(ProductVO product);
	
	void deleteProduct(int pseq);
	
	List<SalesQuantity> getProductSales();
}
