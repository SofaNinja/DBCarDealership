package com.example.dbcardealership.model;

public interface OrderDTO {
    Integer getOrderId();
    String getFullName();
    String getEmail();
    String getStatus();
    Integer getCarId();
    String getModel();
    Double getPrice();
    String getImage();
    Integer getYear();
    Double getPower();
    String getColor();
    String getBodyType();
}
