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
<title>Admin:Add-Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2">
	<%@include file="navbar.jsp"%>
	<div class="container p-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body ">
						<h4 class="text-center">Edit  Books</h4>
		
		<c:if test="${not empty succMsg}">
		<p class="text-center text-success">${succMsg}</p>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty failMsg}">
		<p class="text-center text-danger">${failMsg}</p>
		<c:remove var="failMsg" scope="session" />
	</c:if>
						
                 
                 
                 
                 <%
                  int Id=Integer.parseInt(request.getParameter("id"));
                    System.out.println(Id);
                   BookDAO dao= new BookDAOImpl(DBConnect.getConnection());
                      BookDetails bd= dao.getBookById(Id);
                        //System.out.println(bd.getBookId());
                 %>
						
						
						<form action="../editbooks" method="post">
						<input type="hidden" name="ourId" value="<%=bd.getBookId() %>">	
							
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*<%=bd.getBookId()%></label> <input
									type="text" name="bname" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=bd.getBookName()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Author Name*</label> <input
									type="text" name="author" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=bd.getAuthor() %>">
							</div>
							<div class="form-group">
								<label for="inputState">Price*</label> <input type="number"
									name="price" class="form-control" id="exampleInputEmail1" value="<%=bd.getPrice()%>">
							</div>

							

							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									name="bstatus" class="form-control" id="inputState">
								    <%if("Active".equals(bd.getStatus()))
								    {%>
								     <option>Active</option>
								     <option>Inactive</option>	
								    <% } 
								    else{
								    	%>
								    	   <option>InActive</option>
								    		<option>Active</option>
								   <%  }   %>	
								
									

								</select>
							</div>

							
							<button type="submit" class="btn btn-primary">Update</button>
						</form>


					</div>
				</div>
			</div>

		</div>


	</div>

	<div>
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>