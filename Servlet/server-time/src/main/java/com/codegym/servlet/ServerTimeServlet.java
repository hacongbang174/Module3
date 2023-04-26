package com.codegym.servlet;

import java.io.*;
import java.util.Date;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

    @WebServlet(name = "ServerTimeServlet", urlPatterns = "/index")
public class ServerTimeServlet extends HttpServlet {
    private Date date;

    public void init() {
        date = new Date();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + date + "</h1>");
        out.println("</body></html>");
    }

    public void destroy() {
    }
}