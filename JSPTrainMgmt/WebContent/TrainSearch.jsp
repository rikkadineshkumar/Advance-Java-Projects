<%@ page import="java.util.*,database.TrainDAO,beans.Train" language="java" contentType="text/html; charset=ISO-8859-1"
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
.inner{
	border-radius: 10px ;
	font-family: serif;
	font-style: normal;
	font-size: 30px;
	background-color : #F94A4A;
	 border: 1px solid black;
}
th, td {
    padding: 15px;
}
a{
	border-style: none;
	font-weight: bold;
	margin: 10px;
	color:#342E37;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Train Search</title>
</head>
<body>
<%
	String uName;
	boolean flag=false;

	if(session.getAttribute("uName").equals("")){
		RequestDispatcher rd = request.getRequestDispatcher("index.html");
		rd.forward(request, response);
	}else{
		uName = (String) session.getAttribute("uName");
		
		String sFrom = request.getParameter("sFrom");
		String sTo = request.getParameter("sTo");
		
		ArrayList<Train> tlist = TrainDAO.getTrain(sFrom, sTo);	
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
				<a href="ShowAllTrain.jsp">Show All Train</a><br>
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
				<table>
					<tr>
						<th>Train No.</th>
						<th>Train Name</th>
						<th>Station From</th>
						<th>Station To</th>
						<th>Available</th>
					</tr>
					<%
					if(tlist.isEmpty()){	
						out.println("<tr><td colspan=\"5\">No Trains Available</td></tr>");	
					}else{
				
						for(int i=0 ; i < tlist.size();i++){
							Train t = (Train) tlist.get(i);
							out.println("<tr>");
							out.println("<td>"+t.gettNo()+"</td>");
							out.println("<td>"+t.gettName()+"</td>");
							out.println("<td>"+t.getsFrom()+"</td>");
							out.println("<td>"+t.getsTo()+"</td>");
							out.println("<td>"+t.getAvailable()+"</td>");
							out.println("</tr>");
							}
					}//end of if ( empty array )
					%>
				</table>
			</td>
		</tr>
		<tr>
		<td></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
		</tr>
	</table>
	<%}//end of if(no Http session found) %>
</body>
</html>