package rusioutlook;

public class Detial {
	String date;
	public Detial(String date, int id, String name, String mobile, String state, String district, String address,
			String message) {
		super();
		this.date = date;
		this.id = id;
		this.name = name;
		this.mobile = mobile;
		this.state = state;
		this.district = district;
		this.address = address;
		this.message = message;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	int id;
	String name;
	String mobile;
	String state;
	String district;
	String address;
	String message;
}
