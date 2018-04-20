package com.skilldistillery.jpanonprofit.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Leader {
	
	//fields
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String title;
	@Column(name = "first_name")
	private String firstName;
	@Column(name = "middle_initial")
	private String middleInitial;
	@Column(name = "last_name")
	private String lastName;
	private int active;
	
	//no-arg
	public Leader() {	}

	//getters/setters
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleInitial() {
		return middleInitial;
	}

	public void setMiddleInitial(String middleInitial) {
		this.middleInitial = middleInitial;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public int getId() {
		return id;
	}
	
	//toString
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Leaders [id=").append(id).append(", title=").append(title).append(", firstName=")
				.append(firstName).append(", middleInitial=").append(middleInitial).append(", lastName=")
				.append(lastName).append(", active=").append(active).append("]");
		return builder.toString();
	}
	
	
}
