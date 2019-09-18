package account.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import account.model.AccountDAO;
import account.model.AccountVO;
import common.controller.AbstractAction;
import member.model.MemberVO;
import net.sf.json.JSONObject;

public class SendMoneyCheckAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String myAccount = req.getParameter("myAccount");
		String accountPassword = req.getParameter("accountPassword");
		String yourAccount = req.getParameter("userAccount");
		String yourBankName = req.getParameter("bankId");
		
		AccountVO myAccountVO = new AccountVO(myAccount, null, accountPassword, null, null, null);
		AccountVO yourAccountVO = new AccountVO(yourAccount, null, null, yourBankName, null, null);
		
		AccountDAO dao = new AccountDAO();

		MemberVO myInfo = dao.getMyAccount(myAccountVO);
		MemberVO yourInfo = dao.getYourAccount(yourAccountVO);
		Map<String, MemberVO> map=new HashMap<>();
		map.put("myInfo",myInfo);
		map.put("yourInfo",yourInfo);
		
		req.setAttribute("info",JSONObject.fromObject(map));
		this.setRedirect(false);
		this.setViewPage("/accountCheck.jsp");		
	}
}
