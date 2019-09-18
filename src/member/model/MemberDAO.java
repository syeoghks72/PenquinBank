package member.model;

import org.apache.ibatis.session.SqlSession;

import common.util.DAOBase;

public class MemberDAO extends DAOBase{
	private final String NS = "member.model.MemberMapper";
	private SqlSession ses;

	public MemberDAO() {
		
	}
	
	public int insertMember(MemberVO member) {
		try {
			ses = this.getSessionFactory().openSession();
			int n = ses.insert(NS + ".insertMember", member);
			if(n>0) {
				ses.commit();
			}
			else {
				ses.rollback();
			}
			return n;
		}finally {
			if(ses != null) ses.close();
		}
	}
	
	public Boolean memberCheck(MemberVO member) {
		try {
			ses = this.getSessionFactory().openSession();
			int n = ses.selectOne(NS + ".memberCheck", member);
			
			if(n>0) return true;
			else return false;
		}
		finally {
			if(ses != null) {
				ses.close();
			}
		}
	}
	
	public Boolean idDuplicateCheck(String email) {
		try {
			ses = this.getSessionFactory().openSession();
			int n = ses.selectOne(NS + ".idDuplicateCheck", email);
			if(n>0) return true;
			else return false;
		}
		finally {
			if(ses != null) {
				ses.close();
			}
		}
	}
}
