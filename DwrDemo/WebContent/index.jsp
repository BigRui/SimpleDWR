<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/dwr/engine.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/dwr/interface/JDate.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/dwr/interface/Demo.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/dwr/interface/Remote.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/dwr/util.js'></script>
<script type="text/javascript">
	$(function(){
		Remote.getData(42, {
			callback:function(str) {
		    	alert(str); 
		  	},
		  	timeout:5000,
		  	errorHandler:function(message) { 
		  		alert("Oops: " + message); 
		  	}
		});
		
		var myJSPerson = {
				name:"Fred Bloggs",
				age:42,
				appointments:[ new Date(), new Date("1 Jan 2008") ]
		};
		Remote.doSomethingWithPerson(myJSPerson);
	});
</script>
<title>Insert title here</title>
</head>
<body>

</body>
</html>