package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name = "LoginServlet",urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		//로그인 로직 처리하기
		//1.client가 보낸 데이터 확인하기
		String id = request.getParameter("uname");
		String pw = request.getParameter("psw");
		//2.DB에 id,pw일치한 값이 있는지 확인, 일치하는 값이 있으면 그 데이터를 가져오자
		Member m=new MemberService().selectId(id,pw);
		//m 일치하는 값이 있으면 값이 있고, 없으면  null
		//화면을 분기처리!
		//메세지 출력 jsp를 만들고 로그인 성공하면, 성공메세지
		//실패하면 실패메세지 출력하고
		//메인화면으로 돌아가게 처리하기
		System.out.println(m);
		String msg="";
		if(m!=null) {
			//로그인 성공
			msg="로그인 성공";
//			request.setAttribute("loginedMember", m);//로그인 유지가 되지 않음
			//로그인을 유지하기 위해 session객체에 데이터를 넣고 처리함
			HttpSession session = request.getSession(true);//기본으로 값을 가져옴
			//getSession()메소드는 매개변수가 있음 default true가 됨
			//true : 세션이 있으면 그 세션을 리턴하고 없으면 생성해서 리턴
			//false : 세션이 있으면 그 세션을 리턴하고 없으면 null값 리턴
			session.setAttribute("loginedMember", m);
//			session객체의 유지기간을 설정할 수 있음
			//web.xml에 session timeout에 대한 설정이 분으로 설정되어있음
			//session.setMaxInactiveInterval()메소드를 이용해서 설정
//			session.setMaxInactiveInterval(20);//초단위
			//cookie로 아이디 저장 유지하기
			String saveId = request.getParameter("saveId");
			System.out.println("saveId : " + saveId);
			if(saveId!=null) {
				//아이디를 쿠키에 저장하게함.
				Cookie c = new Cookie("saveId",id);
				//쿠키의 유효기간을 설정(7일)
				c.setMaxAge(7*24*60*60);//초단위라~
				response.addCookie(c);
			}else {
				//저장된 cookie값 지우고 check된 것 해제
				Cookie c = new Cookie("saveId",id);
				c.setMaxAge(0);
				response.addCookie(c);
			}
		}else {
			//로그인 실페
			msg="로그인 실패";
		}
			System.out.println(msg);
			request.setAttribute("msg", msg);
			String loc="/";
			request.setAttribute("loc", loc);
			
			response.sendRedirect(request.getContextPath());
		
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
