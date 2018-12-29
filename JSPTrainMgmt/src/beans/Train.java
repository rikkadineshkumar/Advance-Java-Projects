package beans;

public class Train {

	private int tNo;
	private String tName,sFrom,sTo,available;
	
	public Train() {
		super();
	}	
	public Train(int tNo, String tName, String sFrom, String sTo, String available) {
		super();
		this.tNo = tNo;
		this.tName = tName;
		this.sFrom = sFrom;
		this.sTo = sTo;
		this.available = available;
	}
	
	public int gettNo() {
		return tNo;
	}
	public void settNo(int tNo) {
		this.tNo = tNo;
	}
	public String gettName() {
		return tName;
	}
	public void settName(String tName) {
		this.tName = tName;
	}
	public String getsFrom() {
		return sFrom;
	}
	public void setsFrom(String sFrom) {
		this.sFrom = sFrom;
	}
	public String getsTo() {
		return sTo;
	}
	public void setsTo(String sTo) {
		this.sTo = sTo;
	}
	public String getAvailable() {
		return available;
	}
	public void setAvailable(String available) {
		this.available = available;
	}
	
	@Override
	public String toString() {
		return "Train [tNo=" + tNo + ", tName=" + tName + ", sFrom=" + sFrom + ", sTo=" + sTo + ", available="
				+ available + "]";
	}
}
 