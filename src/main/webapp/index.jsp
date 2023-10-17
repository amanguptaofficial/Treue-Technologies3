<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.BookDAOImpl"%>
<%@page import="com.dao.BookDAO"%>
<%@page import="com.entity.BookDetails"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook: Index</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.bac-img {
	background: url("images/finalback.jpg");
	height: 50vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body style="background-color: #f7f7f;">
	<%@include file="all_component/navbar.jsp"%>
	
<%
User u=(User)session.getAttribute("userobj");
%>	
	

	<div class="container-fluid bac-img">
		<h2 class="text-center text-danger">EBook Management System</h2>

	</div>

	<!-- Start New  Book -->
	<div class="container">
		<h3 class="text-center">New Book</h3>
		<div class="row">


			<%
				BookDAO dao = new BookDAOImpl(DBConnect.getConnection());
				List<BookDetails> list = dao.getNewBook();
				for (BookDetails b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img id="image-1" alt="" src="books/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumbnail">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:<%=b.getBookCategory()%></p>
							<div class="row">
							<% if(u==null){%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>
								
							<%} else{%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%> " class="btn btn-danger btn-sm ml-2">Add Cart</a>
							
							<%} %>
							 <a href="viewBooks.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-1">View Details</a> 
							 <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%>
								<i class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>

		</div>
		<div class="text-center mt-1">
			<a href="All_NewBook.jsp" class="btn btn-danger btn-sm">View All</a>
		</div>

	</div>
	<!-- End  New Book -->

	<hr>

	<!-- Start Recent Book -->
	<div class="container">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">
			<%
				BookDAO dao2 = new BookDAOImpl(DBConnect.getConnection());
				List<BookDetails> lists = dao2.getRecentBooks();
				for (BookDetails b : lists) {
			%>

			<div class="col-md-3">

				<div class="card crd-ho">
					<div class="card-body text-center">
						<img id="image-1" alt="" src="books/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumbnail">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							<%
								if (b.getBookCategory().equals("Old")) {
							%>
							Categories:<%=b.getBookCategory()%></p>

						<div class="row">
							<a href="viewBooks.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-5">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
						</div>

						<%
							} else {
						%>
						Categories:<%=b.getBookCategory()%></p>
						<div class="row">
				 		<% if(u==null){%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>
								
							<%} else{%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%> " class="btn btn-danger btn-sm ml-2">Add Cart</a>
							
							<%} %>
						
							 
							<a href="viewBooks.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-1">View Details</a> 
							<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
						</div>

						<%
							}
						%>

					</div>
				</div>
			</div>
			<%
				}
			%>

		</div>
		<div class="text-center mt-1">
			<a href="All_RecentBook.jsp" class="btn btn-danger btn-sm">View All</a>
		</div>

	</div>
	<!-- End  Recent Book -->

	<hr>
	<!-- Start old Book -->
	<div class="container">
		<h3 class="text-center">old Book</h3>
		<div class="row">
			<%
				BookDAO dao3 = new BookDAOImpl(DBConnect.getConnection());
				List<BookDetails> list3 = dao3.getOldBooks();
				for (BookDetails b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img id="image-1" alt="" src="books/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumbnail">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:<%=b.getBookCategory()%></p>
						<div class="row">
							<a href="viewBooks.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-5">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1">299</a>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="All_OldBook.jsp" class="btn btn-danger btn-sm ">View All</a>
		</div>

	</div>
	<!-- End  Old Book -->
	<%@include file="all_component/footer.jsp"%>
</body>
</html>