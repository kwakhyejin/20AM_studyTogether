package com.kh.common;

	
import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

	public class JDBCTemplate {
		
		public static Connection getConnection() {
			Connection conn=null;
			/*커넥션인터페이스는 DriverManager클래스의 getConnection메서드를 실행함으로써
			정의되며 데이터베이스와 연결된 세션 역할을 한다.
			이 세션을 이용하여 db에 sql을 전송하고 그 결과인 ResultSet을 반환*/
			//sql문장을 실행시키기위해 커넥션 객체가 필요하다
			try {
				Properties prop=new Properties();
				String path=JDBCTemplate.class.getResource("/sql/driver/driver.properties").getPath();
				/*driver=oracle.jdbc.driver.OracleDriver
				url=jdbc:oracle:thin:@localhost:1521:xe
				user=web
				pw=web path에 요것들이 저장된다.*/
				prop.load(new FileReader(path));
				//prop로드해라 
				Class.forName(prop.getProperty("driver"));
				conn=DriverManager.getConnection(prop.getProperty("url"),
						prop.getProperty("user"),
						prop.getProperty("pw"));
				conn.setAutoCommit(false);
			}catch(Exception e) {
				e.printStackTrace();
			}
			return conn;
		}
		//객체 종료 메소드
		public static void close(Connection conn) {
			try {
				if(conn!=null && !conn.isClosed()) {
					//커넥션이 비어있지 않고 커넥션이 닫혔으면 
					conn.close();//
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		public static void close(Statement stmt) {
			try {
				if(stmt != null && !stmt.isClosed()) {
					stmt.close();
					/*Statement클래스는 SQL구문을 실행하는역할
					스스로는 sql구문 이해못함(구문해석X) -> 전달 자동차 역할
				PreparedStatement는 statement객체의 기능이 향상
				인자와 관련된 작업이 특화(매개변수)//
				statement가 비어이지 않고 닫혀있다면 클로즈해라*/
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		public static void close(ResultSet rs) {
			try {
				if(rs!=null && !rs.isClosed()) {
					rs.close();
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		//커밋하는 메서드
		public static void commit(Connection conn) {
			try {
				if(conn!=null && !conn.isClosed()) {
					conn.commit();
					/* 커넥션이 비어있지 않고 닫혀있다면 커넥션 커밋! */
				}
			}catch(SQLException  e) {
				e.printStackTrace();
			}
		}
		
		//롤백하는 메서드
		public static void rollback(Connection conn) {
			try {
				if(conn!=null&&!conn.isClosed()) {
					conn.rollback();
					//커넥션이 비어있지 않고 닫혀있다면 롤백
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

