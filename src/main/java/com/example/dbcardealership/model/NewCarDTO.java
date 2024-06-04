package com.example.dbcardealership.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Getter
@Setter
public class NewCarDTO {
    private String model;
    private Integer year;
    private Double price;
    private String color;
    private Integer numberOfDoors;
    private Integer capacity;

    private Integer carWidth;
    private Integer carLength;
    private Integer carHeight;

    private Integer wheelbase;
    private Double power;

    private Integer bodyTypeId;
    private Integer transmissionTypeId;
    private Integer[] fuelTypeId;
    private Integer driveTypeId;

}
