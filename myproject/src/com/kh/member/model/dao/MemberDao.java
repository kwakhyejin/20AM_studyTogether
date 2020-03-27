package com.kh.member.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.member.model.vo.Member;

public class MemberDao {
	private Properties prop = new Properties();
	
	public MemberDao() {
		try {
			String path = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
			prop.load(new FileReader(path));
		}catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public Member selectId(Connection conn, String id, String pw) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql= prop.getProperty("selectId");
		Member m = null;
		try {
			System.out.println("들어옴"+id+pw);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				m=new Member();
				m.setUserId(rs.getString("user_id"));
				m.setPassword(rs.getString("password"));
				m.setUserName(rs.getString("user_name"));
				m.setEmail(rs.getString("email"));
				m.setEnrollDate(rs.getDate("enrolldate"));
				m.setNickName(rs.getString("nick_name"));
				m.setGender(rs.getString("gender"));
				m.setBirthDate(rs.getDate("birth_date"));			
				m.setPhone(rs.getString("phone"));
				m.setAddress(rs.getString("address"));
				m.setAdminStatus(rs.getString("admin_status").charAt(0));
				System.out.println(m);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		System.out.println("리턴" + m);
		return m;
		
	}
	
	public int memberEnroll(Connection conn, String id, String password, String userName, String email) {

		PreparedStatement pstmt=null;
		String sql= prop.getProperty("memberEnroll");
		int result=0;
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			pstmt.setString(3, userName);
			pstmt.setString(4, email);
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public Member lookforPassword(Connection conn, String id, String userName, String email) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectCheckinfo");
		Member m = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, userName);
			pstmt.setString(3, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				m.setUserId(rs.getString("user_id"));
				m.setPassword(rs.getString("password"));
				m.setUserName(rs.getString("user_name"));
				m.setEmail(rs.getString("email"));
				m.setEnrollDate(rs.getDate("enrolldate"));
				m.setNickName(rs.getString("nick_name"));
				m.setGender(rs.getString("gender"));
				m.setBirthDate(rs.getDate("birth_date"));			
				m.setPhone(rs.getString("phone"));
				m.setAddress(rs.getString("address"));
				m.setAdminStatus(rs.getString("admin_status").charAt(0));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
	

}
