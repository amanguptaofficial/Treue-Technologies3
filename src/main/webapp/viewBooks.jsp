<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.BookDAOImpl"%>
<%@page import="com.dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>viewDetails</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_component/navbar.jsp"%>
	<%
		int id = Integer.parseInt(request.getParameter("bid"));
		BookDAO dao = new BookDAOImpl(DBConnect.getConnection());
		BookDetails b = dao.getBookById(id);
	%>

	<div class="container p-3">
		<div class="row ">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="books/<%=b.getPhoto()%>"
					style="height: 150px; width: 150px;"><br>
				<h4 class="mt-2">
					Book Name: <span class="text-success"><%=b.getBookName()%></span>
				</h4>
				<h4>
					Author Name: <span class="text-success"><%=b.getAuthor()%></span>
				</h4>
				<h4>
					Categories: <span class="text-success"><%=b.getBookCategory()%></span>
				</h4>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookName()%></h2>

				<%
					if ("Old".equals(b.getBookCategory())) {
				%>


				<h5 class="text-primary">Contact To Seller</h5>
				<h5 class="text-primary">
					Email:<i class="fa-solid fa-envelope"></i> <%=b.getEmail()%></h5>

				<%
					}
				%>


				<div class="row ">
					<div class="col-md-4 text-danger text-center  p-2">
						<i class="fa-solid fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center  p-2">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center  p-2">
						<i class="fa-solid fa-truck fa-2x"></i>
						<p>Free Shipping</p>
					</div>
				</div>
				
				<%
				 if("Old".equals(b.getBookCategory()))
				 {%>
				 <div class=" text-center p-2">
					<a href="index.jsp" class="btn btn-success"><i
						class="fa-solid fa-cart-shopping"></i> Continue Shopping</a> <a href=""
						class="btn btn-danger"><i
						class="fa-solid fa-indian-rupee-sign"></i> 200</a>
				</div>	 
				
				
				<% }else{%>
				
				<div class=" text-center p-2">
					<a href="" class="btn btn-primary"><i
						class="fa-solid fa-cart-shopping"></i> Add Cart</a> <a href=""
						class="btn btn-danger"><i
						class="fa-solid fa-indian-rupee-sign"></i> 200</a>
				</div>
			 <%} %>	
			</div>
		</div>
	</div>

</body>
</html>