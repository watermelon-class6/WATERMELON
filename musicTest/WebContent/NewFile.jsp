<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.File" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = application.getRealPath("/sound");
	File dir = new File(path);
	File[] files = dir.listFiles();
		
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="description" content="Responsive &amp; Touch-Friendly Audio Player" />
		<meta name="author" content="Osvaldas Valutis, www.osvaldas.info" />
		<meta name="viewport" content="width=device-width,initial-scale=1" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" href="css/audioplayer.css" />
<title>Insert title here</title>
<style type="text/css">
	#footer{
   	 width: 100%; 
   	background-image: none;
    background-repeat: repeat;
    background-attachment: scroll;
    background-position: 0% 0%;
    position: fixed;
    bottom: 0pt;
    left: 0pt;
	}
</style>
</head>
<body>
	<%=path %><br>
<%
	for(File f : files){
		String fname = f.getName();
		%>
		<div id="footer">
		<div id="wrapper">
		<audio controls="controls" src="sound/<%=fname %>">
		</audio>
		<script src="js/jquery.js"></script>
			<script src="js/audioplayer.js"></script>
			<script>$( function() { $( 'audio' ).audioPlayer(); } );</script>

		</div>
		</div>
		<% 
	}

%>
</body>
</html>