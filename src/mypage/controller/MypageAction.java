package mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractAction;
import common.util.CommonUtil;
import member.model.MemberVO;
import mypage.model.MypageDAO;

public class MypageAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		HttpSession ses = req.getSession(); 
		MemberVO currentUser = (MemberVO)ses.getAttribute("loginUser");
		
		if(currentUser==null) {
			ses.invalidate();
			this.setRedirect(false);
			this.setViewPage(CommonUtil.addMsgLoc(req, "세션만료!!", req.getContextPath()+"/login.do"));
		}else {
			MypageDAO dao = new MypageDAO();
			MemberVO myInfo = dao.getMyInfo(currentUser.getEmail());
			req.setAttribute("myInfo", myInfo);
			this.setRedirect(false);
			this.setViewPage("/myinfo.jsp");
		}
	}
}
