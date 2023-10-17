<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid"
	style="height: 10px; background-color: #303f9f"></div>

<div class="container-fluid p-3 bg-light">
	<div class="row">

		<div class="col-md-3 text-success">
			<h3>
				<i class="fa-solid fa-book"></i>Ebooks
			</h3>
		</div>

		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search Here" area-label="search">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">
					<i class="fa-solid fa-magnifying-glass"></i> Search
				</button>
			</form>
		</div>
	 <c:if test="${not empty userobj}">
	   <div class="col-md-3">
	   
			<a href="cart.jsp"><i class="fa-solid fa-cart-shopping fa-2x"></i>Cart</a>
			<a href="login.jsp" class="btn btn-success">
				<i class="fa-solid fa-user"></i> ${userobj.name}</a> 
				
				<a href="" class="btn btn-primary text-white"><i
				class="fa-solid fa-right-to-bracket"></i> Logout</a>
		</div>
		</c:if>
	<c:if test="${empty  userobj}">
	   <div class="col-md-3">
			<a href="login.jsp" class="btn btn-success"><i
				class="fa-solid fa-user-plus"></i> Login</a> <a href="Register.jsp"
				class="btn btn-primary text-white"><i
				class="fa-solid fa-right-to-bracket"></i> Register</a>
		</div>
	</c:if>
		
	</div>


</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">
					Home <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link" href="All_RecentBook.jsp"><i
					class="fa-solid fa-book-open"></i> Recent Book</a></li>

			<li class="nav-item active"><a class="nav-link disabled"
				href="All_NewBook.jsp"><i class="fa-solid fa-book-open"></i> New Book</a>
			<li class="nav-item active"><a class="nav-link disabled"
				href="All_OldBook.jsp"><i class="fa-solid fa-book-open"></i> old Book</a>
		</ul>

		<form class="form-inline my-2 my-lg-0">
			<button class="btn btn-light my-2 my-sm-0" type="submit">
				<i class="fa-solid fa-gear"></i> Setting
			</button>
			<button class="btn btn-light my-2 my-sm-0 ml-1" type="submit">
				<i class="fa-sharp fa-solid fa-phone"></i> Contact Us
			</button>
		</form>
	</div>
</nav>