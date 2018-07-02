package member.model;

import org.hibernate.validator.constraints.NotEmpty;

public class Member {
	@NotEmpty(message="아이디를 입력해주세요.")
	private String memid;		//아이디
	@NotEmpty(message="비밀번호를 입력해주세요.")
	private String mempw;		//비밀번호
	@NotEmpty(message="이름을 입력해주세요.")
	private String memname;	//이름
	@NotEmpty(message="주소를 입력해주세요.")
	private String memaddr;	//주소
	private String memphone;	//전화번호
	@NotEmpty(message="전화번호를 입력해주세요.")
	private String memphone1;
	@NotEmpty(message="전화번호를 입력해주세요.")
	private String memphone2;
	@NotEmpty(message="전화번호를 입력해주세요.")
	private String memphone3;
	private String mememail;	//이메일
	@NotEmpty(message="이메일을 입력해주세요.")
	private String mememail1;
	@NotEmpty(message="이메일을 입력해주세요.")
	private String mememail2;
	private String mempermit;	//가입승인여부
	private int gradeid;		//회원등급ID
	private String gradename;	//등급이름
	private int comid;			//회사ID
	private String comname;	//회사이름
	private String comaddr;	//회사주소
	
	public String getGradename() {
		return gradename;
	}
	public void setGradename(String gradename) {
		this.gradename = gradename;
	}
	public String getComname() {
		return comname;
	}
	public void setComname(String comname) {
		this.comname = comname;
	}
	public String getComaddr() {
		return comaddr;
	}
	public void setComaddr(String comaddr) {
		this.comaddr = comaddr;
	}
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getMempw() {
		return mempw;
	}
	public void setMempw(String mempw) {
		this.mempw = mempw;
	}
	public String getMemname() {
		return memname;
	}
	public void setMemname(String memname) {
		this.memname = memname;
	}
	public String getMemaddr() {
		return memaddr;
	}
	public void setMemaddr(String memaddr) {
		this.memaddr = memaddr;
	}
	public String getMemphone() {
		return memphone;
	}
	public void setMemphone(String memphone) {
		this.memphone = memphone;
	}
	public String getMemphone1() {
		return memphone1;
	}
	public void setMemphone1(String memphone1) {
		this.memphone1 = memphone1;
	}
	public String getMemphone2() {
		return memphone2;
	}
	public void setMemphone2(String memphone2) {
		this.memphone2 = memphone2;
	}
	public String getMemphone3() {
		return memphone3;
	}
	public void setMemphone3(String memphone3) {
		this.memphone3 = memphone3;
	}
	public String getMememail() {
		return mememail;
	}
	public void setMememail(String mememail) {
		this.mememail = mememail;
	}
	public String getMememail1() {
		return mememail1;
	}
	public void setMememail1(String mememail1) {
		this.mememail1 = mememail1;
	}
	public String getMememail2() {
		return mememail2;
	}
	public void setMememail2(String mememail2) {
		this.mememail2 = mememail2;
	}
	public String getMempermit() {
		return mempermit;
	}
	public void setMempermit(String mempermit) {
		this.mempermit = mempermit;
	}
	public int getGradeid() {
		return gradeid;
	}
	public void setGradeid(int gradeid) {
		this.gradeid = gradeid;
	}
	public int getComid() {
		return comid;
	}
	public void setComid(int comid) {
		this.comid = comid;
	}
	
}
