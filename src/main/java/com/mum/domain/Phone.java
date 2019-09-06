/**
 * 
 */
package com.mum.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.validator.constraints.Range;

/**
 * @author ashok
 *
 */
@Entity
public class Phone implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 12L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long phoneId;
	@Range(min=100,max=999, message="phone prefix must have three Digit")
	private int prefix;
	@Range(min=100,max=999, message="phone areaCode must have three Digit")
	private int areaCode;
	@Range(min=1000,max=9999, message="phone number must have four Digit")
	private int number;

	public long getPhoneId() {
		return phoneId;
	}

	public void setPhoneId(long phoneId) {
		this.phoneId = phoneId;
	}

	public int getPrefix() {
		return prefix;
	}

	public void setPrefix(int prefix) {
		this.prefix = prefix;
	}

	public int getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(int areaCode) {
		this.areaCode = areaCode;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

}
