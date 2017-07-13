<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type='text/javascript' src='${pageContext.request.contextPath }/dwr/engine.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath }/dwr/util.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath }/dwr/interface/PeopleTable.js'></script>
<script type="text/javascript">
	window.onload = function() {
		dwr.engine.setActiveReverseAjax(true); // Initiate reverse ajax polling
		dwr.engine.setErrorHandler(errorHandler); // Called when a call and all retry attempts fail
		dwr.engine.setPollStatusHandler(updatePollStatus); // Optional function to call when the reverse ajax status changes (e.g. online to offline)
		updatePollStatus(true); // Optional - We are online right now!  Until DWR determines we are not!
		dwr.engine.setNotifyServerOnPageUnload(true); // Optional - When the page is unloaded, remove this ScriptSession.	
		// Tabs.init('tabList', 'tabContents'); // Initialize the tabs for this display    
		PeopleTable.updateTableDisplay(); // Make a call to the server to begin updating the table!   
		addAttributeToScriptSession(); // Make a remote call to the server to add an attribute onto the ScriptSession which will be used in determining what pages receive updates!
	}

	function errorHandler(message, ex) {
		dwr.util.setValue("error", "Cannot connect to server. Initializing retry logic.", { escapeHtml : false });
		setTimeout(function() {
			dwr.util.setValue("error", "");
		}, 5000)
	}

	function updatePollStatus(pollStatus) {
		dwr.util.setValue("pollStatus", pollStatus ? "Online" : "Offline", { escapeHtml : false });
	}

	// Make a remote call to add an attribute on the ScriptSession.
	// Only clients that have this attribute set will receive updates.	  
	function addAttributeToScriptSession() {
		PeopleTable.addAttributeToScriptSession();
	}

	// Make a remote call to remove an attribute from the ScriptSession.
	// Clients that call this will no longer receive updates (unless addAttributeToScriptSession is called again).	  	  
	function removeAttributeToScriptSession() {
		PeopleTable.removeAttributeToScriptSession();
	}
</script>
</head>
<body>
	<input type="button" value="Enable page updates" onclick="addAttributeToScriptSession();" />
	<input type="button" value="Disable page updates" onclick="removeAttributeToScriptSession();" />
	<table>
		<thead>
			<th>Id</th>
			<th>Name</th>
			<th>Address</th>
			<th>Age</th>
			<th>Is Superhero?</th>
		</thead>
		<tbody id="peopleTable"></tbody>
	</table>
</body>
</html>