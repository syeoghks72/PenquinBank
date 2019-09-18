package notice.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;

public class FileDownAction extends AbstractAction {
	private static final long serialVersionUID = 1L;
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		//1. 다운로드할 파일명 받기
		String fname = req.getParameter("filename");
		System.out.println("fname = " + fname);
		
		//2. 업로드 디렉토리의 절대경로 얻기
		//jsp에서는 application.getRealPath("/UpLoad");
		ServletContext application = req.getServletContext();
		String upDir = application.getRealPath("/notice/Upload");
	
		
		//3. 절대경로 만들기
		String path = upDir+File.separator +fname;
		System.out.println(path);
		
		/*	클라이언트쪽에 파일 다운로드 창을 띄우자.
		 *  response 헤더에 컨텐트 타입을 지정하는데
		 *  브라우저는 컨텐트타입을 알 수 있는 형식이면 파싱해서 보여주고,
		 *  잘 모르는 형식이면 다운로드창을 띄운다.
		 * */
		
		//res.setContentType("application/unknown");
		res.setContentType("applcation/octet-stream"); //응용프로그램 형식으로 지정
		//한글파일명이 깨지는 것을 막기위해
		String fname_en = new String(fname.getBytes(),"ISO-8859-1");
		//다운로드 창을 실행시킴
		String arg1 = "attachment; filename=" + fname_en;
		//res헤더에 다운로드할 파일명을 지정
		res.setHeader("Content-Disposition", arg1);
		
		
		//4. 스트림 연결해서 읽고 브라우저 통해서 내보댄다.
		//데이터 소스 : (파일->path)-> FileInputStream -> BufferedInputStream
		//데이터 목적지 : 클라이언트 (브라우저-response) -> ServeltOutputStream->
		//					BufferdOutputStream
		
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(path));
		BufferedOutputStream bos = new BufferedOutputStream(res.getOutputStream());
		
		byte[] data = new byte[4000];
		int n = 0;
		while((n=bis.read(data))!=-1) {
			bos.write(data,0,n);
			bos.flush();
		}
		bos.close();
		bis.close();
	}

}
