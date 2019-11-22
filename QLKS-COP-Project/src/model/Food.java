package model;

import java.util.ArrayList;

import dto.FoodDTO;

public class Food {
	private long foodId;
	private String name;
	private String type;
	private String description;
	private long price;
	private long imageId;
	private String note;
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	private ArrayList<FoodDTO> listFood = new ArrayList<FoodDTO>();
	
	public ArrayList<FoodDTO> getListFood() {
		return listFood;
	}
	public void setListFood(ArrayList<FoodDTO> listFood) {
		this.listFood = listFood;
	}
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
				+ ", price=" + price + ", image=" + imageId + ", note=" + note + "]";
	}
	public void setName(String name) {
		this.name = name;
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
	
	public Long getImageId() {
		return imageId;
	}
	public void setImageId(Long imageId) {
		this.imageId = imageId;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public Food() {
		
	}
	public Food(String name, String type, String description, long price, long imageId) {
		super();
		this.name = name;
		this.type = type;
		this.description = description;
		this.price = price;
		this.imageId = imageId;
	}
	
	
}
