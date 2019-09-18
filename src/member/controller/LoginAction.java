package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import common.util.CommonUtil;

public class LoginAction extends AbstractAction {	
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		this.setViewPage("/login.jsp");
		this.setRedirect(false);
	}
}
