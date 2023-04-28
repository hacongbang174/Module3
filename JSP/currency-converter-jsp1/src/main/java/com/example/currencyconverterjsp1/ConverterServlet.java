package com.example.currencyconverterjsp1;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ConverterServlet", urlPatterns = "/convert")
public class ConverterServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/converter.jsp");
        rd.forward(request,response);

//        float rate = Float.parseFloat(request.getParameter("rate"));
//        float usd = Float.parseFloat(request.getParameter("usd"));
//
//        float vnd = rate * usd;
//
//        PrintWriter writer = response.getWriter();
//        writer.println("<html>");
//        writer.println("<h1>Rate: " + rate + "</h1>");
//        writer.println("<h1>USD: " + usd + "</h1>");
//        writer.println("<h1>VND: " + vnd + "</h1>");
//        writer.println("</html>");
    }

    public void destroy() {
    }
}