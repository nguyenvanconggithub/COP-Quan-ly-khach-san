package dto;

import model.Image;

public class ImageDTO {
	private String link;

	public String getLink() {
		return link;
	}

	public ImageDTO(Image image) {
		super();
		this.link = image.getLink();
	}

	public void setLink(String link) {
		this.link = link;
	}
}
