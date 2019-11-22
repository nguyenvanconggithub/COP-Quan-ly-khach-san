package model;

import java.util.ArrayList;
import java.util.Date;

import dto.OrderDTO;

public class TBL_Order {
	private long orderId;
	private int people;
	private Date time;
	private boolean isPaid;
	private Long billId;
	private int orderQuantity;
	private ArrayList<OrderDTO> listOrder = new ArrayList<OrderDTO>();
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
	public Long getBillId() {
		return billId;
	}
	public void setBillId(Long billId) {
		this.billId = billId;
	}
	
	public int getOrderQuantity() {
		return orderQuantity;
	}
	public void setOrderQuantity(int orderQuantity) {
		this.orderQuantity = orderQuantity;
	}
	@Override
	public String toString() {
		return "TBL_Order [orderId=" + orderId + ", people=" + people + ", time=" + time + ", isPaid=" + isPaid
				+ ", billId=" + billId + "]";
	}
	public ArrayList<OrderDTO> getListOrder() {
		return listOrder;
	}
	public void setListOrder(ArrayList<OrderDTO> listOrder) {
		this.listOrder = listOrder;
	}
	
	
}
