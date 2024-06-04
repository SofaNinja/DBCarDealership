package com.example.dbcardealership.model;

//O.order_id,
//	M.full_name as fullName,
//	M.email,
//	OS.status,
//	C.car_id as carId,
//	C.model,
//	C.price,
//	C.image,
//	C.year,
//	C.power,
//	C.color,
//	BT.name
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
