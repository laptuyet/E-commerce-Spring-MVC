package com.patinshop.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name = "MemberRole")
public class RoleEntity {
	
	@Id
	@GeneratedValue
	private Integer id;
	
	@Column(name = "role_name")
	private String name;
	
	@OneToMany(mappedBy = "role", fetch = FetchType.EAGER)
	/* @Fetch(FetchMode.SELECT) */
	private List<CustomerEntity> users;
	
	public List<CustomerEntity> getUsers() {
		return users;
	}

	public void setUsers(List<CustomerEntity> users) {
		this.users = users;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
