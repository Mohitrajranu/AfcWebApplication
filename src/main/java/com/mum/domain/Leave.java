package com.mum.domain;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity(name = "leaves")
public class Leave {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	Long leaveid;
	@NotNull
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	Date appliedDate;
	@NotNull
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	Date leaveFromDate;
	@NotNull
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	Date leaveToDate;
	@NotEmpty
	@Size(min = 3, max = 500, message = "description is required")
	String description;
	// replace by employye
//	@Valid
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "approvedById")
	Employee approvedById;
//	@Valid
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "applicantId")
	Employee applicantId;

	boolean isApproved;

	

	public Long getLeaveid() {
		return leaveid;
	}

	public void setLeaveid(Long leaveid) {
		this.leaveid = leaveid;
	}

	public Date getAppliedDate() {
		return appliedDate;
	}

	public void setAppliedDate(Date appliedDate) {
		this.appliedDate = appliedDate;
	}

	public Date getLeaveFromDate() {
		return leaveFromDate;
	}

	public void setLeaveFromDate(Date leaveFromDate) {
		this.leaveFromDate = leaveFromDate;
	}

	public Date getLeaveToDate() {
		return leaveToDate;
	}

	public void setLeaveToDate(Date leaveToDate) {
		this.leaveToDate = leaveToDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Employee getApprovedById() {
		return approvedById;
	}

	public void setApprovedById(Employee approvedById) {
		this.approvedById = approvedById;
	}

	public Employee getApplicantId() {
		return applicantId;
	}

	public void setApplicantId(Employee applicantId) {
		this.applicantId = applicantId;
	}

	public boolean isApproved() {
		return isApproved;
	}

	public void setApproved(boolean isApproved) {
		this.isApproved = isApproved;
	}

	
}
