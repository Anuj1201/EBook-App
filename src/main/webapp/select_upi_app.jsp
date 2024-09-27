<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Payments</title>

<%@include file="all_component/allCSS.jsp"%>
<style>
.a {
	margin-top: 5px;
	border-radius: 8px;
	width: auto;
	text-align: center;
}

.container {
	display: flex;
	justify-content: center;
	align-items: center;
}

#pay {
	display: flex;
	justify-content: center;
	align-items: center;
}

.icon {
	padding-left: 25px;
	background:
		url("https://fontawesome.com/icons/indian-rupee-sign?f=classic&s=solid")
		no repeat left;
	background-size: 50px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body style="background-color: #f0f1f2;">

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<div>
		<p class="mb-3 text-center a"
			style="color: #d1001f; font: message-box;">WARNING!! Do not go
			back until payment is successful..</p>
	</div>


	<div class="container">
		<div class="card text-center"
			style="width: 20rem; height: 22rem; border-radius: 30px; border-width: 0; background-color: #f0f1f2;">
			<img class="card-img p-3" src="images/razorpay.png"
				alt="Card image cap"
				style="background-color: #CADCFC; width: 100%; height: 50%; border-radius: 30px;">
			<div class="card-body">
				<%
				User u = (User) session.getAttribute("userobj");
				CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());

				List<Cart> cart = dao.getBookByUser(u.getId());
				Double totalPrice = 0.00;

				for (Cart c : cart) {
					totalPrice = c.getTotalPrice();
				%>

				<%
				}
				%>
				<p
					style="font-family: Verdana; border: 1px solid grey; color: blue; background-color: #D3D3D3; border-radius: 8px;">
					<strong>Make Payment Easy</strong>
				</p>

				<div class="text-center icon" id="pay">
					<input id="payment_field" value="<%=totalPrice%>"
						class="icon text-center"
						style="border: 0px; background-color: #f0f1f2;" readonly />
				</div>
				<br>
				<form action="java/com/Razorpay/PaymentServlet.java" method="POST">
					<input type="submit" value="PAY">
				</form>
			</div>
		</div>
	</div>

	<div class="text-center mt-3">
		<h3 style="color: grey; font: caption; font-family: italic;">
			<i class="fas fa-solid fa-lock mr-2"></i>Secure Payments with
			RazorPay
		</h3>
	</div>
</body>

</html>