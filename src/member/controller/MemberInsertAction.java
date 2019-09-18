package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import member.model.MemberDAO;
import member.model.MemberVO;

public class MemberInsertAction extends AbstractAction {

	public MemberInsertAction() {
		
	}

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
//		MemberDAO dao = new MemberDAO();
//		MemberVO member = new MemberVO("하위", "222", "최소영", "010-2343-3315");
//		int n = dao.insertMember(member);
//		
//		String msg = (n>0) ? "인서트 성공" : "인서트 실패";
//		System.out.println("결과  : " + msg);
		
	}

}
