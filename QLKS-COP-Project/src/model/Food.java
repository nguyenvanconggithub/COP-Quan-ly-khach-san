package model;

public class Food {
	private long foodId;
	private String name;
	private boolean type;
	private String description;
	private long price;
	private String image;
	private String note;
	public long getFoodId() {
		return foodId;
	}
	public void setFoodId(long foodId) {
		this.foodId = foodId;
	}
	public String getName() {
		return name;
	}
	@Override
	public String toString() {
		return "Food [foodId=" + foodId + ", name=" + name + ", type=" + type + ", description=" + description
				+ ", price=" + price + ", image=" + image + ", note=" + note + "]";
	}
	public void setName(String name) {
		this.name = name;
	}
	public boolean isType() {
		return type;
	}
	public void setType(boolean type) {
		this.type = type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
}
