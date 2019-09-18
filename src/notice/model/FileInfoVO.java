package notice.model;

import java.io.Serializable;

public class FileInfoVO implements Serializable {
	private String fnum;
	private String fname;
	private long fsize;
	private String fplace;
	private String notice_nnum;

	public FileInfoVO() {

	}

	public FileInfoVO(String fnum, String fname, long fsize, String fplace, String notice_nnum) {
		super();
		this.fnum = fnum;
		this.fname = fname;
		this.fsize = fsize;
		this.fplace = fplace;
		this.notice_nnum = notice_nnum;
	}

	public String getFnum() {
		return fnum;
	}

	public void setFnum(String fnum) {
		this.fnum = fnum;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public long getFsize() {
		return fsize;
	}

	public void setFsize(long fsize) {
		this.fsize = fsize;
	}

	public String getFplace() {
		return fplace;
	}

	public void setFplace(String fplace) {
		this.fplace = fplace;
	}

	public String getNotice_nnum() {
		return notice_nnum;
	}

	public void setNotice_nnum(String notice_nnum) {
		this.notice_nnum = notice_nnum;
	}
}
