package mypage.model;

import java.io.Serializable;

public class AccountDetailVO implements Serializable{
	private String accdetailnum;
	private String acctype;
	private String paymentamount;
	private String apr;
	private String paymonth;
	private String paymentday;
	private String maturitydate;
	private String lastpaymentdate;
	private String account_accnum;
	public AccountDetailVO() {
		
	}
	public AccountDetailVO(String accdetailnum, String acctype, String paymentamount, String apr, String paymonth,
			String paymentday, String maturitydate, String lastpaymentdate, String account_accnum) {
		super();
		this.accdetailnum = accdetailnum;
		this.acctype = acctype;
		this.paymentamount = paymentamount;
		this.apr = apr;
		this.paymonth = paymonth;
		this.paymentday = paymentday;
		this.maturitydate = maturitydate;
		this.lastpaymentdate = lastpaymentdate;
		this.account_accnum = account_accnum;
	}
	public String getAccdetailnum() {
		return accdetailnum;
	}
	public void setAccdetailnum(String accdetailnum) {
		this.accdetailnum = accdetailnum;
	}
	public String getAcctype() {
		return acctype;
	}
	public void setAcctype(String acctype) {
		this.acctype = acctype;
	}
	public String getPaymentamount() {
		return paymentamount;
	}
	public void setPaymentamount(String paymentamount) {
		this.paymentamount = paymentamount;
	}
	public String getApr() {
		return apr;
	}
	public void setApr(String apr) {
		this.apr = apr;
	}
	public String getPaymonth() {
		return paymonth;
	}
	public void setPaymonth(String paymonth) {
		this.paymonth = paymonth;
	}
	public String getPaymentday() {
		return paymentday;
	}
	public void setPaymentday(String paymentday) {
		this.paymentday = paymentday;
	}
	public String getMaturitydate() {
		return maturitydate;
	}
	public void setMaturitydate(String maturitydate) {
		this.maturitydate = maturitydate;
	}
	public String getLastpaymentdate() {
		return lastpaymentdate;
	}
	public void setLastpaymentdate(String lastpaymentdate) {
		this.lastpaymentdate = lastpaymentdate;
	}
	public String getAccount_accnum() {
		return account_accnum;
	}
	public void setAccount_accnum(String account_accnum) {
		this.account_accnum = account_accnum;
	}
	@Override
	public String toString() {
		return "AccountDetailVO [accdetailnum=" + accdetailnum + ", acctype=" + acctype + ", paymentamount="
				+ paymentamount + ", apr=" + apr + ", paymonth=" + paymonth + ", paymentday=" + paymentday
				+ ", maturitydate=" + maturitydate + ", lastpaymentdate=" + lastpaymentdate + ", account_accnum="
				+ account_accnum + "]";
	}
	
	
}
