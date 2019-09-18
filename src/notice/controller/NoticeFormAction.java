package notice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;

public class NoticeFormAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//뷰페이지 지정
		//noticeForm.do===>notice/noticeWrite.jsp보여주도록 설정
		this.setViewPage("/notice/noticeWrite.jsp");
		//이동방식 지정
		this.setRedirect(false);//forward방식으로 이동 엥간하면 forward쓴다고 보면댐
	}

}
