package com.skillbridge.model;

public class UserModel {

	private String username;
	private String firstname;
	private String lastname;
	private String email;
	private String mobile;
	private String password;
	
	public UserModel(String username, String firstname, String lastname, String email, String mobile, String password) {
		super();
		this.username = username;
		this.firstname = firstname;
		this.lastname = lastname;
		this.email = email;
		this.mobile = mobile;
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "UserModel [username=" + username + ", firstname=" + firstname + ", lastname=" + lastname + ", email="
				+ email + ", mobile=" + mobile + ", password=" + password + "]";
	}
	
	
	
	
}
