package com.codegym.customerlistjsp.model;

import java.util.Date;

public class Customer {
    private int id;
    private String fullName;
    private Date birthDay;
    private String address;
    private String img;

    public Customer(int id, String fullName, Date birthDay, String address, String img) {
        this.id = id;
        this.fullName = fullName;
        this.birthDay = birthDay;
        this.address = address;
        this.img = img;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Date getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(Date birthDay) {
        this.birthDay = birthDay;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "id=" + id +
                ", fullName='" + fullName + '\'' +
                ", birthDay=" + birthDay +
                ", address='" + address + '\'' +
                ", img='" + img + '\'' +
                '}';
    }
}
