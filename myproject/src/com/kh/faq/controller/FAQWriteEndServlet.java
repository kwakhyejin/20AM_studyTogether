package com.kh.faq.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.faq.model.service.FAQService;
import com.kh.faq.model.vo.FAQ;

/**
 * Servlet implementation class FAQWriteEndServlet
 */
@WebServlet("/faq/faqWriteEnd")
public class FAQWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
//		if(!ServletFileUpload.isMultipartContent(request)) {
//			request.setAttribute("msg", "게시판 작성 오류! 관리자에게 문의하세요!");
//			request.setAttribute("loc", "/faq/faqWrite");
//			request.getRequestDispatcher("/views/common.msg.jsp").forward(request, response);
//		}
//		
//		String path = getServletContext().getRealPath("/upload/faq/");
//		
//		int maxSize = 1024*1024*30;
//		
//		MultipartRequest mr = new MultipartRequest(request, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
//		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("title");
		String category = request.getParameter("category");
		String content = request.getParameter("content");
		
		FAQ f = new FAQ(0, title, category, content, null, null);
		
		
		int result = new FAQService().insertFaq(f);
		
		String msg = "";
		String loc = "";
		if(result>0) {
			msg = "FAQ 작성 성공!";
			loc = "/faq/faqList";
					
		} else {
			msg = "FAQ 작성 실패!";
			loc = "/faq/faqWrite";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
