package com.kh.lector.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lector.model.service.LectorService;
import com.kh.lector.model.vo.Lector;

/**
 * Servlet implementation class LectorOpenServlet
 */
@WebServlet("/lector/lectorList")
public class LectorListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectorListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		int cPage;
		
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
			
		}catch(NumberFormatException e) {
			cPage=1;
		}

		/*	1.	cPage : 현재 페이지를 의미(1페이지를 보고있는지 2페이지를 보고있는지)
			2.	numPerPage : 한 개 페이지에 출력될 데이터 수
			3.	totalData : 총 데이터수(총 로우수)
			4.	totalPage : 총 페이지 수 (페이지는 하나의 구역이라고 보면됨)
			5.	pageBarSize : 화면에 출력할 페이지 번호 개수 
			6.	pageNo : 출력할 페이지의 시작번호*/
		int numPerPage=12;
		List<Lector> list=new LectorService().searchLector(cPage,numPerPage);
		
		//pageBar만들기
		int totalLector=new LectorService().lectorCount();
		
		int totalPage=(int)Math.ceil((double)totalLector/numPerPage);
		
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		String pageBar="";
		
		if(pageNo==1) {
			pageBar+="<li class='page-item'><a class='page-link'>이전</a></li>";
			
		}else {
			pageBar+="<a class='page-link' href='"+request.getContextPath()+"/lector/lectorList?cPage="+(pageNo-1)+"'>이전</a>";
		}
		
		while(!(pageNo>pageEnd || pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<li class='page-item'><a class='page-link'  style='background-color: lightblue; color:black; '>"+pageNo+"</a></li>";
			}else {
				pageBar+="<a class='page-link' href='"+request.getContextPath()+"/lector/lectorList?cPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
		
				pageBar+="<li class='page-item'><a class='page-link'>다음</a></li>";
			}else {
				pageBar+="<a class='page-link' href='"+request.getContextPath()+"/lector/lectorList?cPage="+(pageNo)+"'>다음</a>";
			}
		
		request.setAttribute("totalLector", totalLector);
		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);

		RequestDispatcher rd=request.getRequestDispatcher("/views/lector/lectorList.jsp");
		rd.forward(request, response);
	}	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
