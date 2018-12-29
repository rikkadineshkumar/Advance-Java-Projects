<%@ page import="java.util.*,database.ProductDAO,beans.Product" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="styles.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Product(Admin)</title>
</head>
<body>

<jsp:useBean id="addProduct" class="beans.Product" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="addProduct" />
<%
	try{
		if(request.getParameter("addProduct").equals("AddProduct")){
			ProductDAO.addProduct(addProduct);
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
		
		ArrayList<Product> plist = ProductDAO.getAllProducts();	
%>
	<table width="100%" height="100%" >
		<tr>
			<td colspan="3" align="center">
				<h1 style="color: lime; ">Add Product to Database</h1>
				<h3>Welcome <% out.println(uName); %></h3>
			</td>
		</tr>
		<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td class="logout"><a href="logout">LOGOUT</a></td>
		</tr>
		<tr>
			<ol>
						<li><a href="Home.jsp" >Home</a></li>
						<li><a href="ProductSearch.jsp">Product Search</a></li>
						<li><a href="ShowCart.jsp" >Show Cart</a></li>
						<%
						if(session.getAttribute("loginType").equals("admin")){
							out.println("<li><a href=\"UpdateProduct.jsp\">Update Product</a></li>");
						}
						%>
			</ol>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<% 
				try{
					if(request.getParameter("addProduct").equals("AddProduct")){
						out.println("<h3>Product Added Sucessfully !</h3>");
					}
				}catch(Exception e){
					
				}
				 %>
				<form action="AddProduct.jsp" method="post">
				<table>
					<tr>
						<td>Product No.</td>
						<td><input type="number" name="pId" required="required"></td>
					</tr>
					<tr>
						<td>Product Name</td>
						<td><input type="text" name="pName" required="required"></td>
					</tr>
					<tr>
						<td>Product Price</td>
						<td><input type="number" name="pPrice" required="required"></td>
					</tr>
					<tr>
						<td>Quantity</td>
						<td><input type="number" name="pQty" required="required"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" name="addProduct" value="AddProduct"></td>
					</tr>
				</table>
				</form>
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