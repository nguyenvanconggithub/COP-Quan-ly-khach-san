package dto;

import model.Chamber;

public class ChamberDTO {
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public ChamberDTO(Chamber chamber) {
		super();
		switch (chamber.getType()) {
		case 0:
			type = "single";
			break;
		case 1:
			type = "couple";
			break;
		default:
			type = "family";
			break;
		}
		this.maxCapacity = chamber.getCapacity();
		this.area = chamber.getArea();
		this.price = chamber.getPrice();
		this.vip = "non";
		if (chamber.isVip())
			this.vip = "vip";
	}

	public int getMaxCapacity() {
		return maxCapacity;
	}

	public void setMaxCapacity(int maxCapacity) {
		this.maxCapacity = maxCapacity;
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

	public String getVip() {
		return vip;
	}

	public void setVip(String vip) {
		this.vip = vip;
	}

	private String type;
	private int maxCapacity;
	private float area;
	private long price;
	private String vip;
}
