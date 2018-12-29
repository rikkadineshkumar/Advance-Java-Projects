<%@page import="java.util.*,java.lang.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="styles.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopping Home</title>
</head>
<body>
<jsp:useBean id="cartProducts" class="java.util.ArrayList" scope="session" ></jsp:useBean>
<%
		

	cartProducts = new ArrayList<beans.Product>();
	System.out.println("ArrayList status in HOME.JSP ::"+cartProducts.isEmpty());
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
					<h1 style="color: lime; ">Products Home</h1>
					<h3>Welcome <% out.println(uName); %></h3>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td class="logout"><a href="logout">LOGOUT</a></td>
			</tr>
			
			<tr>
				<td align="center">
					<ol>
						<li><a href="ShowAllProduct.jsp" >Show All Products</a></li>
						<li><a href="ShowCart.jsp" >Show Cart</a></li>
						<%
						if(session.getAttribute("loginType").equals("admin")){
							out.println("<li><a href=\"AddProduct.jsp\">Add Product</a></li>");
							out.println("<li><a href=\"UpdateProduct.jsp\">Update Product</a></li>");
						}
						%>
					</ol>
				</td>
				<td align="center" colspan="2">
					<form action="ProductSearch.jsp" method="post">
						<p>Product Search</p><input placeholder="Search Products.." type="text" name="keyWord"> 
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