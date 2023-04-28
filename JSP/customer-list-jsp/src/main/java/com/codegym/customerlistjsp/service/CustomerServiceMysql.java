package com.codegym.customerlistjsp.service;

import com.codegym.customerlistjsp.model.Customer;
import com.codegym.customerlistjsp.utils.DateFormatString;

import java.sql.*;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.List;

public class CustomerServiceMysql extends DBContext implements CustomerService{
    private static final String SELECT_ALL_CUSTOMER = "SELECT * FROM customer";

    @Override
    public List<Customer> findAll() {
        List<Customer> customers = new ArrayList<>();

        Connection connection = getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER);
//            Statement statement = connection.createStatement();
//            ResultSet rs = statement.executeQuery(SELECT_ALL_CUSTOMER);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                // Luôn lấy theo column label
                Customer customer = getCustomerFromResultSet(rs);
                customers.add(customer);
            }
//            preparedStatement.close();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customers;
    }

    private Customer getCustomerFromResultSet(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String fullName = rs.getString("fullName");
        Date birthDay = rs.getDate("birthDay");
        String address = rs.getString("address");
        String image = rs.getString("img");
        //public Customer(long id, String name, String email,
        //                    String address, String image, Date createAt)
        //int id, String fullName, Date birthDay, String address, String img
        Customer customer = new Customer(id, fullName, birthDay, address, image);
        return customer;
    }

//    public static void main(String[] args) {
//        CustomerServiceMysql customerServiceMysql = new CustomerServiceMysql();
//        List<Customer> customers = customerServiceMysql.findAll();
//        for (Customer customer : customers) {
//            System.out.println(customer);
//        }
//    }
}
