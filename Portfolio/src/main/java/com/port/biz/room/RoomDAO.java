package com.port.biz.room;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.port.biz.vo.BookVO;
import com.port.biz.vo.CommentsVO;
import com.port.biz.vo.PagingVO;
import com.port.biz.vo.RoomVO;

@Repository
public class RoomDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int selectMaxBseq() {
		return mybatis.selectOne("RoomDAO.selectMaxBseq");
	}
	public List<RoomVO> getRoomList(String person) {
		return mybatis.selectList("RoomDAO.getRoomList", person);
	}
	
	public RoomVO getRoom(String roomNum) {
		return mybatis.selectOne("RoomDAO.getRoom", roomNum);
	}
	
	public List<BookVO> getBookList(String roomNum) {
		return mybatis.selectList("RoomDAO.getBookList", roomNum);
	}
	
	public void reserveRoom(BookVO book) {
		mybatis.insert("RoomDAO.reserveRoom", book);
	}
	
	public List<BookVO> getBookListById(String id){
		return mybatis.selectList("RoomDAO.getBookListById", id);
	}
	
	public List<BookVO> getBookListAll(String search){
		return mybatis.selectList("RoomDAO.getBookListAll", search);
	}
	
	public List<CommentsVO> getRoomCommentList(int roomNum){
		return mybatis.selectList("CommentDAO.getRoomCommentList", roomNum);
	}
	
	public void saveRoomComment(CommentsVO comment) {
		mybatis.insert("CommentDAO.saveRoomComment", comment);
	}
	
	public void deleteComment(int coseq) {
		mybatis.delete("CommentDAO.deleteComment", coseq);
	}
	
	public void insertRoom(RoomVO room) {
		mybatis.insert("RoomDAO.insertRoom", room);
	}
	
	public void updateRoom(RoomVO room) {
		mybatis.update("RoomDAO.updateRoom", room);
	}
	
	public void deleteRoom(int roomNum) {
		mybatis.delete("RoomDAO.deleteRoom", roomNum);
	}
	
	public void deleteCommentByRoomNum(int roomNum) {
		mybatis.delete("CommentDAO.deleteCommentByRoomNum", roomNum);
	}
	
	public List<RoomVO> pagingRoom(PagingVO paging){
		return mybatis.selectList("RoomDAO.pagingRoom", paging);
	}

	public int countRoomList(String person) {
		return mybatis.selectOne("RoomDAO.countRoomList", person);
	}
	
	public void updateBook(int bseq) {
		mybatis.update("RoomDAO.updateBook", bseq);
	}
	
	public void deleteBook(int bseq) {
		mybatis.delete("RoomDAO.deleteBook", bseq);
	}
}
