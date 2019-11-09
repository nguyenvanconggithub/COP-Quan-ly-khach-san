package dto;

import java.util.ArrayList;
import java.util.List;

import model.Chamber;
import model.Hotel;
import model.Image;
import model.Service;

public class HotelDTO {
	private String hotelName;
	private int star;
	private String address;
	private String pricePerNight;
	private List<String> images = new ArrayList<String>();
	private List<String> services = new ArrayList<String>();
	private List<ChamberDTO> chambers = new ArrayList<ChamberDTO>();

	public HotelDTO(Hotel hotel, String pricePerNight, List<Image> images, List<Service> services,
			List<Chamber> chambers) {
		super();
		this.hotelName = hotel.getHotelName();
		this.star = hotel.getStar();
		this.address = hotel.getAddress();
		this.pricePerNight = pricePerNight;
		images.forEach(image -> this.images.add(image.getLink()));
		services.forEach(service -> this.services.add(service.getName()));
		chambers.forEach(chamber -> this.chambers.add(new ChamberDTO(chamber)));
	}

	@Override
	public String toString() {
		return "HotelDTO [hotelName=" + hotelName + ", star=" + star + ", address=" + address + ", pricePerNight="
				+ pricePerNight + ", images=" + images + ", services=" + services + ", chambers=" + chambers + "]";
	}

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

	public String getPricePerNight() {
		return pricePerNight;
	}

	public void setPricePerNight(String pricePerNight) {
		this.pricePerNight = pricePerNight;
	}

	public List<String> getImages() {
		return images;
	}

	public void setImages(List<String> images) {
		this.images = images;
	}

	public List<String> getServices() {
		return services;
	}

	public void setServices(List<String> services) {
		this.services = services;
	}

	public List<ChamberDTO> getChambers() {
		return chambers;
	}

	public void setChambers(List<ChamberDTO> chambers) {
		this.chambers = chambers;
	}
}