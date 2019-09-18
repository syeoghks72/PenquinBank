package account.model;

import java.io.Serializable;

import mypage.model.AccountDetailVO;

public class AccountVO implements Serializable {
	private String accnum;
	private String money;
	private String password;
	private String bankname;
	private String member_email;

	private AccountDetailVO accountDetail;

	public AccountVO() {

	}

	public AccountVO(String accnum, String money, String password, String bankname, String member_email,
			AccountDetailVO accountDetail) {
		super();
		this.accnum = accnum;
		this.money = money;
		this.password = password;
		this.bankname = bankname;
		this.member_email = member_email;
		this.accountDetail = accountDetail;
	}

	public String getAccnum() {
		return accnum;
	}

	public void setAccnum(String accnum) {
		this.accnum = accnum;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getBankname() {
		return bankname;
	}

	public void setBankname(String bankname) {
		this.bankname = bankname;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public AccountDetailVO getAccountDetail() {
		return accountDetail;
	}

	public void setAccountDetail(AccountDetailVO accountDetail) {
		this.accountDetail = accountDetail;
	}

	@Override
	public String toString() {
		return "AccountVO [accnum=" + accnum + ", money=" + money + ", password=" + password + ", bankname=" + bankname
				+ ", member_email=" + member_email + ", accountDetail=" + accountDetail.toString() + "]";
	}

}
