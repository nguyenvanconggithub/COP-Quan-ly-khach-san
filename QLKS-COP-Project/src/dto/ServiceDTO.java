package dto;

import model.Service;

public class ServiceDTO {
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ServiceDTO(Service service) {
		super();
		this.name = service.getName();
	}
}
