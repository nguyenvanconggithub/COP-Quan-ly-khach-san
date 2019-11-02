package model;

import java.util.Date;

public class Bill {
	private long billId;
	private Date checkInDate;
	private Date checkOutDate;
	public long getBillId() {
		return billId;
	}
	public void setBillId(long billId) {
		this.billId = billId;
	}
	public Date getCheckInDate() {
		return checkInDate;
	}
	@Override
	public String toString() {
		return "Bill [billId=" + billId + ", checkInDate=" + checkInDate + ", checkOutDate=" + checkOutDate
				+ ", totalPayment=" + totalPayment + ", isPaid=" + isPaid + ", note=" + note + ", guest=" + guest + "]";
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
	public long getTotalPayment() {
		return totalPayment;
	}
	public void setTotalPayment(long totalPayment) {
		this.totalPayment = totalPayment;
	}
	public boolean isPaid() {
		return isPaid;
	}
	public void setPaid(boolean isPaid) {
		this.isPaid = isPaid;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public Guest getGuest() {
		return guest;
	}
	public void setGuest(Guest guest) {
		this.guest = guest;
	}
	private long totalPayment;
	private boolean isPaid;
	private String note;
	private Guest guest;
}
