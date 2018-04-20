package com.skilldistillery.jpanonprofit.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Contact {
	
	//fields
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String email;
	private int phone;
	@Column(name = "website_url")
	private String websiteURL;
	
	//no-arg
	public Contact() {	}
	
	//getters/setters
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public String getWebsiteURL() {
		return websiteURL;
	}

	public void setWebsiteURL(String websiteURL) {
		this.websiteURL = websiteURL;
	}

	public int getId() {
		return id;
	}
	
	//toString
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Contact [id=").append(id).append(", email=").append(email).append(", phone=").append(phone)
				.append(", websiteURL=").append(websiteURL).append("]");
		return builder.toString();
	}
	
	

}
