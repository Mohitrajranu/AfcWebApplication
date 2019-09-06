/**
 * 
 */
package com.mum.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * @author Nabin
 *
 */
@Entity(name="department")
public class Department implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 14L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long departmentId;
	@NotEmpty (message=" departmentName cannot be empty")
	private String departmentName;
	public long getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(long departmentId) {
		this.departmentId = departmentId;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	

}
