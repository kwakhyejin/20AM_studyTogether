package com.kh.review.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.review.model.vo.ReviewStudy;

public class ReviewStudyDao {
	private Properties prop = new Properties();
	
	public ReviewStudyDao() {
		try {
			String path=ReviewStudyDao.class.getResource("/sql/reviewStudy/reviewStudy-query.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	public int reviewStudyCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count = 0;
		String sql = prop.getProperty("reviewStudyCount");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) count=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return count;
	}

	public List<ReviewStudy> selectReviewStudy(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=prop.getProperty("selectReviewStudy");
		List<ReviewStudy> list = new ArrayList();
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, (cPage-1)*numPerPage+1); //시박 데이터 번호 -> rnum기준
			pstmt.setInt(2, cPage*numPerPage); //끝 데이터 번호 -> rnum기준
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewStudy revS =new ReviewStudy();
				revS.setReviewStuNo(rs.getInt("review_stu_no"));
				revS.setReviewStuWriter(rs.getString("review_stu_writer"));
				revS.setStudyName(rs.getString("study_name"));
				revS.setReviewStuCategory(rs.getString("review_stu_category"));
				revS.setReviewStuContent(rs.getString("review_stu_content"));
				revS.setReviewStuStar(rs.getInt("review_stu_star"));
				revS.setReviewStuDate(rs.getDate("review_stu_date"));
				list.add(revS);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

}
