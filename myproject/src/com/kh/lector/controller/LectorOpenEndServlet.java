package com.kh.lector.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.lector.model.service.LectorService;
import com.kh.lector.model.vo.Lector;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class LectorOpenEndServlet
 */
@WebServlet("/lector/lectorOpenEnd")
public class LectorOpenEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectorOpenEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//파일 업로드하기(lib cos.jar추가 form태그안에 enctype="multipart/form-data 삽입)
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "업로드에러 [form:enctype 관리자에게 문의] ");
			request.setAttribute("loc", "/lector/lectorOpen");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request,response );
		}
		String path=getServletContext().getRealPath("/upload/lector/");
		int maxSize=1024*1024*30;
		MultipartRequest mr=new MultipartRequest(request,path,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		String title=mr.getParameter("lectorTitle");
		String writer=mr.getParameter("lectorWriter");
		String category=mr.getParameter("searchType");
		String intro=mr.getParameter("intro");
		int price=0;
		if(mr.getParameter("price")!=null&&mr.getParameter("price")!="") {
			price=Integer.parseInt(mr.getParameter("price"));
		}
		
		String oriFileName=mr.getOriginalFileName("lectorImg");
		String renamedFileName=mr.getFilesystemName("lectorImg");
		String oriVideo=mr.getOriginalFileName("lectorVideo");
		String renamedVideo=mr.getFilesystemName("lectorVideo");

		Lector l=new Lector(0,title,writer,category,intro,price,oriFileName,renamedFileName,oriVideo,renamedVideo,null,"Y");
		int result=new LectorService().insertLector(l);

		String msg="";
		String loc="";
		
		if(result>0) {
			msg="등록 완료";
			loc="/lector/lectorList";
		}
		else {
			msg="등록 실패";
			loc="/lector/lectorOpen";
			
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
