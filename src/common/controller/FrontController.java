package common.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
		urlPatterns = { "*.do" }, 
		initParams = { 
				@WebInitParam(name = "config", value = "C:\\spring_workspace\\steve_workspace\\PenquinBank\\WebContent\\WEB-INF\\Command.properties")
		})
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> cmdMap = new HashMap<>();
	

	public void init(ServletConfig conf) throws ServletException {
		String props = conf.getInitParameter("config");
		System.out.println("init() props=" + props);
		Properties p = new Properties();
		try {
			FileInputStream fis = new FileInputStream(props);
			p.load(fis);
			
			if(fis!=null) fis.close();
			Set<Object> set = p.keySet();
			
			for(Object key : set) {
				String cmd = key.toString(); //key媛� "/hello.do";
				String className = p.getProperty(cmd);
				if(className != null) {
					className = className.trim(); //�븵�뮘 怨듬갚 �젣嫄�
					Class cmdClass = Class.forName(className);
					Object cmdInstance = cmdClass.newInstance();
					cmdMap.put(cmd, cmdInstance);
				}
			}//for-----------
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestProcess(request, response);
	}	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestProcess(request, response);
	}
	
	private void requestProcess(HttpServletRequest req, HttpServletResponse res) throws ServletException {
		String uri = req.getRequestURI();
		System.out.println("uri : " + uri); // "/MyMVC/hello.do"
		String myctx = req.getContextPath(); // "/MyMVC"
		int len = myctx.length(); //6
		String cmd = uri.substring(len); // "/hello.do"
		Object instance = cmdMap.get(cmd); // HelloAction媛앹껜
		if(instance == null) {
			throw new ServletException(cmd + "액션이 널");
		}
		AbstractAction action = (AbstractAction)instance;
		try {
			action.execute(req, res);
			String viewPage = action.getViewPage();
			if(viewPage==null) {
				viewPage = "test.html";  //현재  test.html없음
			}
			if(action.isRedirect()) {
				res.sendRedirect(viewPage);
			}
			else {
				RequestDispatcher dispatch = req.getRequestDispatcher(viewPage);
				dispatch.forward(req, res);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}
}
