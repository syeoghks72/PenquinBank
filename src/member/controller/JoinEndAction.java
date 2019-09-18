package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import common.util.CommonUtil;
import member.model.MemberDAO;
import member.model.MemberVO;

public class JoinEndAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String userId = req.getParameter("userId");
		String userPwd = req.getParameter("userPwd");
		String userName = req.getParameter("userName");
		String userJumin = req.getParameter("juminNumber");
		String userJuminBack = req.getParameter("userJuminBack");
		String userPhone = req.getParameter("userPhone");

		if (req.getMethod().equalsIgnoreCase("get")) {
			this.setViewPage(CommonUtil.addMsgLoc(req, "잘못된 경로!!", req.getContextPath() + "/main.do"));
			this.setRedirect(false);
			return;
		}

		if (userId == null || userPwd == null || userName == null || userJumin == null || userJuminBack == null|| userPhone == null
				|| userId.trim().isEmpty() || userPwd.trim().isEmpty() || userName.trim().isEmpty()
				|| userJumin.trim().isEmpty() || userJuminBack.trim().isEmpty() || userPhone.trim().isEmpty()) 
		{
			this.setViewPage(CommonUtil.addMsgBack(req, "가입 실패"));
			this.setRedirect(false);
			return;
		}
		
		MemberDAO dao = new MemberDAO();
		MemberVO member = new MemberVO(userId, userPwd, userName, userPhone, userJumin+""+userJuminBack);
		int n = dao.insertMember(member);
		String msg = (n>0) ? "회원가입 성공" : "인서트 실패";
		
		this.setViewPage(CommonUtil.addMsgLoc(req, msg, req.getContextPath() + "/login.do"));
		this.setRedirect(false);

	}
}
