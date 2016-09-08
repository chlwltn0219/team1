package org.zerock.domain;

import java.util.Arrays;
import java.util.Date;

public class NoticeVO {
	
	private Integer age;
	private String email;
	private String name;
	private String id;
	private String pw;
	private String gender;
	private String location;
	
	@Override
	public String toString() {
		return "BoardVO [age=" + age + ", email=" + email + ", name="
				+ name + ", id=" + id + ", pw=" + pw
				+ ", gender=" + gender + ", location=" + location
				+ "]";
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

}
