package notice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;

public class NoticePwdAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//유효성 체크 파라미터가 post방식이 아니라면리턴
		if(!req.getMethod().equalsIgnoreCase("post")) {
			this.setRedirect(true); //포스트방식이 아닌 직접 치고 들어온경우는 돌려보냄
			this.setViewPage("noticeList.do");
			return;
			
		}
		
		//파라미터 받아오기
		String nnum=req.getParameter("nnum");
		String mode=req.getParameter("mode");
		
		int md=Integer.parseInt(mode);
		String title="";
		if(md==1) {
			title="글 편집";
		}else if(md==2) {
			title="글 삭제";
		}
		//request에 저장
		req.setAttribute("nnum", nnum);
		req.setAttribute("mode", mode);
		req.setAttribute("title", title);
		//비밀번호 입력받는 페이지로 이동
		this.setViewPage("notice/noticePwd.jsp");
		this.setRedirect(false);
	}

}
