<%@page import="beans.CartProduct"%>
<%@ page import="java.util.*,database.ProductDAO,beans.Product" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="styles.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Product Cart</title>
</head>
<body>
<jsp:useBean id="cartProducts" type="java.util.ArrayList" scope="session" ></jsp:useBean>
<%

	/* try{
		if(request.getParameter("Add To Cart").equals("Add To Cart")){
			String cartProductId[] = request.getParameterValues("products");
			for(int i=0 ; i<cartProductId.length ; i++){
				cartProducts.put(ProductDAO.getProductsById(cartProductId[i]),cartProductId[i]);
			}
			//for()
		}	
	}catch(Exception e){
		
	} */
	System.out.println("Hashmap status in SHOWCART.JSP ::"+cartProducts.isEmpty());
	String uName;
	boolean flag=false;
	
	if(session.getAttribute("uName").equals("")){
		RequestDispatcher rd = request.getRequestDispatcher("index.html");
		rd.forward(request, response);
	}else{
		uName = (String) session.getAttribute("uName");
%>
	<table width="100%" height="100%" >
		<tr>
			<td colspan="3" align="center">
				<h1 style="color: lime; ">All Product</h1>
				<h3>Welcome <% out.println(uName); %></h3>
			</td>
		</tr>
		<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td class="logout" ><a href="logout">LOGOUT</a></td>
			</tr>
		<tr>
			<td align="center">
				<ol>
						<li><a href="Home.jsp" >Home</a></li>
						<li><a href="ProductSearch.jsp">Product Search</a></li>
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
				<table>
					<form action="Payment.jsp" method="post">
						<tr>				
							<th>Product No.</th>
							<th>Product Name</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>Required Quantity</th>
						</tr>
						<%
						if(cartProducts.isEmpty()){	
							out.println("<tr><td colspan=\"5\">No Products added to Cart</td></tr>");	
						}else{
 								for(int i=0 ; i <cartProducts.size() ; i++){
								CartProduct cp = (CartProduct) cartProducts.get(i) ;
								out.println("<tr>");								
								out.println("<td>"+cp.getpId()+"</td>");
								out.println("<td>"+cp.getpName()+"</td>");
								out.println("<td>"+cp.getpPrice()+"</td>");
								out.println("<td>"+cp.getpQty()+"</td>");
								out.println("<td>"+cp.getReqPQty()+"</td>");
								out.println("</tr>");
 							}
							/* 
							Set< Map.Entry< Product,Integer> > st = cartProducts.entrySet();
							for (Map.Entry< Product,Integer> me: st) 
						       { 
						           Product p = (Product) me.getKey(); 
						           out.println("<tr>");
									out.println("<td><input type=\"checkbox\" name=\"products\" value=\""+p.getpId()+"\" >");
									out.println("<td>"+p.getpId()+"</td>");
									out.println("<td>"+p.getpName()+"</td>");
									out.println("<td>"+p.getpPrice()+"</td>");
									out.println("<td>"+p.getpQty()+"</td>");
									out.println("<td>"+me.getValue()+"</td>");
									out.println("</tr>");
						       }  */
							
							out.println("<tr><td><input type=\"submit\" value=\"Go for Payment\" name=\"Go for Payment\"></td></tr>");
						}//end of if ( empty array )
						%>
					</form>
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