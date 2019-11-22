package dto;

import java.util.Date;

import model.Guest;

public class CheckInInfoDTO {
	private long chamberId;
	private String fullName;
	private Date birth;
	private boolean gender;
	private String address;
	private String idNo;

	public long getChamberId() {
		return chamberId;
	}

	public void setChamberId(long chamberId) {
		this.chamberId = chamberId;
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

	@Override
	public String toString() {
		return "CheckInInfoDto [chamberId=" + chamberId + ", fullName=" + fullName + ", birth=" + birth + ", gender="
				+ gender + ", address=" + address + ", idNo=" + idNo + ", passport=" + passport + ", phone=" + phone
				+ ", email=" + email + ", note=" + note + "]";
	}

	public CheckInInfoDTO() {
		super();
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	private String passport;
	private String phone;
	private String email;
	private String note;

	public Guest getGuest() {
		return new Guest(this.fullName, this.birth, this.gender, this.address, this.idNo, this.passport, this.phone,
				this.email);
	}
}
