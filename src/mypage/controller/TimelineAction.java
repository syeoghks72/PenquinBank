package mypage.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractAction;
import common.util.CommonUtil;
import member.model.MemberVO;
import mypage.model.MypageDAO;
import mypage.model.TimeLineVO;

public class TimelineAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession ses = req.getSession(); 
		MemberVO currentUser = (MemberVO)ses.getAttribute("loginUser");
		
		if(currentUser==null) {
			ses.invalidate();
			this.setRedirect(false);
			this.setViewPage(CommonUtil.addMsgLoc(req, "技记父丰!!", req.getContextPath()+"/login.do"));
			return;
		}
		String dateString = req.getParameter("StringDate");
		String beforeYear = req.getParameter("beforeYear");
		Map<String, Object> valueMap = new HashMap<String, Object>();
		
		valueMap.put("email", currentUser.getEmail());
		if(beforeYear!=null) {
			valueMap.put("beforeYear",beforeYear);
			valueMap.put("date", dateString);
		}
		else if(dateString!=null && beforeYear==null) {
			valueMap.put("date", dateString);
		}
		else if(dateString==null){
			SimpleDateFormat dateFormat = new SimpleDateFormat("yy/MM");
			valueMap.put("date", dateFormat.format(new Date()));
			dateString = dateFormat.format(new Date());
		}
		
		MypageDAO dao = new MypageDAO();
		List<TimeLineVO> timelineList = dao.getTimelineList(valueMap);
				
		
		for(int i = 0 ; i < timelineList.size() ; i++) {
			System.out.println("咯变单 : " + timelineList.get(i).toString());
		}
		
		req.setAttribute("StringDate", dateString);
		req.setAttribute("beforeYear", beforeYear);
		req.setAttribute("timeLineList", timelineList);
	
		this.setRedirect(false);
		this.setViewPage("/timeline.jsp");
	}
}
