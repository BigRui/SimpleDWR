package com.oracle.lnsd.dwr;

import java.util.Date;

import com.oracle.lnsd.entity.Person;

public class Remote {

	public String getData(int index) {
//		try {
//			Thread.sleep(7000);
//		} catch (InterruptedException e) {
//			e.printStackTrace();
//		}
		return index + ": ba~ba~banana";
	}

	public void doSomethingWithPerson(Person p) {
		System.out.println("I'm " + p.getName() + ", " + p.getAge() + " years old.");
		for(Date date : p.getAppointments()) {
			System.out.println(date);
		}
	}
}
