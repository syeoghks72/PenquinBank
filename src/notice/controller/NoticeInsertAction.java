package notice.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.controller.AbstractAction;
import notice.model.FileInfoVO;
import notice.model.NoticeDAOMyBatis;
import notice.model.NoticeVO;

public class NoticeInsertAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//1.파일 업로드 처리
		// 업로드 할 디렉토리의 절대경로 얻기
		// MyMVC/notice/Upload
		//[JSP내장객체 사용할때] - String upDir=application.getRealPath("/notice/Upload");
		ServletContext app=req.getServletContext();//어플리케이션 내장객체임
		String upDir=app.getRealPath("/notice/Upload");
		System.out.println(upDir);
		File dir=null;
		if(upDir==null) {
			dir=new File(app.getRealPath("/")+File.pathSeparator+"notice/Upload");
			// getRealPath => 서버웹 내에있는 디렉토리에있는 절대경로를 얻어옴
		}else {
			dir=new File(upDir);
		}
		
		if(!dir.exists()) {
			dir.mkdirs(); //디렉토리 만들기
		}
		//2. MultipartRequest생성하면 자동으로 업로드
		// Tomcat 8.5/lib/cos.jar 라이브러리에 있음
		MultipartRequest mr=new MultipartRequest(req,upDir,
				10*1024*1024,"UTF-8",new DefaultFileRenamePolicy());
		
		System.out.println("업로드 성공");
		
		//사용자가 입력한 파라미터 값 받아서 데이터베이스 테이블에 insert
		//request를 MultipartRequest가 가져가기 때문에 사용자가 입력한 값을
		//mr(MultipartRequest)을 통해 받아와야 함
		String title=mr.getParameter("title");
		System.out.println("title==="+title);
		String contents=mr.getParameter("contents");
		String fname=mr.getFilesystemName("fname");
		String nnum=mr.getParameter("nnum");
		String ndate=mr.getParameter("ndate");
		String vnum=mr.getParameter("vnum");
		

		File file=mr.getFile("fname");
		long fsize=(file!=null)?file.length():0;//첨부파일 크기
		
		NoticeVO notice
		=new NoticeVO(nnum,title,contents,vnum,ndate,null);
		
		FileInfoVO fileInfo
		=new FileInfoVO(null,fname,fsize,null,null);
		
		NoticeDAOMyBatis dao=new NoticeDAOMyBatis();
		
		int n=0;

		n=dao.insert(notice, fileInfo);
		
		String str=(n>0)?"글쓰기 성공":"글쓰기 실패";
		String loc=(n>0)?"noticeList.do":"javascript:history.back()";
		req.setAttribute("msg", str);
		req.setAttribute("loc", loc);
		this.setViewPage("noticeList.do");
		this.setRedirect(true);
		
	}

}
