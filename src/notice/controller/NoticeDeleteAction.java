package notice.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import common.util.CommonUtil;
import notice.model.FileInfoVO;
import notice.model.NoticeDAOMyBatis;
import notice.model.NoticeVO;

public class NoticeDeleteAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String nnum=req.getParameter("nnum");
		
		//유효성 체크
		if(nnum==null) {
			this.setViewPage("noticeList.do");
			this.setRedirect(true);
			return;
		}
		NoticeDAOMyBatis dao=new NoticeDAOMyBatis();
		NoticeVO dbNotice=dao.getNotice(nnum);
		List<FileInfoVO> fiNoticeArr=dao.getFileList(nnum);
		if(fiNoticeArr!=null) {
			for(FileInfoVO fiNotice:fiNoticeArr) {
				long fsize=fiNotice.getFsize();
				if(fsize!=0) {
					// fsize>0 : 첨부파일이 있는 경우
					String fname=fiNotice.getFname();
					System.out.println(fname);
					ServletContext app=req.getServletContext(); 
					String upDir=app.getRealPath("/notice/Upload"); //서버에 업로드된 절대 경로 얻어오기
					System.out.println(upDir);
					File delFile=new File(upDir+File.separator+fname);
					//System.out.println(delFile.getAbsolutePath());
					if(delFile.exists()) {
						boolean b=delFile.delete();//서버에서 삭제처리
						dao.deleteFileinfo(nnum);//db에서 삭제처리
						System.out.println("삭제 처리 여부: "+b);
					}
				}//if---------------------------
			}
		}
		//int n=dao.deleteFileinfo(nnum);
		//int m=dao.deleteNotice(nnum);
		int n=dao.delete(dbNotice);
		
		String str=(n>0)?"삭제 성공":"삭제 실패";
		String loc=(n>0)?"noticeList.do":"javascript:history.back()";
		String view=CommonUtil.addMsgLoc(req, str, loc);
		this.setViewPage(view);
		this.setRedirect(false);
		
	}

}
