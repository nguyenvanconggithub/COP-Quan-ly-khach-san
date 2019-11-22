package model;

import java.util.Date;

public class Guest {
	private long guestId;
	private String fullName;
	private Date birth;
	private boolean gender;
	private String address;
	private String idNo;
	private String passport;
	private String phone;
	private String email;
	private String note;
	public long getGuestId() {
		return guestId;
	}
	public void setGuestId(long guestId) {
		this.guestId = guestId;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public Date getBirth() {
		return birth;
	}
	@Override
	public String toString() {
		return "Guest [guestId=" + guestId + ", fullName=" + fullName + ", birth=" + birth + ", gender=" + gender
				+ ", address=" + address + ", idNo=" + idNo + ", passport=" + passport + ", phone=" + phone + ", email="
				+ email + ", note=" + note + "]";
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public boolean isGender() {
		return gender;
	}
	public void setGender(boolean gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getIdNo() {
		return idNo;
	}
	public void setIdNo(String idNo) {
		this.idNo = idNo;
	}
	public String getPassport() {
		return passport;
	}
	public void setPassport(String passport) {
		this.passport = passport;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
}
