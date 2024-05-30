package com.example.dbcardealership.model;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.util.List;

@Getter
@Setter
@Accessors(chain = true)
public class CarResponse {
    String model;
    Integer year;
    Double price;
    String image;
    String bodyType;
    List<String> fuelType;
    String transmission;
    String driveType;
    Integer doorsNumber;
    Integer capacity;
    String carWidth;
    String carHeight;
    String carLength;
    String wheelbase;
    Double engineVolume;
    Double power;
    Double weight;
    Double clearance;
    Double loadCapacity;
    Double trunkVolume;
    String color;
}
