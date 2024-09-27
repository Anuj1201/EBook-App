package com.Razorpay;

import org.json.JSONObject;

import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@SuppressWarnings("serial")
@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            RazorpayClient razorpay = new RazorpayClient("rzp_test_EJIbfJyXtr3D6O", "AvEhWadR12VNREeJHONndaqe");
            
            String totalPrice = (String) request.getAttribute("totalPrice");

            double amountInPaise = (Double.parseDouble(totalPrice)) * 100;
            
            // Prepare the order parameters
            JSONObject orderRequest = new JSONObject();
            orderRequest.put("amount", amountInPaise);
            orderRequest.put("currency", "INR");
            orderRequest.put("receipt", "order_rcptid_11");
            orderRequest.put("payment_capture", 1); // automatic capture

            // Create order
            Order order = razorpay.orders.create(orderRequest);

            // Send order ID and other details to JSP
            request.setAttribute("orderId", order.get("id"));
            request.setAttribute("amount", totalPrice); // Amount in INR
            RequestDispatcher dispatcher = request.getRequestDispatcher("payment.jsp");
            dispatcher.forward(request, response);

        } catch (RazorpayException e) {
            e.printStackTrace();
        }
    }
}
