<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.BookDAOImpl"%>

<%@page import="com.entity.BookDetails"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Recent Book</title>
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
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
<%@include file="all_component/navbar.jsp"%>
 <div class="container-fluid">
 <div class="row p-3">
 
 	<%
				BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConnection());
				List<BookDetails> lists = dao2.getAllRecentBook();
				for (BookDetails b : lists) {
			%>

			<div class="col-md-3">

				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img id="image-1" alt="" src="books/<%=b.getPhoto()%>"
							style="width: 100px; height: 150px" class="img-thumbnail">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							<%
								if (b.getBookCategory().equals("Old")) {
							%>
							Categories:<%=b.getBookCategory()%></p>

						<div class="row">
							<a href="" class="btn btn-success btn-sm ml-5">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
						</div>

						<%
							} else {
						%>
						Categories:<%=b.getBookCategory()%></p>
						<div class="row">
							<a href="" class="btn btn-danger btn-sm ml-2">Add Cart</a> <a
								href="" class="btn btn-success btn-sm ml-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
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
 </div>
 </body>
</html>