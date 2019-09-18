package notice.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.controller.AbstractAction;
import common.util.CommonUtil;
import notice.model.FileInfoVO;
import notice.model.NoticeDAOMyBatis;
import notice.model.NoticeVO;

public class NoticeEditEndAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//1.파일 업로드 처리
		//(기존에 업로드한 파일이 있다면 삭제 후 업로드 처리)
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
		
		String nnum=mr.getParameter("nnum"); //수정할 글번호 받기
		String title=mr.getParameter("title");
		String contents=mr.getParameter("contents");
		String vnum=mr.getParameter("vnum");
		String ndate=mr.getParameter("ndate");
		String fnum=mr.getParameter("fnum");
		//첨부파일명 얻기 => getParameter()로 얻어오면 안돼!(주의하라규!!)
		//getFilesystemName("파라미터명")으로 얻어와야 함
		String filename=mr.getFilesystemName("fname");
		File file=mr.getFile("fname");
		long fsize=(file!=null)?file.length():0;//첨부파일 크기
		//새로 첨부한 파일이 있다면, 기존에 업로드했던 파일을 삭제 처리하자.
		String oldfile=mr.getParameter("oldfile");
		if(filename!=null) {
			//hidden으로 가지고 있는 기존 파일명을 가져와 삭제 처리한다.
			
			System.out.println("oldfile="+oldfile);
			if(oldfile!=null && !oldfile.trim().isEmpty())
			{
				//삭제 처리
				File delFile=new File(upDir+File.separator+oldfile);
				if(delFile.exists()) {
					boolean b=delFile.delete();
					System.out.println("파일 삭제 여부: "+b);
				}
			}
		}
		NoticeDAOMyBatis dao=new NoticeDAOMyBatis();
		
		NoticeVO notice = new NoticeVO(nnum,title,contents,vnum,ndate,null);
		int n=dao.updateNotice(notice);
		
		FileInfoVO fileinfo
		=new FileInfoVO(fnum,filename,fsize,null,nnum);
		if(filename!=null&& oldfile!=null && !oldfile.trim().isEmpty()) {
			int m=dao.updateFileInfo(fileinfo);
		}else if(filename!=null && (oldfile==null||oldfile.trim().isEmpty())) {
			int m=dao.insertFileInfo(fileinfo);
		}
		req.setAttribute("contents", contents);
		String str=(n>0)? "글수정 성공":"글수정 실패";
		
		String loc=(n>0)? "noticeList.do":"javascript:history.back()";
		
		String view=CommonUtil.addMsgLoc(req, str, loc);
		this.setViewPage(view);
		this.setRedirect(false);
		
	}

}
