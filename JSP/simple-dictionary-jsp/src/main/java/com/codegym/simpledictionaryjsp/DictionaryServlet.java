package com.codegym.simpledictionaryjsp;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "DictionaryServlet", value = "/dictionary")
public class DictionaryServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher req = request.getRequestDispatcher("/dictionary.js");
        req.forward(request,response);
    }

    public void destroy() {
    }
}