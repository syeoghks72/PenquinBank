package mypage.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import account.model.AccountVO;
import common.util.DAOBase;
import member.model.MemberVO;

public class MypageDAO extends DAOBase{
	private final String NS = "mypage.model.MypageMapper";
	private SqlSession ses;
	public MypageDAO() {
		
	}
	
	public MemberVO getMyInfo(String email) {
		try {
			ses = this.getSessionFactory().openSession();
			MemberVO member = ses.selectOne(NS + ".getMemberInfo", email);
			return member;
		}finally {
			if(ses!=null) ses.close();
		}
	}
	
	public Boolean editMyInfo(MemberVO member) {
		try {
			ses = this.getSessionFactory().openSession();
			int n = ses.update(NS + ".editMemberInfo", member);
			if(n>0) {
				ses.commit();
				return true;
			}
			else {
				ses.rollback();
				return false;
			}
		}finally {
			if(ses!=null) ses.close();
		}
	}
	
	public List<TimeLineVO> getTimelineList(Map<String, Object> map) {
		try {
			ses = this.getSessionFactory().openSession();
			List<TimeLineVO> timeline = ses.selectList(NS + ".getTimeline", map);
			return timeline;
		}
		finally {
			if(ses!=null) ses.close();
		}
	}
	
	public List<AccountVO> getAccountList(String email){
		try {
			ses = this.getSessionFactory().openSession();
			List<AccountVO> accountList = ses.selectList(NS + ".getAccountList", email);
			return accountList;
		}
		finally {
			if(ses!=null) ses.close();
		}
	}
}
