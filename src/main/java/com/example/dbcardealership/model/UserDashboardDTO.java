package com.example.dbcardealership.model;

public interface UserDashboardDTO extends UserDTO {
    Integer getOrdersCount();
    Double getOrdersTotal();
}
