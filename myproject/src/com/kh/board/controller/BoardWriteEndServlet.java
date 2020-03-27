package com.kh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class BoardWriteEndServlet
 */
@WebServlet("/board/boardWriteEnd")
public class BoardWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int fileCnt;
		if(!ServletFileUpload.isMultipartContent(request)) {
			response.sendRedirect("/");
			return;
		}
		//저장 경로
		String path=getServletContext().getRealPath("/upload/board/");
		//파일 저장 크기
		int maxSize=1024*1024*10;//10MB
		MultipartRequest mr=new MultipartRequest(request, path, maxSize,
				"UTF-8",new DefaultFileRenamePolicy());
		fileCnt = Integer.parseInt(mr.getParameter("fileCnt"));
		String title=mr.getParameter("title");
		String write_text=mr.getParameter("write_text");
		String oriFileName[]= new String[fileCnt];
		for(int i=0;i<fileCnt;i++) {
			oriFileName[i]=mr.getOriginalFileName("fileup"+(i+1));			
		}
		response.sendRedirect(request.getContextPath()+"/board/boardList");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
