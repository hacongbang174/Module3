package com.codegym.customerlistjsp.controller;

import com.codegym.customerlistjsp.model.Customer;
import com.codegym.customerlistjsp.service.CustomerService;
import com.codegym.customerlistjsp.service.CustomerServiceMysql;

import java.io.*;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "CustomersServlet", value = "/customer")
public class CustomersServlet extends HttpServlet {
    private CustomerService customerService;

    public void init() {
        customerService = new CustomerServiceMysql();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<Customer> customers = customerService.findAll();

        request.setAttribute("customers", customers);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        requestDispatcher.forward(request, response);
    }
    public void destroy() {
    }
}