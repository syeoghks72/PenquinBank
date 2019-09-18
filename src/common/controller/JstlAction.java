package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class JstlAction extends AbstractAction {

	public JstlAction() {
		
	}

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setAttribute("val", "Test Value");
		req.setAttribute("ifval", "123");
		this.setViewPage("/jstl.jsp");
		this.setRedirect(false); 
	}
}
