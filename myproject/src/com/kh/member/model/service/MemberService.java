package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {
private MemberDao dao = new MemberDao();
	
	public Member selectId(String id, String pw) {
		Connection conn=getConnection();
		Member m = dao.selectId(conn,id,pw);
		System.out.println("돌아옴");
		close(conn);
		return m;
	}
	public int memberEnroll(String id, String password, String userName, String email) {
		Connection conn=getConnection();
		int result = dao.memberEnroll(conn,id,password,userName,email);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public Member lookforPassword(String id, String userName, String email) {
		Connection conn = getConnection();
		Member m = dao.lookforPassword(conn, id, userName, email);
		close(conn);
		return m;
	}


}
