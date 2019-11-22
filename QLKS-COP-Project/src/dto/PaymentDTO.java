package dto;

public class PaymentDTO {
	private String total;
	private String chamberNumber;
	private long billId;
	private long chamberId;

	public long removeDot() {
		String text = this.total;
		StringBuilder result = new StringBuilder();
		for (int i = 0; i < text.length(); i++) {
			if (text.charAt(i) != '.') {
				result.append(text.charAt(i));
			}
		}
		return Long.valueOf(result.toString());
	}

	public long getChamberId() {
		return chamberId;
	}

	public void setChamberId(long chamberId) {
		this.chamberId = chamberId;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getChamberNumber() {
		return chamberNumber;
	}

	public void setChamberNumber(String chamberNumber) {
		this.chamberNumber = chamberNumber;
	}

	public long getBillId() {
		return billId;
	}

	public void setBillId(long billId) {
		this.billId = billId;
	}

	@Override
	public String toString() {
		return "PaymentDTO [total=" + total + ", chamberNumber=" + chamberNumber + ", billId=" + billId + ", chamberId="
				+ chamberId + "]";
	}
}
