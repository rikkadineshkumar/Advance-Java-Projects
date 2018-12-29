<%@ page import="java.util.*,database.ProductDAO,beans.Product" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="styles.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Product(Admin)</title>
</head>
<body>
<%
	
	boolean updateFlag = false;

	try{
		if(request.getParameter("updateProduct").equals("Update Quantity")){
			String pId = request.getParameter("pId");
			int pQty = Integer.parseInt(request.getParameter("pQty"));
			updateFlag = ProductDAO.updateProductQty(pId,pQty);
		}	
	}catch(Exception e){
		
	}

	String uName;
	
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
				<h1 style="color: lime; ">update Product to Database</h1>
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
							out.println("<li><a href=\"AddProduct.jsp\">Add Product</a></li>");
						}
						%>
			</ol>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<% 
				try{
					if(request.getParameter("updateProduct").equals("updateProduct")){
						if(updateFlag){
							out.println("<h3>Product updateed Sucessfully !</h3>");
						}else{
							out.println("<h3 style=\"color:red;\">Failed Product updateed, please verify !</h3>");
						}
					}
				}catch(Exception e){
					
				}
				 %>
				<form action="UpdateProduct.jsp" method="post">
				<table>
					<tr>
						<td>Product No.</td>
						<td><input type="number" name="pId" required="required"></td>
					</tr>
					<tr>
						<td>Quantity</td>
						<td><input type="number" name="pQty" required="required"></td>
					</tr>
					<tr>
						<td><input type="submit" name="updateProduct" value="Update Quantity"></td>
					</tr>
				</table>
				</form>
				<table>
					<tr>
						<th>Product No.</th>
						<th>Product Name</th>
						<th>Price</th>
						<th>Quantity</th>
					</tr>
					<%
					if(plist.isEmpty()){	
						out.println("<tr><td colspan=\"4\">No Products Available</td></tr>");	
					}else{
				
						for(int i=0 ; i < plist.size();i++){
							Product p = (Product) plist.get(i);
							out.println("<tr>");
							out.println("<td>"+p.getpId()+"</td>");
							out.println("<td>"+p.getpName()+"</td>");
							out.println("<td>"+p.getpPrice()+"</td>");
							out.println("<td>"+p.getpQty()+"</td>");
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
	<% }//end of if(no Http session found) %>
</body>
</html>