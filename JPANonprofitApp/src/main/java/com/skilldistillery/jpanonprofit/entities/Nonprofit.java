package com.skilldistillery.jpanonprofit.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Nonprofit {
	
	//fields
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id; 
	@Column(name = "abbreviation")
	private String abbr; 
	private String name;
	private String description;
	private String cause;
	@Column(name = "year_founded")
	private int yearFounded;
	@Column(name = "address_id")
	private int addressId; 
	@Column(name = "image_url")
	private String imageURL;
	@Column(name = "contact_id")
	private int contactId;
	@Column(name = "president_id")
	private int presidentId;
	@Column(name = "founder_id")
	private int founderId;
	@Column(name = "co_founder_id")
	private int cofounderId;
	
	//no-arg constructor
	public Nonprofit() {	}
	
	//getters/setters
	public String getAbbr() {
		return abbr;
	}

	public void setAbbr(String abbr) {
		this.abbr = abbr;
	}

	public String getName() {
		return name;
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

	public String getCause() {
		return cause;
	}

	public void setCause(String cause) {
		this.cause = cause;
	}

	public int getYearFounded() {
		return yearFounded;
	}

	public void setYearFounded(int yearFounded) {
		this.yearFounded = yearFounded;
	}

	public int getAddressId() {
		return addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public int getContactId() {
		return contactId;
	}

	public void setContactId(int contactId) {
		this.contactId = contactId;
	}

	public int getPresidentId() {
		return presidentId;
	}

	public void setPresidentId(int presidentId) {
		this.presidentId = presidentId;
	}

	public int getFounderId() {
		return founderId;
	}

	public void setFounderId(int founderId) {
		this.founderId = founderId;
	}

	public int getCofounderId() {
		return cofounderId;
	}

	public void setCofounderId(int cofounderId) {
		this.cofounderId = cofounderId;
	}

	public int getId() {
		return id;
	}

	//toString
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Nonprofit [id=").append(id).append(", abbr=").append(abbr).append(", name=").append(name)
				.append(", description=").append(description).append(", cause=").append(cause).append(", yearFounded=")
				.append(yearFounded).append(", addressId=").append(addressId).append(", imageURL=").append(imageURL)
				.append(", contactId=").append(contactId).append(", presidentId=").append(presidentId)
				.append(", founderId=").append(founderId).append(", cofounderId=").append(cofounderId).append("]");
		return builder.toString();
	}
	
	
	
}