<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.BookDAOImpl"%>
<%@page import="com.dao.BookDAO"%>
<%@page import="com.entity.BookDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:All-Books</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%> 
	<c:if test="${empty userobj}">
	 <c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<h3 class="text-center">Hello,Admin</h3>
	<c:if test="${not empty succMsg}">
		<p class="text-center text-success">${succMsg}</p>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty failMsg}">
		<p class="text-center text-danger">${failMsg}</p>
		<c:remove var="failMsg" scope="session" />
	</c:if>

	<div class="container">
		<table class="table table-striped">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Image</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Categories</th>
					<th scope="col">status</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
					BookDAO dao = new BookDAOImpl(DBConnect.getConnection());
					List<BookDetails> list = dao.getAllBooks();
					for (BookDetails b : list) {
				%>
				<tr>
					<td><%=b.getBookId()%></td>

					<td><img src="../books/<%=b.getPhoto()%>"
						style="width: 50px; height: 50px"></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getBookCategory()%></td>
					<td><%=b.getStatus()%></td>
					<td><a href="edit_books.jsp?id=<%=b.getBookId()%>"
						class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i>Edit</a> <a
						href="../delete?id=<%=b.getBookId()%>"
						class="btn btn-sm btn-danger"><i class="fa-solid fa-delete-left"></i> Delete</a></td>
				</tr>
				<%
					}
				%>






			</tbody>
		</table>
	</div>
	<div style="margin-top: 270px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>