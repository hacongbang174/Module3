package com.codegym.product_discount_calculator;

import java.io.*;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "DiscountServlet", value = "/display-discount")
public class DiscountServlet extends HttpServlet {
    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String description = request.getParameter("product-description");
        double price = Double.parseDouble(request.getParameter("product-price"));
        float percent = Float.parseFloat(request.getParameter("product-percent"));
        double amount = price * percent * 0.01;
        double discount_price = price - amount;

        PrintWriter writer = response.getWriter();
        writer.println("<html>");

        String product_description = URLDecoder.decode(description, "UTF-8");

        writer.println("<h1>Product Description: " + product_description + "</h1>");
        writer.println("<h3>Discount Amount: " + amount +"</h3>");
        writer.println("<h3>Discount Price: " + discount_price + "</h3>");

        writer.println("</html>");
    }

    public void destroy() {
    }
}