package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractAction;
import common.util.CommonUtil;
import member.model.MemberDAO;
import member.model.MemberVO;

public class LoginEndAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String userId = req.getParameter("userId");
		String userPwd = req.getParameter("userPwd");
		
		if (req.getMethod().equalsIgnoreCase("get")) {
			this.setViewPage(CommonUtil.addMsgLoc(req, "잘못된 경로!!", req.getContextPath() + "/main.do"));
			this.setRedirect(false);
			return;
		}
		
		if(userId == null || userPwd == null || userId.trim().isEmpty() || userPwd.trim().isEmpty()) {
			String loc = "main.do";
			String viewPage = CommonUtil.addMsgLoc(req, "잘못 들어온 경로입니다.", loc);
			this.setViewPage(viewPage);
			this.setRedirect(false);
			return;
		}
		
		MemberVO member = new MemberVO(userId, userPwd, null, null, null);
		MemberDAO dao = new MemberDAO();
		
		Boolean idCheck = dao.memberCheck(member);
		if(!idCheck) {
			req.setAttribute("failId", member.getEmail());
			this.setViewPage(CommonUtil.addMsgBack(req, "로그인 실패!!"));
			this.setRedirect(false);
			return; 
		}
		
		//로그인 인증을 받았다면 해당 회원정보를 세션에 저장한다.
		HttpSession ses = req.getSession();
		ses.setAttribute("loginUser", member);
		
		//세션에 돌아갈 페이지가 저장되어 있는지 꺼내보자.
		//있으면 해당 페이지로 돌아가고, 없으면 main.do로 돌아가자
		String returnPage = (String)ses.getAttribute("returnPage");
		ses.removeAttribute("returnPage");
		
		if(returnPage == null) {
			this.setViewPage("main.do");
		}else {
			this.setViewPage(returnPage);
		}
		this.setRedirect(true);
	}
}
