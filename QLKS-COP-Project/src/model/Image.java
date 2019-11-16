package model;

public class Image {
	private long imageId;
	private boolean type;
	private String link;
	public long getImageId() {
		return imageId;
	}
	public void setImageId(long imageId) {
		this.imageId = imageId;
	}
	public boolean isType() {
		return type;
	}
	public void setType(boolean type) {
		this.type = type;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	
	@Override
	public String toString() {
		return "Image [imageId=" + imageId + ", type=" + type + ", link=" + link + "]";
	}

	
	
}
