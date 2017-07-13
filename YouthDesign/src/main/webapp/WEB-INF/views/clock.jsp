<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type='text/javascript' src='${pageContext.request.contextPath }/dwr/engine.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath }/dwr/util.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath }/dwr/interface/Clock.js'></script>
<script type="text/javascript">
	window.onload=function()
	{
	    dwr.engine.setActiveReverseAjax(true);
	    dwr.engine.setErrorHandler(errorHandler);
	    dwr.engine.setPollStatusHandler(updatePollStatus);
	    updatePollStatus(true);
	}
		  
	function errorHandler(message, ex) 
	{
	    dwr.util.setValue("error", "Cannot connect to server. Initializing retry logic.", {escapeHtml:false});
		setTimeout(function() { dwr.util.setValue("error", ""); }, 5000)
	}
		  
	function updatePollStatus(pollStatus) 
	{
	    dwr.util.setValue("pollStatus", pollStatus ? "Online" : "Offline", {escapeHtml:false});
	}
		  
	function enableUpdates(enabled)
	{
	    if (!enabled) 
		{
		    dwr.util.setValue("clockDisplay", "This tab/window does not have updates enabled.");
		}  
	    Clock.setEnabledAttribute(enabled);
	}
	
	function setClockStatus(clockStatus) {
	    dwr.util.setValue("clockStatus", clockStatus ? "Clock started" : "Clock stopped");
	}
</script>
</head>
<body>
	<div id="demoDiv">  	
    	<input type="button" value="Start / Stop" onclick="Clock.toggle();"/>
		Server status: <span id="pollStatus"></span>
		<div id="error"></div>
    	<p></p>
    	<h2 id="clockDisplay"></h2>
  	</div>
  	<div>
    	<h3>Filtering</h3>
		<input type="button" value="Enable Updates" onclick="enableUpdates(true);">
		<input type="button" value="Disable Updates" onclick="enableUpdates(false);">  	
  	</div>
</body>
</html>