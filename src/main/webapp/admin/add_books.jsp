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
	<c:if test="${empty userobj}">
	 <c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<div class="container p-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body ">
						<h4 class="text-center">Add Books</h4>
						<c:if test="${not empty succMsg}">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<c:if test="${not empty failMsg}">
							<p class="text-center text-danger">${failMsg}</p>
							<c:remove var="failMsg" scope="session" />
						</c:if>

						<form action="../add_books" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									type="text" name="bname" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Author Name*</label> <input
									type="text" name="author" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="inputState">Price*</label> <input type="number"
									name="price" class="form-control" id="exampleInputEmail1">
							</div>

							<div class="form-group">
								<label for="inputState">Book categories</label> <select
									name="btype" class="form-control" id="inputState">
									<option>---select----</option>
									<option>New Book</option>

								</select>
							</div>

							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									name="bstatus" class="form-control" id="inputState">
									<option>---select----</option>
									<option>Active</option>
									<option>Inactive</option>

								</select>
							</div>

							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo*</label> <input
									type="file" name="bimg" class="form-control-file"
									id="exampleInputControlFile1">
							</div>
							<button type="submit" class="btn btn-primary">Add</button>
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