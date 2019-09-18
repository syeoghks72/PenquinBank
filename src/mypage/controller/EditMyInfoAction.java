package mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractAction;
import common.util.CommonUtil;
import member.model.MemberVO;
import mypage.model.MypageDAO;

public class EditMyInfoAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			this.setRedirect(false);
			this.setViewPage(CommonUtil.addMsgBack(req, "잘못된 경로 접근!!"));
			return;
		}
		String name = req.getParameter("userName");
		String phone = req.getParameter("userPhone");
		String password = req.getParameter("userPwdChange");
		System.out.println("name : " + name);
		System.out.println("phone : " + phone);
		System.out.println("password : " + password);
		if(name==null || phone==null || password==null 
				|| name.trim().isEmpty() || phone.trim().isEmpty() || password.trim().isEmpty()) {
			this.setRedirect(false);
			this.setViewPage(CommonUtil.addMsgLoc(req, "변경할 내용을 전부 입력하세요!!",req.getContextPath()+"/myPage.do"));
			return;
		}
		HttpSession ses = req.getSession();
		MemberVO currentUser = (MemberVO)ses.getAttribute("loginUser");
		currentUser.setName(name);
		currentUser.setPhone(phone);
		currentUser.setPassword(password);
		
		MypageDAO dao = new MypageDAO();
		Boolean editCheckBln = dao.editMyInfo(currentUser);
		
		this.setRedirect(false);
		if(editCheckBln) this.setViewPage(CommonUtil.addMsgLoc(req, "수정성공!!", req.getContextPath()+"/myPage.do"));
		else this.setViewPage(CommonUtil.addMsgLoc(req, "수정실패!!",req.getContextPath()+"/myPage.do"));
	}
}
