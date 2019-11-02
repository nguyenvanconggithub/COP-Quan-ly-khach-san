package model;

public class Service {
	private long serviceId;
	private String name;
	public long getServiceId() {
		return serviceId;
	}
	public void setServiceId(long serviceId) {
		this.serviceId = serviceId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Service [serviceId=" + serviceId + ", name=" + name + "]";
	}
	
}
