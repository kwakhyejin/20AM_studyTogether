package com.kh.board.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.board.model.vo.Board;

import static com.kh.common.JDBCTemplate.*;

public class BoardDao {
	
	private Properties prop=new Properties();
	
	public BoardDao() {
		try {
			String path=BoardDao.class.getResource("/sql/board/board.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Board> boardList(Connection conn, int cPage, int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("boardList");
		List<Board> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql);
			//1=1~15, 2=16~30, 3=31
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Board b=new Board();
				b.setBoard_no(rs.getInt("board_no"));
				b.setReply_no(rs.getInt("reply_no"));
				b.setReply_level(rs.getInt("reply_level"));
				b.setNickname(rs.getString("nickname"));
				b.setTitle(rs.getString("title"));
				b.setContent(rs.getString("content"));
				b.setImg_file(rs.getString("img_file"));
				b.setFile_upload(rs.getString("file_upload"));
				b.setWrite_date(rs.getDate("write_date"));
				b.setCnt(rs.getInt("cnt"));
				b.setGood_cnt(rs.getInt("good_cnt"));
				b.setBad_cnt(rs.getInt("bad_cnt"));
				list.add(b);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public Board boardView(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		String sql=prop.getProperty("boardView");
		Board b=new Board();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				b.setBoard_no(rs.getInt("board_no"));
				b.setReply_no(rs.getInt("reply_no"));
				b.setReply_level(rs.getInt("reply_level"));
				b.setNickname(rs.getString("nickname"));
				b.setTitle(rs.getString("title"));
				b.setContent(rs.getString("content"));
				b.setImg_file(rs.getString("img_file"));
				b.setFile_upload(rs.getString("file_upload"));
				b.setWrite_date(rs.getDate("write_date"));
				b.setCnt(rs.getInt("cnt"));
				b.setGood_cnt(rs.getInt("good_cnt"));
				b.setBad_cnt(rs.getInt("bad_cnt"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return b;
	}
	
	public int boardCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("boardCount");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public int viewCount(Connection conn, int no) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("viewCount");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int maxNo(Connection conn, int no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("maxNo");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
}














