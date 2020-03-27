package com.kh.lector.controller;

import java.io.File;
import java.io.IOException;

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
 * Servlet implementation class LectorUpdateEndServlet
 */
@WebServlet("/lector/lectorUpdateEnd")
public class LectorUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectorUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "공지사항 수정 오류![form:enctype 관리자에게 물어보세요]");
			request.setAttribute("loc", "/");//메인
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		String path=getServletContext().getRealPath("/upload/lector/");
		int maxSize=1024*1024*10;
		
		MultipartRequest mr=new MultipartRequest(request,path,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		
		int no=Integer.parseInt(mr.getParameter("no"));
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


		
		Lector l=new Lector(no,title,writer,category,intro,price,oriFileName,renamedFileName,oriVideo,renamedVideo,null,null);
		System.out.println(l);
		//upfile새로 추가한 파일이 있으면 orifile삭제해야함
		java.io.File f=mr.getFile("lectorImg");
		
		if(f!=null&&f.length()>0) {
			File deleteFile=new File(path+mr.getParameter("lectorImg1"));
			boolean flag=deleteFile.delete();
			System.out.println(flag?"파일삭제성공":"파일삭제실패");
		}else {
			l.setLectorOriginalImg(mr.getParameter("lectorImg1"));
		}
		
		int result=new LectorService().updateLector(l);
		
		String msg="";
		String loc="/lector/lectorWatch?no="+mr.getParameter("no");
		//jsp 안받아도 들어가나?
		
		if(result>0) {
			msg="수정이 완료되었습니다.";
		}else {
			msg="수정을 실패하였습니다.";
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
