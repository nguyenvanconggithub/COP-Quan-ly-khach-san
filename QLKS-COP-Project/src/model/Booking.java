package model;

import java.util.Date;

public class Booking {
	private long bookingId;
	private String guestName;
	private String phone;
	private String email;
	private String colRequire;
	private Date checkInDate;
	private Date checkOutDate;
	private String chamberType;
	private String chamberQuantity;
	private boolean isCheckIn;
	private String note;
	public long getBookingId() {
		return bookingId;
	}
	public void setBookingId(long bookingId) {
		this.bookingId = bookingId;
	}
	@Override
	public String toString() {
		return "Booking [bookingId=" + bookingId + ", guestName=" + guestName + ", phone=" + phone + ", email=" + email
				+ ", colRequire=" + colRequire + ", checkInDate=" + checkInDate + ", checkOutDate=" + checkOutDate
				+ ", chamberType=" + chamberType + ", chamberQuantity=" + chamberQuantity + ", isCheckIn=" + isCheckIn
				+ ", note=" + note + "]";
	}
	public String getGuestName() {
		return guestName;
	}
	public void setGuestName(String guestName) {
		this.guestName = guestName;
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
	public String getColRequire() {
		return colRequire;
	}
	public void setColRequire(String colRequire) {
		this.colRequire = colRequire;
	}
	public Date getCheckInDate() {
		return checkInDate;
	}
	public void setCheckInDate(Date checkInDate) {
		this.checkInDate = checkInDate;
	}
	public Date getCheckOutDate() {
		return checkOutDate;
	}
	public void setCheckOutDate(Date checkOutDate) {
		this.checkOutDate = checkOutDate;
	}
	public String getChamberType() {
		return chamberType;
	}
	public void setChamberType(String chamberType) {
		this.chamberType = chamberType;
	}
	public String getChamberQuantity() {
		return chamberQuantity;
	}
	public void setChamberQuantity(String chamberQuantity) {
		this.chamberQuantity = chamberQuantity;
	}
	public boolean isCheckIn() {
		return isCheckIn;
	}
	public void setCheckIn(boolean isCheckIn) {
		this.isCheckIn = isCheckIn;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
}
