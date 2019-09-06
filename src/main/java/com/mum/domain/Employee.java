/**
 * 
 */
package com.mum.domain;
import java.io.Serializable;
import java.util.Date;

import javax.annotation.Nullable;
import javax.persistence.*;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.validation.Valid;
import javax.validation.constraints.*;

import org.hibernate.validator.constraints.*;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * @author Nabin
 *
 */
@Entity(name="employee")
public class Employee implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1000L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long employeeId;
	@NotEmpty (message=" firstName cannot be empty")
	private String firstName;
	@NotEmpty (message=" lastName cannot be empty")
	private String lastName;
	
	private int ssn;
	

	@NotEmpty (message=" gender cannot be empty")
	private String gender;
	@NotNull(message="cannot be null")
	@OneToOne(fetch=FetchType.EAGER,cascade=CascadeType.MERGE)
	@JoinColumn(name="departmentId")
	private Department department;// foreign key
	
	@NotNull(message="cannot be null")
	@Valid
	@OneToOne(fetch=FetchType.EAGER,cascade=CascadeType.MERGE)
	@JoinColumn(name="postId")
	private Post post;// foreign key
	
	@NotNull(message="cannot be null")
	@OneToOne(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinColumn(name="addressId")
	private Address address;// foreign
	
	@Valid
	@OneToOne(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinColumn(name="phoneId")
	private Phone phone;
	
	@Nullable
	@OneToOne(fetch=FetchType.EAGER,cascade=CascadeType.MERGE)
	@JoinColumn(name="supervisedbyID")
	private Employee supervisedBy;
	
	@OneToOne(fetch=FetchType.EAGER,cascade=CascadeType.MERGE)
	@JoinColumn(name="createdBy")
	private User createdBy;// id from users
	
	@OneToOne(fetch=FetchType.EAGER,cascade=CascadeType.MERGE)
	@JoinColumn(name="modifyby")
	private User modifyBy;// user id from user table
	
	@Past
	@NotNull
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dateOfBirth;
	
	@NotNull
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date joinedDate;
	
	
	@NotNull
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date contractDate;
	
	private boolean inActive;
	
	public boolean isInActive() {
		return inActive;
	}

	public void setInActive(boolean inActive) {
		this.inActive = inActive;
	}

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdDate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date modifyDate;
	
	
	@OneToOne(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinColumn(name="user_id")
	private User user;// user id from user table
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	public User getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(User createdBy) {
		this.createdBy = createdBy;
	}

	public User getModifyBy() {
		return modifyBy;
	}

	public void setModifyBy(User modifyBy) {
		this.modifyBy = modifyBy;
	}
	public Employee getSupervisedBy() {
		return supervisedBy;
	}

	public void setSupervisedBy(Employee supervisedBy) {
		this.supervisedBy = supervisedBy;
	}
	
	public Phone getPhone() {
		return phone;
	}

	public void setPhone(Phone phone) {
		this.phone = phone;
	}
	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}
	
	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}
	public long getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(long employeeId) {
		this.employeeId = employeeId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public int getSsn() {
		return ssn;
	}

	public void setSsn(int sSN) {
		ssn = sSN;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public Date getJoinedDate() {
		return joinedDate;
	}

	public void setJoinedDate(Date joinedDate) {
		this.joinedDate = joinedDate;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public Date getContractDate() {
		return contractDate;
	}

	public void setContractDate(Date contractDate) {
		this.contractDate = contractDate;
	}
}
