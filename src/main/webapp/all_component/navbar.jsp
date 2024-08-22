<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<div class="container-fluid"
	style="height: 10px; background-color: #303f9f"></div>


<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-3 text-success">
			<h3>
				<i class="fas fa-book"></i> EBooks Store
			</h3>
		</div>
		<div class="col-md-5">
			<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
				<input class="form-control mr-sm-2" type="search" name="ch"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>

		<c:if test="${not empty userobj }">
			<div class="col-md-4 ">

				<a href="checkout.jsp" class="btn btn-secondary mr-1"><i
					class="fas fa-cart-plus mr-1"></i>Cart</a> <a href="login.jsp"
					class="btn btn-success mr-1"><i class="fas fa-user mr-1"></i>${userobj.name}</a>
				<a href="logout" class="btn btn-primary text-white"><i
					class="fas fa-sign-in-alt mr-1"></i>Logout</a>
			</div>
		</c:if>

		<c:if test="${empty userobj }">
			<div class="col-md-3">
				<a href="login.jsp" class="btn btn-success mr-2"><i
					class="fas fa-sign-in-alt mr-1"></i>Login</a> <a href="register.jsp"
					class="btn btn-primary text-white"><i
					class="fas fa-user-plus mr-1"></i></i>Register</a>
			</div>
		</c:if>

	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="#"><i class="fas fa-home"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_recent_books.jsp"><i class="fas fa-book-open"></i>
					Recent Books </a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_new_books.jsp"><i class="fas fa-book-open"></i> New
					Books </a></li>
			<li class="nav-item active"><a class="nav-link disabled"
				href="all_old_books.jsp"><i class="fas fa-book-open"></i> Old
					Books </a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">

			<a href="setting.jsp" class="btn btn-light my-2 my-sm-0"
				type="submit"> <i class="fas fa-cog"></i> Settings
			</a> <a href="helpline.jsp">
				<button class="btn btn-light my-2 my-sm-0 ml-3" type="submit">
					<i class="fas fa-phone-square-alt"></i>Contact Us
				</button>
			</a>
		</form>
	</div>
</nav>