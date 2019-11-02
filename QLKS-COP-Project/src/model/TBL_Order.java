package model;

import java.util.Date;

public class TBL_Order {
	private long orderId;
	private int people;
	private Date time;
	private boolean isPaid;
	private Bill billId;
	public long getOrderId() {
		return orderId;
	}
	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public boolean isPaid() {
		return isPaid;
	}
	public void setPaid(boolean isPaid) {
		this.isPaid = isPaid;
	}
	public Bill getBillId() {
		return billId;
	}
	public void setBillId(Bill billId) {
		this.billId = billId;
	}
	@Override
	public String toString() {
		return "TBL_Order [orderId=" + orderId + ", people=" + people + ", time=" + time + ", isPaid=" + isPaid
				+ ", billId=" + billId + "]";
	}
	
	
}
