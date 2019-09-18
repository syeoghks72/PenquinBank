package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;

public class HelloAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("HelloAction ");
		req.setAttribute("msg", "HelloAction? ≈Õ«„¿Ã~~");
		this.setViewPage("/hello.jsp");
		this.setRedirect(false); 
	}

}
