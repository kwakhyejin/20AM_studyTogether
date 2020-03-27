package com.kh.board.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Board;

public class BoardService {
	private BoardDao dao=new BoardDao();
	
	public List<Board> boardList(int cPage, int numPerPage){
		Connection conn=getConnection();
		List<Board> list=dao.boardList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}
	
	public Board boardView(int no) {
		Connection conn=getConnection();
		Board b=dao.boardView(conn, no);
		close(conn);
		return b;
	}
	
	public int boardCount() {
		Connection conn=getConnection();
		int result=dao.boardCount(conn);
		close(conn);
		return result;
	}
	
	public void viewCount(int no) {
		Connection conn=getConnection();
		int result=dao.viewCount(conn, no);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
	}
	
	public int maxNo(int no) {
		Connection conn=getConnection();
		int result=dao.maxNo(conn, no);
		close(conn);
		return result;
	}
}















