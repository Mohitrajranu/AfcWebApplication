/**
 * 
 */
package com.mum.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.validator.constraints.*;

/**
 * @author nabin
 *
 */
@Entity(name="address")
public class Address implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 10L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long addressId;
	@Email(message="invalid email")
	private String email;
	@NotEmpty (message="street cannot be empty")
	private String street;
	@NotEmpty(message=" state cannot be empty")
	private String state;
	@NotEmpty(message=" city cannot be empty")
	private String city;
	
	
	@Range(min=10000,max=99999, message="Zipcode must have five Digit")
	private int zipCode;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getAddressId() {
		return addressId;
	}

	public void setAddressId(long addressId) {
		this.addressId = addressId;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getZipCode() {
		return zipCode;
	}

	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}

}
