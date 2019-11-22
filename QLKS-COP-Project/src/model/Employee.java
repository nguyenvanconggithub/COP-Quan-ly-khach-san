package model;

import java.util.Date;

public class Employee {
	private long employeeId;
	private String fullName;
	private Date birth;
	private boolean gender;
	private String address;
	private String email;
	private String image;
	@Override
	public String toString() {
		return "Employee [employeeId=" + employeeId + ", fullName=" + fullName + ", birth=" + birth + ", gender="
				+ gender + ", address=" + address + ", email=" + email + ", image=" + image + ", manager=" + manager
				+ "]";
	}
	private Employee manager;
	public long getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(long employeeId) {
		this.employeeId = employeeId;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public boolean isGender() {
		return gender;
	}
	public void setGender(boolean gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Employee getManager() {
		return manager;
	}
	public void setManager(Employee manager) {
		this.manager = manager;
	}
}
