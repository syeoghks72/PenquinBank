package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import member.model.MemberDAO;

public class IdDuplicateCheckAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		MemberDAO dao = new MemberDAO();
		req.setAttribute("isIdCheck", dao.idDuplicateCheck(req.getParameter("checkemail")));
		this.setViewPage("/IdDuplicateCheck.jsp");
		this.setRedirect(false);
	}
}
