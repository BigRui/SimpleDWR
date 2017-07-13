<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type='text/javascript' src='${pageContext.request.contextPath }/dwr/engine.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath }/dwr/util.js'></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/dwr/interface/dwrService.js"></script>
<script type="text/javascript">
	$(function(){
		dwrService.getData(42, {
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
		dwrService.doSomethingWithPerson(myJSPerson);
	});
</script>
</head>
<body>
<h2>Hello World!</h2>
<a href="${pageContext.request.contextPath }/reverseajax/toClock">Server-Side Clock</a>
<a href="${pageContext.request.contextPath }/reverseajax/toPeopleTable">Table Update</a>
</body>
</html>
