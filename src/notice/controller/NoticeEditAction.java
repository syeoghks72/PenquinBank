package notice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import common.util.CommonUtil;
import notice.model.FileInfoVO;
import notice.model.NoticeDAOMyBatis;
import notice.model.NoticeVO;

public class NoticeEditAction extends AbstractAction {

	@Override	//수정처리
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//글번호 받아오기
		String nnum=req.getParameter("nnum");
		String title=req.getParameter("title");
		String fnum=req.getParameter("fnum");
		String fname=req.getParameter("fname");
		String fsize=req.getParameter("fsize");
		String contents=req.getParameter("contents");
		System.out.println(contents+"EditAction에서의 contents값");
		System.out.println("nnum==>"+nnum);
		if(nnum==null) {
			String view=CommonUtil.addMsgBack(req, "잘못 들어온 경로입니다.");
			this.setViewPage(view);
			this.setRedirect(false);
			return;
		}
		NoticeDAOMyBatis dao=new NoticeDAOMyBatis();
		NoticeVO notice=dao.getNotice(nnum);
		FileInfoVO fileinfo=dao.getFileInfo(nnum);
		req.setAttribute("fnum", fnum);
		req.setAttribute("fname", fname);
		req.setAttribute("fsize", fsize);
		req.setAttribute("nnum", nnum);
		req.setAttribute("title", title);
		req.setAttribute("notice", notice); //req에 해당글 저장
		req.setAttribute("fileinfo",fileinfo);
		req.setAttribute("contents", contents);
		this.setViewPage("notice/noticeEdit.jsp");
		this.setRedirect(false);
	}

}
