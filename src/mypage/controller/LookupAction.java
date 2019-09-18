package mypage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import account.model.AccountVO;
import common.controller.AbstractAction;
import common.util.CommonUtil;
import member.model.MemberVO;
import mypage.model.MypageDAO;

public class LookupAction extends AbstractAction {

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
			List<AccountVO> accountList = dao.getAccountList(currentUser.getEmail());
			req.setAttribute("accountList", accountList);
			for(int i = 0 ; i < accountList.size() ; i++) {
				System.out.println(accountList.get(i).toString());
			}
			this.setRedirect(false);
			this.setViewPage("/lookup.jsp");
		}

	}
}
