package com.example.dbcardealership.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.example.dbcardealership.model.CarDTO;
import com.example.dbcardealership.model.CarResponse;
import com.example.dbcardealership.model.CarSmallDTO;
import com.example.dbcardealership.repository.CarRepository;

import java.util.Arrays;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CarService {
    private final CarRepository carRepository;

    public List<CarSmallDTO> getAllCars() {
        return carRepository.getAllCars();
    }

    public CarResponse getCarById(int id) {
        var result = carRepository.getCarInformationByCarId(id);
        var fuelTypes = result.stream().map(CarDTO::getFuelType).toList();
        var sizes = Arrays.stream(result.get(0).getDimensions().split("x")).map(String::strip).toList();

        return new CarResponse()
                .setImage(result.get(0).getImage())
                .setModel(result.get(0).getModel())
                .setYear(result.get(0).getYear())
                .setPrice(result.get(0).getPrice())
                .setBodyType(result.get(0).getBodyType())
                .setFuelType(fuelTypes)
                .setTransmission(result.get(0).getTransmissionType())
                .setDriveType(result.get(0).getDriveType())
                .setDoorsNumber(result.get(0).getDoorsNumber())
                .setCapacity(result.get(0).getCapacity())
                .setCarHeight(sizes.get(1))
                .setCarWidth(sizes.get(2))
                .setCarLength(sizes.get(0))
                .setWheelbase(result.get(0).getWheelbase())
                .setEngineVolume(result.get(0).getEngineVolume())
                .setPower(result.get(0).getPower())
                .setWeight(result.get(0).getWeight())
                .setClearance(result.get(0).getClearance())
                .setLoadCapacity(result.get(0).getLoadCapacity())
                .setTrunkVolume(result.get(0).getTrunkVolume())
                .setColor(result.get(0).getColor());
    }
}
