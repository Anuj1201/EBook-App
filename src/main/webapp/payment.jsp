<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment page</title>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<style>
</style>
</head>
<body>

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>


	<h1>Complete Your Payment</h1>
	<button id="rzp-button1">Pay Now</button>

	<script>
        var options = {
            "key": "rzp_test_EJIbfJyXtr3D6O", // Enter the Key ID generated from Razorpay Dashboard
            "amount": "<%= (int)(Double.parseDouble(request.getAttribute("amount").toString())) %>",
            "currency": "INR",
            "name": "Ebook-App",
            "description": "Test Transaction",
            "order_id": "<%=request.getAttribute("orderId")%>",
			"handler" : function(response) {
				alert("Payment successful with Payment ID: "
						+ response.razorpay_payment_id);
				// Optionally, you can also make an Ajax call to a server-side page to verify the payment
			},
			"theme" : {
				"color" : "#F37254"
			}
		};
		var rzp1 = new Razorpay(options);
		document.getElementById('rzp-button1').onclick = function(e) {
			rzp1.open();
			e.preventDefault();
		}
	</script>
</body>
</html>