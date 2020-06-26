package com.port.biz.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.port.biz.vo.CommentsVO;
import com.port.biz.vo.PagingVO;
import com.port.biz.vo.ProductVO;
import com.port.biz.vo.SalesQuantity;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ProductVO> getBestProductList(){
		return mybatis.selectList("ProductDAO.getBestProductList");
	}
	
	public List<ProductVO> getNewProductList(){
		return mybatis.selectList("ProductDAO.getNewProductList");
	}
	
	public List<ProductVO> getProductList(){
		return mybatis.selectList("ProductDAO.getProductList");
	}
	
	public List<ProductVO> getProductListByKind(ProductVO vo){
		return mybatis.selectList("ProductDAO.getProductListByKind", vo);
	}
	
	public ProductVO getProduct(String pseq) {
		return mybatis.selectOne("ProductDAO.getProduct", pseq);
	}
	
	public List<ProductVO> pagingProduct(PagingVO paging){
		return mybatis.selectList("ProductDAO.pagingProduct", paging);
	}
	
	public List<ProductVO> adminPagingProduct(PagingVO paging){
		return mybatis.selectList("ProductDAO.adminPagingProduct", paging);
	}

	public int countProductList(ProductVO vo) {
		return mybatis.selectOne("ProductDAO.countProductList", vo);
	}
	
	public int adminCountProductList(ProductVO vo) {
		return mybatis.selectOne("ProductDAO.adminCountProductList", vo);
	}
	
	public List<CommentsVO> getProductComentList(int pseq){
		return mybatis.selectList("CommentDAO.getProductCommentList", pseq);
	}
	
	public void insertProductComment(CommentsVO comment) {
		mybatis.insert("CommentDAO.saveProductComment", comment);
	}
	
	public void updateComment(CommentsVO comment) {
		mybatis.update("CommentDAO.updateComment", comment);
	}
	
	public void deleteComment(int coseq) {
		mybatis.delete("CommentDAO.deleteComment", coseq);
	}
	
	public void insertProduct(ProductVO product) {
		mybatis.insert("ProductDAO.insertProduct", product);
	}
	
	public void updateProduct(ProductVO product) {
		mybatis.update("ProductDAO.updateProduct", product);
	}
	
	public void deleteProduct(int pseq) {
		mybatis.update("ProductDAO.deleteProduct", pseq);
	}
	
	public void deleteCommentByPseq(int pseq) {
		mybatis.delete("CommentDAO.deleteCommentByPseq", pseq);
	}
	
	public List<SalesQuantity> getProductSales() {
		return mybatis.selectList("ProductDAO.getProductSales");
	}
	
	
}
