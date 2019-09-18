package notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import notice.model.NoticeDAOMyBatis;
import notice.model.NoticeVO;
import common.controller.AbstractAction;

public class NoticeListAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//세션 얻어오기
		HttpSession ses=req.getSession();
		//현재 보여줄 페이지값 받기
		String cpStr=req.getParameter("cpage");
		if(cpStr==null||cpStr.trim().isEmpty()) {
			cpStr="1";
		}
		int cpage=Integer.parseInt(cpStr.trim());
		
		String psStr=req.getParameter("pageSize");
		if(psStr==null) {
			//세션에 저장된 pageSize가 있는지 체크
			psStr=(String)ses.getAttribute("pageSize");
			if(psStr==null) {
				psStr="10";//디폴트 페이지를사이즈를 10개로 지정
			}
		}
		int pageSize=Integer.parseInt(psStr);
		ses.setAttribute("pageSize", psStr);
		
		//검색어 받기
		String findType=req.getParameter("findType");
		String findKeyword=req.getParameter("findKeyword");
		
		Map<String, String> map=new HashMap<>();
		map.put("findType",findType);
		map.put("findKeyword", findKeyword);
		
		
		//총 게시글 수 구하기
		NoticeDAOMyBatis dao=new NoticeDAOMyBatis();
		int totalCount=dao.getTotalCount(); //검색유형 , 검색어
		
		int pageCount=(totalCount-1)/pageSize+1;
		
		if(cpage<=0) {
			cpage=1;
		}
		if(cpage>pageCount) {
			cpage=pageCount;
		}
		int end=cpage*pageSize;
		int start=end-(pageSize-1);
		//페이지 블럭 처리 관련 (이전이후처리)
		/*[1][2][3][4][5] | [6][7][8][9][10] | [11][12]...........
		 * cpage		pagingBlock			prevBlock		nextBlock
		 * 1~4,5			5개 					0				6
		 * 6~9,10			5개					5				11
		 * 11~14,15			5개					10				16
		 * 
		 * prevBlock=(cpage-1)/pagingBlock*pagingBlock;
		 * nextBlock= prevBlock+(pagingBlock+1);
		 * */
		int pagingBlock=10;//10개 단위로 페이지 묶음 처리
		int prevBlock=(cpage-1)/pagingBlock*pagingBlock;
		int nextBlock=prevBlock+(pagingBlock+1);
				
		//넘겨야 할게 많을때는 map을 이용
	
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
	
		
		List<NoticeVO> arr=dao.listNotice(map);
		//MyBatis테스트
		//int count=dao.getCount();
		req.setAttribute("noticeArr", arr);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("cpage", cpage);
		req.setAttribute("pagingBlock", pagingBlock);
		req.setAttribute("prevBlock", prevBlock);
		req.setAttribute("nextBlock", nextBlock);
		req.setAttribute("findType", findType);
		req.setAttribute("findKeyword", findKeyword);
		//req.setAttribute("count",count);
		
		this.setViewPage("notice/noticeList2.jsp");
		this.setRedirect(false);
		//테이블 수를 가져오는지 확인하는것
	}

}
