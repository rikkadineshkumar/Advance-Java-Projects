package beans;

public class User {

	private String uName, pWord, fName, lName, addr, mid;
	private long  phno;
	
	public User() {
		super();
	}
	public User(String uName, String pWord, String fName, String lName, String addr, String mid, long phno) {
		super();
		this.uName = uName;
		this.pWord = pWord;
		this.fName = fName;
		this.lName = lName;
		this.addr = addr;
		this.mid = mid;
		this.phno = phno;
	}
	
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getpWord() {
		return pWord;
	}
	public void setpWord(String pWord) {
		this.pWord = pWord;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public long getPhno() {
		return phno;
	}
	public void setPhno(long phno) {
		this.phno = phno;
	}
	
	@Override
	public String toString() {
		return "UserDAO [uName=" + uName + ", pWord=" + pWord + ", fName=" + fName + ", lName=" + lName + ", addr="
				+ addr + ", mid=" + mid + ", phno=" + phno + "]";
	}

}
