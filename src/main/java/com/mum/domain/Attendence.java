package com.mum.domain;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.Date;

import javax.annotation.Nullable;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity(name= "attendance")
public class Attendence {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	long attendanceId;
	@NotNull
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	Date date;
//	@NotNull
	@Nullable
	@DateTimeFormat(pattern = "hh:mm:ss")
	Timestamp checkinTime;
//	@NotNull
	@Nullable
	@DateTimeFormat(pattern = "hh:mm:ss")
	Timestamp checkoutTime;
	// employee
	@OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "userId")
	User userId;

	
	public User getUserId() {
		return userId;
	}

	public void setUserId(User userId) {
		this.userId = userId;
	}

	public long getAttendanceId() {
		return attendanceId;
	}

	public void setAttendanceId(long attendanceId) {
		this.attendanceId = attendanceId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Timestamp getCheckinTime() {
		return checkinTime;
	}

	public void setCheckinTime(Timestamp checkinTime) {
		this.checkinTime = checkinTime;
	}

	public Timestamp getCheckoutTime() {
		return checkoutTime;
	}

	public void setCheckoutTime(Timestamp checkoutTime) {
		this.checkoutTime = checkoutTime;
	}


}
