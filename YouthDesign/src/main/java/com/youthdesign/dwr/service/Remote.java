package com.youthdesign.dwr.service;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;

import com.youthdesign.dwr.model.Person;

@RemoteProxy(name="dwrService")
public class Remote {

	@RemoteMethod
	public String getData(int index) {
//		try {
//			Thread.sleep(7000);
//		} catch (InterruptedException e) {
//			e.printStackTrace();
//		}
		return index + ": ba~ba~banana";
	}

	@RemoteMethod
	public void doSomethingWithPerson(Person p) {
		System.out.println(p.toString());
	}
}
