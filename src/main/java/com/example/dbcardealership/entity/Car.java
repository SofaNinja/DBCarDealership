package com.example.dbcardealership.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@Entity
@Table(name = "cars")
public class Car {
    @Id
    @Column(name = "car_id", nullable = false)
    private Integer id;

    @Column(name = "model", nullable = false, length = 100)
    private String model;

    @Column(name = "year", nullable = false)
    private Integer year;

    @Column(name = "price", nullable = false, precision = 10, scale = 2)
    private BigDecimal price;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "body_type_id", nullable = false)
    private BodyType bodyType;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "fuel_type_id", nullable = false)
    private FuelType fuelType;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "transmission_type_id", nullable = false)
    private TransmissionType transmissionType;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "drive_type_id", nullable = false)
    private DriveType driveType;

    @Column(name = "number_of_doors", nullable = false)
    private Integer numberOfDoors;

    @Column(name = "capacity", nullable = false)
    private Integer capacity;

    @Column(name = "dimensions", nullable = false, length = 100)
    private String dimensions;

    @Column(name = "wheelbase", nullable = false, length = 100)
    private String wheelbase;

    @Column(name = "max_torque", nullable = false, precision = 10, scale = 2)
    private BigDecimal maxTorque;

    @Column(name = "engine_volume", nullable = false, precision = 10, scale = 2)
    private BigDecimal engineVolume;

    @Column(name = "power", nullable = false, precision = 10, scale = 2)
    private BigDecimal power;

    @Column(name = "weight", nullable = false, precision = 10, scale = 2)
    private BigDecimal weight;

    @Column(name = "clearance", nullable = false, precision = 10, scale = 2)
    private BigDecimal clearance;

    @Column(name = "load_capacity", nullable = false, precision = 10, scale = 2)
    private BigDecimal loadCapacity;

    @Column(name = "trunk_volume", nullable = false, precision = 10, scale = 2)
    private BigDecimal trunkVolume;

    @Column(name = "color", nullable = false, length = 50)
    private String color;

}