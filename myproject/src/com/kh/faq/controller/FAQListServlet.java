package com.kh.faq.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.faq.model.service.FAQService;
import com.kh.faq.model.vo.FAQ;

/**
 * Servlet implementation class FAQListServlet
 */
@WebServlet("/faq/faqList")
public class FAQListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset:UTF-8");
		
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
			
		} catch(NumberFormatException e) {
			cPage=1;
		}
		
		int numPerPage = 5;
		List<FAQ> list = new FAQService().searchFAQ(cPage, numPerPage);
		
		
		//pageBar 
		int totalFAQ = new FAQService().faqCount();
		int totalPage = (int)Math.ceil((double)totalFAQ/numPerPage);
		
		int pageBarSize = 5;
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		
		int pageEnd = pageNo + pageBarSize-1;
		
		String pageBar = "";
		
		if(pageNo==1) {
			pageBar+="<span>[이전]</span>";
		} else {
			pageBar+="<a href='"+request.getContextPath()+"/faq/faqList?cPage="+(pageNo-1)+"'>[이전]</a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar += "<span>"+pageNo+"</span>";
			} else {
				pageBar += "<a href='"+request.getContextPath()+"/faq/faqList?cPage="+(pageNo)+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		} else {
			pageBar+="<a href='"+request.getContextPath()+"/faq/faqList?cPage="+(pageNo)+"'>[다음]</a>";
		}
		
		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
		request.getRequestDispatcher("/views/faq/faqList.jsp").forward(request, response);
	
	}
	

	
	
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
