package com.codegym.customerlistjsp.service;

import com.codegym.customerlistjsp.model.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> findAll();

}
