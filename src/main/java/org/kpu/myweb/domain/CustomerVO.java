package org.kpu.myweb.domain;

public class CustomerVO {
	private int customerId;
	private String name;
	private String id;
	private String passwd;
	private String phoneNumber;
	private String passportNumber;
	
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getPassportNumber() {
		return passportNumber;
	}
	public void setPassportNumber(String passportNumber) {
		this.passportNumber = passportNumber;
	}
	
	@Override
	public String toString() {
		return "CustomerVO [customerId=" + customerId + ", name=" + name + ", id=" + id + ", passwd=" + passwd + ", phoneNumber="
				+ phoneNumber + ", passportNumber=" + passportNumber + "]";
	}

	
}
