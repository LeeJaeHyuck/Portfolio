package com.port.biz.room;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.port.biz.vo.BookVO;
import com.port.biz.vo.CommentsVO;
import com.port.biz.vo.PagingVO;
import com.port.biz.vo.RoomVO;
@Service("roomService")
public class RoomServiceImpl implements RoomService {
	
	@Autowired
	private RoomDAO dao;
	
	@Override
	public List<RoomVO> getRoomList(String person) {
		return dao.getRoomList(person);
	}
	
	@Override
	public RoomVO getRoom(String roomNum) {
		return dao.getRoom(roomNum);
	}
	
	@Override
	public List<BookVO> getBookList(String roomNum) {
		return dao.getBookList(roomNum);
	}

	@Override
	public void reserveRoom(BookVO book) {
		int bseq = dao.selectMaxBseq();
		book.setBseq(bseq);
		dao.reserveRoom(book);
	}

	@Override
	public List<BookVO> getBookListById(String id) {
		return dao.getBookListById(id);
	}

	@Override
	public List<CommentsVO> getRoomCommentList(int roomNum) {
		return dao.getRoomCommentList(roomNum);
	}

	@Override
	public void saveRoomComment(CommentsVO comment) {
		dao.saveRoomComment(comment);
	}

	@Override
	public void deleteComment(int coseq) {
		dao.deleteComment(coseq);
	}

	@Override
	public void insertRoom(RoomVO room) {
		dao.insertRoom(room);
	}

	@Override
	public void updateRoom(RoomVO room) {
		dao.updateRoom(room);
	}

	@Override
	public void deleteRoom(int roomNum) {
		dao.deleteCommentByRoomNum(roomNum);
		dao.deleteRoom(roomNum);
	}

	@Override
	public int countRoomList(String person) {
		return dao.countRoomList(person);
	}

	@Override
	public List<RoomVO> pagingRoom(PagingVO paging) {
		return dao.pagingRoom(paging);
	}

	@Override
	public List<BookVO> getBookListAll(String search) {
		return dao.getBookListAll(search);
	}

	@Override
	public void updateBook(int bseq) {
		dao.updateBook(bseq);
	}

	@Override
	public void deleteBook(int bseq) {
		dao.deleteBook(bseq);
	}
		
}
