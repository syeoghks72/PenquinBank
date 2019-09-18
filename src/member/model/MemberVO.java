package member.model;

import java.io.Serializable;
import java.util.List;

import account.model.AccountVO;

public class MemberVO implements Serializable {
	private String email;
	private String password;
	private String name;
	private String phone;
	private String pernum;
	
	private List<AccountVO> accountList;
	
	public MemberVO() {
		
	}
	public MemberVO(String email, String password, String name, String phone, String pernum) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.pernum = pernum;
	}
	
	
	public List<AccountVO> getAccountList() {
		return accountList;
	}
	public void setAccountList(List<AccountVO> accountList) {
		this.accountList = accountList;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPernum() {
		return pernum;
	}
	public void setPernum(String pernum) {
		this.pernum = pernum;
	}

	

}
