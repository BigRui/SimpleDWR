<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type='text/javascript' src='${pageContext.request.contextPath }/dwr/engine.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath }/dwr/util.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath }/dwr/interface/JavascriptChat.js'></script>
<script type="text/javascript">
	function init() {
		dwr.engine.setActiveReverseAjax(true);
	}

	function sendMessage() {
	  	var text = dwr.util.getValue("text");
	  	dwr.util.setValue("text", "");
	  	JavascriptChat.addMessage(text);
	}

	function receiveMessages(messages) {
	  	var chatlog = "";
	  	for (var data in messages) {
	    	chatlog = "" + dwr.util.escapeHtml(messages[data].text) + "" + chatlog;
	  }
	  dwr.util.setValue("chatlog", chatlog, { escapeHtml:false });
	}
</script>
</head>
<body>
<p>
	Your Message:
  	<input id="text" onkeypress="dwr.util.onReturn(event, sendMessage)"/>
  	<input type="button" value="Send" onclick="sendMessage()"/>
</p>
<hr/>
<div id="chatlog"></div>
</body>
</html>