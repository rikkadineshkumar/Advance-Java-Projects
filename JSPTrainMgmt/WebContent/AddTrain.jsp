<%@ page import="java.util.*,database.TrainDAO,beans.Train" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
td{
	align-content: center;
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
<title>Add Train(Admin)</title>
</head>
<body>

<jsp:useBean id="addtrain" class="beans.Train" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="addtrain" />
<%
	try{
		if(request.getParameter("addTrain").equals("AddTrain")){
			TrainDAO.addTrain(addtrain);
		}	
	}catch(Exception e){
		
	}

	String uName;
	boolean flag=false;
	
	if(session.getAttribute("uName").equals("")){
		RequestDispatcher rd = request.getRequestDispatcher("index.html");
		rd.forward(request, response);
	}else{
		uName = (String) session.getAttribute("uName");
		
		ArrayList<Train> tlist = TrainDAO.getAllTrain();	
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
				<a href="TrainSearch.jsp">Search Train</a><br>
				<a href="ShowAllTrain.jsp">All Train</a>
			</td>
			<td align="center" colspan="2">
				<form action="AddTrain.jsp" method="post">
				<input type="hidden" name="ddd" value="add" >
				<table>
					<tr>
						<td>Train No.</td>
						<td><input type="number" name="tNo" required="required"></td>
					</tr>
					<tr>
						<td>Train Name</td>
						<td><input type="text" name="tName" required="required"></td>
					</tr>
					<tr>
						<td>Station From</td>
						<td><input type="text" name="sFrom" required="required"></td>
					</tr>
					<tr>
						<td>Station To</td>
						<td><input type="text" name="sTo" required="required"></td>
					</tr>
					<tr>
						<td>Available</td>
						<td><input type="text" name="available" required="required"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" name="addTrain" value="AddTrain"></td>
					</tr>
				</table>
				</form>
				<% 
				try{
					if(request.getParameter("addTrain").equals("AddTrain")){
						out.println("<h3>Train Added Sucessfully !</h3>");
					}
				}catch(Exception e){
					
				}
				 %>
			</td>
		</tr>
		<tr>
		<td></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
		</tr>
	</table>
	<% }//end of if(no Http session found) %>
</body>
</html>