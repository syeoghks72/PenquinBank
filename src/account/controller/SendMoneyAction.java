package account.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import account.model.AccountDAO;
import account.model.AccountVO;
import common.controller.AbstractAction;
import common.util.CommonUtil;
import member.model.MemberVO;

public class SendMoneyAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession ses = req.getSession();
		MemberVO memberVO  = (MemberVO)ses.getAttribute("loginUser");
		
		if(memberVO==null) {
			ses.setAttribute("returnPage", "sendMoney.do");
			this.setViewPage(CommonUtil.addMsgLoc(req, "로그인이 필요합니다.", "login.do"));
			this.setRedirect(false);
			return;
		}
		
		AccountDAO dao = new AccountDAO();
		List<AccountVO> accountVOList = dao.getAccountList(memberVO.getEmail());
		req.setAttribute("accountList", accountVOList);
		this.setViewPage("/sendMoney.jsp");
		this.setRedirect(false);
	}
}
