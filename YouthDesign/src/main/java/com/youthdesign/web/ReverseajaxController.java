package com.youthdesign.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/reverseajax")
public class ReverseajaxController {
	
	@RequestMapping(value="/toClock", method=RequestMethod.GET)
	public String toClock() {
		return "clock";
	}
	
	@RequestMapping(value="/toPeopleTable", method=RequestMethod.GET)
	public String toPeopleTable() {
		return "people-table";
	}
	
	@RequestMapping(value="/toJavascriptChat", method=RequestMethod.GET)
	public String toJavascriptChat() {
		return "javascript-chat";
	}
	
	@RequestMapping(value="/toJavaChat", method=RequestMethod.GET)
	public String toJavaChat() {
		return "java-chat";
	}
}
