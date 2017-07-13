package com.oracle.lnsd.entity;

import java.util.Date;

public class Person {
	private String name;
	private int age;
	private Date[] appointments;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public Date[] getAppointments() {
		return appointments;
	}
	public void setAppointments(Date[] appointments) {
		this.appointments = appointments;
	}
	
}
