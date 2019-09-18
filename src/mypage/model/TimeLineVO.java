package mypage.model;

import java.io.Serializable;

public class TimeLineVO implements Serializable {
	private String timenum;
	private String trader;
	private String sentmoney;
	private String receivemoney;
	private String whentime;
	private String account_accnum;

	public TimeLineVO() {

	}

	public TimeLineVO(String timenum, String trader, String sentmoney, String receivemoney, String whentime,
			String account_accnum) {
		super();
		this.timenum = timenum;
		this.trader = trader;
		this.sentmoney = sentmoney;
		this.receivemoney = receivemoney;
		this.whentime = whentime;
		this.account_accnum = account_accnum;
	}

	public String getTimenum() {
		return timenum;
	}

	public void setTimenum(String timenum) {
		this.timenum = timenum;
	}

	public String getTrader() {
		return trader;
	}

	public void setTrader(String trader) {
		this.trader = trader;
	}

	public String getSentmoney() {
		return sentmoney;
	}

	public void setSentmoney(String sentmoney) {
		this.sentmoney = sentmoney;
	}

	public String getReceivemoney() {
		return receivemoney;
	}

	public void setReceivemoney(String receivemoney) {
		this.receivemoney = receivemoney;
	}

	public String getWhentime() {
		return whentime;
	}

	public void setWhentime(String whentime) {
		this.whentime = whentime;
	}

	public String getAccount_accnum() {
		return account_accnum;
	}

	public void setAccount_accnum(String account_accnum) {
		this.account_accnum = account_accnum;
	}

	@Override
	public String toString() {
		return "TimeLineVO [timenum=" + timenum + ", trader=" + trader + ", sentmoney=" + sentmoney + ", receivemoney="
				+ receivemoney + ", whentime=" + whentime + ", account_accnum=" + account_accnum + "]";
	}



}
