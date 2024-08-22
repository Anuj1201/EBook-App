<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Books</title>
<%@include file="allCSS.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>
	
	<h3 class="text-center m-3">Hello Admin</h3>

	<c:if test="${not empty succMsg }">
		<h5 class="text-center text-success">${succMsg }</h5>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<h5 class="text-center text-danger">${failedMsg }</h5>
		<c:remove var="failedMsg" scope="session" />
	</c:if>


	<table class="table table-striped ">
		<thead class="bg-dark text-white">
			<tr>
				<th scope="col" class="text-center">ID</th>
				<th scope="col" class="text-center">Image</th>
				<th scope="col" class="text-center">Book Name</th>
				<th scope="col" class="text-center">Author</th>
				<th scope="col" class="text-center">Price</th>
				<th scope="col" class="text-center">Category</th>
				<th scope="col" class="text-center">Status</th>
				<th scope="col" class="text-center">Action</th>
			</tr>
		</thead>
		<tbody>

			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDetails> list = dao.getAllBooks();

			for (BookDetails b : list) {
			%>
			<tr>
				<td class="text-center"><%=b.getBookId()%></td>
				<td class="text-center"><img
					src="../book/<%=b.getPhotoName()%>"
					style="width: 50px; height: 50px;"></td>
				<td class="text-center"><%=b.getBookName()%></td>
				<td class="text-center"><%=b.getAuthor()%></td>
				<td class="text-center"><%=b.getPrice()%>/-</td>
				<td class="text-center"><%=b.getBookCategory()%></td>
				<td class="text-center"><%=b.getStatus()%></td>
				<td class="text-center"><a
					href="edit_books.jsp?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-primary"><i class="fas fa-edit mr-1"></i>Edit</a> <a
					href="../delete?id=<%=b.getBookId()%>" class="btn btn-sm btn-danger ml-1"><i class="fas fa-trash-alt mr-1"></i>Delete</a></td>
			</tr>

			<%
			}
			%>



		</tbody>
	</table>
	<div style="margin-top: 130px;">
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>