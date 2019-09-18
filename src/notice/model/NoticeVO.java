package notice.model;

import java.io.Serializable;

public class NoticeVO implements Serializable{
	private String rn;
	private String nnum;
	private String title;
	private String contents;
	private String vnum;
	private String ndate;
	private String member_email;

	public NoticeVO() {
		
	}

	public NoticeVO(String nnum, String title, String contents, String vnum, String ndate, String member_email) {
		super();
		this.nnum = nnum;
		this.title = title;
		this.contents = contents;
		this.vnum = vnum;
		this.ndate = ndate;
		this.member_email = member_email;
	}
	
	public String getRn() {
		return rn;
	}

	public void setRn(String rn) {
		this.rn = rn;
	}

	public String getNnum() {
		return nnum;
	}

	public void setNnum(String nnum) {
		this.nnum = nnum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getVnum() {
		return vnum;
	}

	public void setVnum(String vnum) {
		this.vnum = vnum;
	}

	public String getNdate() {
		return ndate;
	}

	public void setNdate(String ndate) {
		this.ndate = ndate;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
}
