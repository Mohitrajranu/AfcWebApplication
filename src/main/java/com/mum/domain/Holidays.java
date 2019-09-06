package com.mum.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity(name= "holidays")
public class Holidays {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	long holidayId;
	@NotNull
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	Date holidayDate;
	@NotEmpty
	@Size(min = 3, max = 100, message = "give me some valid reason")
	String reason;

	public long getHolidayId() {
		return holidayId;
	}

	public void setHolidayId(long holidayId) {
		this.holidayId = holidayId;
	}

	public Date getHolidayDate() {
		return holidayDate;
	}

	public void setHolidayDate(Date holidayDate) {
		this.holidayDate = holidayDate;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

}
