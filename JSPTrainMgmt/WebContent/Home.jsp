<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
td{
	margin: 40px;
}
input{
	margin: 20px;
	border-style: none;
	font-family: sans-serif;
	background-color: #9fd356;
	color: #342E37;
	border-radius: 20px;
	padding: 10px;
}
body{
 	font-family: sans-serif; 
 	font-weight: bold; 
 	background-color: #3c91e6;
}
h1{
 	font-weight: bold; 
 	background-color: #3c91e6;
 	color: #FAFFFD; 
 	font-size:50px;
}
h3{
 	font-weight: bold; 
 	background-color: #3c91e6;
 	color: #FAFFFD; 
 	font-size:20px;
}
a{
	border-style: none;
	font-weight: bold;
	margin: 10px;
	color:#342E37;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<%
	String uName;

	if(session.getAttribute("uName").equals("")){
		RequestDispatcher rd = request.getRequestDispatcher("index.html");
		rd.forward(request, response);
	}else{
		uName = (String) session.getAttribute("uName");
	
	
%>
	<table width="100%" height="100%" >
			<tr>
				<td colspan="3" align="center">
					<h1 style="color: lime; ">Train Search Home</h1>
					<h3>Welcome <% out.println(uName); %></h3>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td style="align-content:left;"><a href="logout">LOGOUT</a></td>
			</tr>
			
			<tr>
				<td align="center">
					<a href="ShowAllTrain.jsp" >Show All Train</a><br>
					<%
					if(session.getAttribute("loginType").equals("admin")){
						out.println("<a href=\"AddTrain.jsp\">add Train</a>");	
					}
				%>
				</td>
				<td align="center" colspan="2">
					<form action="TrainSearch.jsp" method="post">
						<strong>From</strong> <input type="text" name="sFrom"> 
						&nbsp;<strong>To</strong><input type="text" name="sTo"><br>
						<input type="submit" value="search" name="search">
					</form>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
	</table>
	<% } %>
</body>
</html>