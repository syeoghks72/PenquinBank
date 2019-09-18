package account.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import common.util.DAOBase;
import member.model.MemberVO;
import mypage.model.TimeLineVO;

public class AccountDAO extends DAOBase{
	private final String NS = "account.model.AccountMapper";
	private SqlSession ses;
	public AccountDAO() {
		
	}
	
	public List<AccountVO> getAccountList(String email) {
		try {
			ses = this.getSessionFactory().openSession();
			List<AccountVO> arr = ses.selectList(NS+".getAcccountList",email);
			return arr;
		}
		finally {
			if(ses!=null) ses.close();
		}
	}
	
	public MemberVO getMyAccount(AccountVO account) {
		try {
			ses = this.getSessionFactory().openSession();
			MemberVO memJoin = ses.selectOne(NS+".myAccountInfo",account);
			return memJoin;
		}
		finally {
			if(ses!=null) ses.close();
		}
	}
	
	public MemberVO getYourAccount(AccountVO account) {
		try {
			ses = this.getSessionFactory().openSession();
			MemberVO memJoin = ses.selectOne(NS+".yourAccountInfo",account);
			return memJoin;
		}
		finally {
			if(ses!=null) ses.close();
		}
	}
	
	public Boolean SendMoney(MemberVO myAccountInfo, MemberVO yourAccountInfo, String sendMoney) {
		try {
			ArrayList<Integer> updateCheck = new ArrayList<>();
			AccountVO myAccount = myAccountInfo.getAccountList().get(0);
			AccountVO yourAccount = yourAccountInfo.getAccountList().get(0);
			
			//보낼 금액을 세팅함.. 쿼리문에서 사용됨.
			myAccount.setMoney(sendMoney);
			yourAccount.setMoney(sendMoney);
			
			int n = 0;
			ses = this.getSessionFactory().openSession();
			n = ses.update(NS + ".myMoneyUpdate", myAccount);	//내 계좌 돈 업데이트
			updateCheck.add(n);
			n = ses.update(NS +".yourMoneyUpdate", yourAccount); //상대 계좌 돈 업데이트
			updateCheck.add(n);
			
			TimeLineVO myTimeline = new TimeLineVO(
					null, yourAccountInfo.getName(), sendMoney, null, null, myAccount.getAccnum());
			
			TimeLineVO yourTimeline= new TimeLineVO(
					null, myAccountInfo.getName(), null, sendMoney, null, yourAccount.getAccnum());
			
			//모든 돈은 오갈때 timeline은 기록에 남긴다.
			n = ses.insert(NS + ".timelineInsert", myTimeline);	//송금 이력 기록하기
			updateCheck.add(n);
			n = ses.insert(NS + ".timelineInsert", yourTimeline); //상대 계좌 역시 돈을 받았으니 이력 기록
			updateCheck.add(n);
			
			if(updateCheck.contains(0)) {
				ses.rollback();
				return false;
			}else {
				ses.commit();
				return true;
			}
		}
		finally {
			if(ses!=null) ses.close();
		}
	}
}
