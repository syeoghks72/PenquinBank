package notice.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import notice.model.FileInfoVO;
import notice.model.NoticeDAOMyBatis;
import notice.model.NoticeVO;

public class NoticeViewAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//1.글 번호 받기
		String nnumStr=req.getParameter("nnum");
		String fnum=req.getParameter("fnum");
		System.out.println("nnum="+nnumStr);
		String fname=req.getParameter("fname");
		//2. 유효성 체크
		/*
		 * if(nnumStr==null||nnumStr.trim().isEmpty()) {
		 * this.setViewPage("noticeList.do"); this.setRedirect(true); return; }
		 */
		NoticeDAOMyBatis dao=new NoticeDAOMyBatis();
		//3. DAO의 메소드 호출
		// -1) 조회수 증가하는 메소드를 호출해야함
		boolean bool=dao.updateReadnum(nnumStr);
		// -2) 상세 글 내용 가져오는 메소드 호출 
		NoticeVO notice=dao.getNotice(nnumStr);
		System.out.println("notice===>"+notice);
		List<FileInfoVO> fileinfo=dao.getFileList(nnumStr);
		
		
		//4. req에 저장
		req.setAttribute("notice",notice);
		req.setAttribute("fileList", fileinfo);
		req.setAttribute("fnum", fnum);
		req.setAttribute("fname", fname);
		//5. 뷰페이지 지정, 이동방식 지정
		this.setViewPage("/notice/noticeView.jsp");
		this.setRedirect(false);
		
	}

}
