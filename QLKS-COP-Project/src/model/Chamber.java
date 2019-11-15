package model;

public class Chamber {
	
	private long chamber_id;
	private String number;
	private int type;
	private int capacity;
	private float area;
	private long price;
	private int floor;
	private boolean isVip;
	private boolean isEmpty;
	private String note;
	
	public Chamber() {
		
	}
	public long getChamber_id() {
		return chamber_id;
	}
	public Chamber(long chamber_id, String number, int type, int capacity, float area, long price, int floor,
			boolean isVip, boolean isEmpty, String note) {
		super();
		this.chamber_id = chamber_id;
		this.number = number;
		this.type = type;
		this.capacity = capacity;
		this.area = area;
		this.price = price;
		this.floor = floor;
		this.isVip = isVip;
		this.isEmpty = isEmpty;
		this.note = note;
	}
	@Override
	public String toString() {
		return "Chamber [chamber_id=" + chamber_id + ", number=" + number + ", type=" + type + ", capacity=" + capacity
				+ ", area=" + area + ", price=" + price + ", floor=" + floor + ", isVip=" + isVip + ", isEmpty="
				+ isEmpty + ", note=" + note + "]";
	}
	public void setChamber_id(long chamber_id) {
		this.chamber_id = chamber_id;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public float getArea() {
		return area;
	}
	public void setArea(float area) {
		this.area = area;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	public int getFloor() {
		return floor;
	}
	public void setFloor(int floor) {
		this.floor = floor;
	}
	public boolean isVip() {
		return isVip;
	}
	public void setVip(boolean isVip) {
		this.isVip = isVip;
	}
	public boolean isEmpty() {
		return isEmpty;
	}
	public void setEmpty(boolean isEmpty) {
		this.isEmpty = isEmpty;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
}
