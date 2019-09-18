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
			this.setViewPage(CommonUtil.addMsgLoc(req, "�߸��� ���!!", req.getContextPath() + "/main.do"));
			this.setRedirect(false);
			return;
		}
		
		if(userId == null || userPwd == null || userId.trim().isEmpty() || userPwd.trim().isEmpty()) {
			String loc = "main.do";
			String viewPage = CommonUtil.addMsgLoc(req, "�߸� ���� ����Դϴ�.", loc);
			this.setViewPage(viewPage);
			this.setRedirect(false);
			return;
		}
		
		MemberVO member = new MemberVO(userId, userPwd, null, null, null);
		MemberDAO dao = new MemberDAO();
		
		Boolean idCheck = dao.memberCheck(member);
		if(!idCheck) {
			req.setAttribute("failId", member.getEmail());
			this.setViewPage(CommonUtil.addMsgBack(req, "�α��� ����!!"));
			this.setRedirect(false);
			return; 
		}
		
		//�α��� ������ �޾Ҵٸ� �ش� ȸ�������� ���ǿ� �����Ѵ�.
		HttpSession ses = req.getSession();
		ses.setAttribute("loginUser", member);
		
		//���ǿ� ���ư� �������� ����Ǿ� �ִ��� ��������.
		//������ �ش� �������� ���ư���, ������ main.do�� ���ư���
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
