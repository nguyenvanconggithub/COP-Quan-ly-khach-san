package model;

public class Hotel {
	private String hotelName;
	private int star;
	private String address;
	private long price;
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "Hotel [hotelName=" + hotelName + ", star=" + star + ", address=" + address + ", price=" + price + "]";
	}
	
}
