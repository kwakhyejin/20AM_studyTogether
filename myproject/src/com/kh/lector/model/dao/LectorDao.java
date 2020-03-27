package com.kh.lector.model.dao;
import static com.kh.common.JDBCTemplate.close;//static import!

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.lector.model.vo.Lector;

public class LectorDao {

	private Properties prop=new Properties();
	
	public LectorDao() {
		try {
			String path=LectorDao.class.getResource("/sql/lector/lector-query.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	

	
	//강좌조회
	public List<Lector> searchLector(Connection conn, int cPage, int numPerPage) {
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("searchLector");
		List<Lector> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				Lector l=new Lector();
				l.setLectorNo(rs.getInt("lector_no"));
				l.setLectorTitle(rs.getString("lector_title"));
				l.setLectorWriter(rs.getString("lector_writer"));
				l.setLectorCategory(rs.getString("lector_category"));
				l.setLectorDetail(rs.getString("lector_detail"));
				l.setLectorPrice(rs.getInt("lector_price"));
				l.setLectorOriginalImg(rs.getString("lector_original_img"));
				l.setLectorRenamedImg("lector_renamed_img");
				l.setLectorOriginalVideo("lector_original_video");
				l.setLectorRenamedVideo("lector_renamed_video");
				l.setLectorDate(rs.getDate("lector_date"));
				l.setLectorAssign(rs.getString("lector_assign"));
				list.add(l);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	

	//총 로우수 받아오는 메서드
	public int lectorCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("lectorCount");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())result=rs.getInt(1);//카운트행
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}




	public Lector selectLector(Connection conn, int no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectLector");
		Lector l=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next())
			l=new Lector();
			l.setLectorNo(rs.getInt("lector_no"));
			l.setLectorTitle(rs.getString("lector_title"));
			l.setLectorWriter(rs.getString("lector_writer"));
			l.setLectorCategory(rs.getString("lector_category"));
			l.setLectorDetail(rs.getString("lector_detail"));
			l.setLectorPrice(rs.getInt("lector_price"));
			l.setLectorOriginalImg(rs.getString("lector_original_img"));
			l.setLectorRenamedImg(rs.getString("lector_renamed_img"));
			l.setLectorOriginalVideo("lector_original_video");
			l.setLectorRenamedVideo("lector_renamed_video");
		//	l.setLectorVideo(rs.getString("lector_video"));
			l.setLectorDate(rs.getDate("lector_date"));
			l.setLectorAssign(rs.getString("lector_assign"));
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return l;
	}



//카테고리검색
//	public List<Lector> searchLector(Connection conn, String type) {
//
//		Statement stmt=null;
//		ResultSet rs=null;
//		String sql="SELECT * FROM LECTOR WHERE "+type+"";
//		List<Lector> list=new ArrayList();
//		try {
//			stmt=conn.createStatement();
//			rs=stmt.executeQuery(sql);
//			
//			while(rs.next()) {
//				Lector l=new Lector();
//				l.setLectorNo(rs.getInt("lector_no"));
//				l.setLectorTitle(rs.getString("lector_title"));
//				l.setLectorWriter(rs.getString("lector_writer"));
//				l.setLectorCategory(rs.getString("lector_category"));
//				l.setLectorDetail(rs.getString("lector_detail"));
//				l.setLectorPrice(rs.getInt("lector_price"));
//		//		l.setLectorImg(rs.getString("lector_img"));
//				l.setLectorVideo(rs.getString("lector_video"));
//				l.setLectorDate(rs.getDate("lector_date"));
//				l.setLectorReadCount(rs.getInt("lector_readcount"));
//				l.setLectorAssign(rs.getString("lector_assign"));
//				list.add(l);
//			}
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(rs);
//			close(stmt);
//		}
//		return list;
//	}



//강좌개설
	public int insertLector(Connection conn, Lector l) {

		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertLector");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,l.getLectorTitle());
			pstmt.setString(2, l.getLectorWriter());
			pstmt.setString(3,l.getLectorCategory());
			pstmt.setString(4, l.getLectorDetail());
			pstmt.setInt(5, l.getLectorPrice());
			pstmt.setString(6,l.getLectorOriginalImg());
			pstmt.setString(7,l.getLectorRenamedImg());
			pstmt.setString(8, l.getLectorOriginalVideo());
			pstmt.setString(9, l.getLectorRenamedVideo());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}




	public int deleteLector(Connection conn, int no) {

		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("deleteLector");
		
		try {
			Lector l=new Lector();
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




	public int updateLector(Connection conn, Lector l) {
		
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("updateLector");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, l.getLectorTitle());
			pstmt.setString(2, l.getLectorWriter());
			pstmt.setString(3, l.getLectorCategory());
			pstmt.setString(4, l.getLectorDetail());
			pstmt.setString(5, l.getLectorOriginalImg());
//			pstmt.setString(6, l.getLectorRenamedImg());
//			pstmt.setString(7, l.getLectorOriginalVideo());
//			pstmt.setString(8, l.getLectorRenamedVideo());
			pstmt.setInt(6, l.getLectorNo());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	

}
