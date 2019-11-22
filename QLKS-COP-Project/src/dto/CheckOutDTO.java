package dto;

import java.util.Date;

public class CheckOutDTO {
	private long chamberId;
	private long billId;
	private int type;
	private long price;
	private boolean isVip;
	private Date checkInDate;
	@Override
	public String toString() {
		return "CheckOutDTO [chamberId=" + chamberId + ", billId=" + billId + ", type=" + type + ", price=" + price
				+ ", isVip=" + isVip + ", checkInDate=" + checkInDate + ", stayDays=" + stayDays + ", rentMoney="
				+ rentMoney + ", note=" + note + ", fullName=" + fullName + ", birth=" + birth + ", gender=" + gender
				+ ", address=" + address + ", idNo=" + idNo + ", passport=" + passport + ", phone=" + phone + ", email="
				+ email + "]";
	}
	public long getChamberId() {
		return chamberId;
	}
	public void setChamberId(long chamberId) {
		this.chamberId = chamberId;
	}
	public long getBillId() {
		return billId;
	}
	public void setBillId(long billId) {
		this.billId = billId;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	public boolean isVip() {
		return isVip;
	}
	public void setVip(boolean isVip) {
		this.isVip = isVip;
	}
	public Date getCheckInDate() {
		return checkInDate;
	}
	public void setCheckInDate(Date checkInDate) {
		this.checkInDate = checkInDate;
	}
	public int getStayDays() {
		return stayDays;
	}
	public void setStayDays(int stayDays) {
		this.stayDays = stayDays;
	}
	public long getRentMoney() {
		return rentMoney;
	}
	public void setRentMoney(long rentMoney) {
		this.rentMoney = rentMoney;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
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
	public CheckOutDTO(long chamberId, long billId, int type, long price, boolean isVip, Date checkInDate, int stayDays,
			long rentMoney, String note, String fullName, Date birth, boolean gender, String address,
			String idNo, String passport, String phone, String email) {
		super();
		this.chamberId = chamberId;
		this.billId = billId;
		this.type = type;
		this.price = price;
		this.isVip = isVip;
		this.checkInDate = checkInDate;
		this.stayDays = stayDays;
		this.rentMoney = rentMoney;
		this.note = note;
		this.fullName = fullName;
		this.birth = birth;
		this.gender = gender;
		this.address = address;
		this.idNo = idNo;
		this.passport = passport;
		this.phone = phone;
		this.email = email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	private int stayDays;
	private long rentMoney;
	private String note;// bill note
	private String fullName;
	private Date birth;
	private boolean gender;
	private String address;
	private String idNo;
	private String passport;
	private String phone;
	private String email;
}
