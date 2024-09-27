<%@page import="com.entity.User"%>
<%@page import="com.entity.BookOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Orders</title>
<%@include file="allCSS.jsp"%>
</head>
<body>

	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>

	<%@include file="navbar.jsp"%>
	<h3 class="text-center m-3">Hello Admin</h3>
	<table class="table table-striped text-center">
		<thead class="bg-dark text-white">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Ph no</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment type</th>
			</tr>
		</thead>
		<tbody>

			<%
			User u = (User) session.getAttribute("userobj");
			BookOrderDAOImpl dao = new BookOrderDAOImpl(DBConnect.getConn());
			List<BookOrder> blist = dao.getAllOrders();

			for (BookOrder b : blist) {
			%>

			<tr>
				<th scope="row"><%=b.getOrderId()%></th>
				<td><%=b.getUsername()%></td>
				<td><%=b.getEmail()%></td>
				<td><%=b.getFullAdd()%></td>
				<td><%=b.getPhno()%></td>
				<td><%=b.getBookName()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getPaymentType()%></td>
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