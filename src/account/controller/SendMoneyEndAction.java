package account.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import account.model.AccountDAO;
import account.model.AccountVO;
import common.controller.AbstractAction;
import common.util.CommonUtil;
import member.model.MemberVO;

public class SendMoneyEndAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		if(req.getMethod().equalsIgnoreCase("get")){
			this.setRedirect(false);
			this.setViewPage(CommonUtil.addMsgBack(req, "�߸��� ��� ����!!"));
			return;
		}
		
		
		String myAccount = req.getParameter("myAccount");
		String yourAccount = req.getParameter("userAccount");
		String accountPassword = req.getParameter("accountPassword");
		String sendMoney = req.getParameter("txtMoney");
		String yourBankName = req.getParameter("bankId");
		
		AccountVO myAccountVO = new AccountVO(myAccount, null, accountPassword, null, null, null);
		AccountVO yourAccountVO = new AccountVO(yourAccount, null, null, yourBankName, null, null);
		
		AccountDAO dao = new AccountDAO();
		
		MemberVO myInfo = dao.getMyAccount(myAccountVO);
		MemberVO yourInfo = dao.getYourAccount(yourAccountVO);
		
		int myMoney = Integer.parseInt(myInfo.getAccountList().get(0).getMoney());
		String parseSendMoney = sendMoney.replaceAll(",", "");
		int parseIntSendMoney = Integer.parseInt(parseSendMoney);
		
		Boolean sendSuccessBln = false; //�۱� �������� �ƴ��� �Ǻ��ϴ� ����
		if(myMoney>=parseIntSendMoney && myInfo!=null && yourInfo!=null) {
			sendSuccessBln = dao.SendMoney(myInfo, yourInfo, parseSendMoney);
		}
		else {
			//�ܾ� ���� �� ������ȸ ����
		}
		
		if(sendSuccessBln) {
			this.setRedirect(false);
			this.setViewPage(CommonUtil.addMsgLoc(req, "�۱ݼ���!!", req.getContextPath()+"/main.do"));
		}else {
			this.setRedirect(false);
			this.setViewPage(CommonUtil.addMsgBack(req, "�۱� ����!!"));
		}	
	}
}
