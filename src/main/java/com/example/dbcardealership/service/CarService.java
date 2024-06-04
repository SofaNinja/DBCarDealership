package com.example.dbcardealership.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.example.dbcardealership.model.*;
import com.example.dbcardealership.repository.AdditionalOptionRepository;
import com.example.dbcardealership.repository.CarRepository;

import java.util.Arrays;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CarService {
    private final CarRepository carRepository;
    private final AdditionalOptionRepository additionalOptionRepository;

    public List<CarSmallDTO> getAllCars() {
        return carRepository.getAllCars();
    }

    List<Element> getFuelTypeList() {
        return additionalOptionRepository.getFuelTypeList();
    }
    List<Element> getDriveTypeList() {
        return additionalOptionRepository.getDriveTypeList();
    }

    List<Element> getTransmissionTypeList() {
        return additionalOptionRepository.getTransmissionTypeList();
    }

    @Transactional
    public void addNewCar(NewCarDTO newCar) {
        var sizes = newCar.getCarLength() + "mm x " + newCar.getCarHeight() + "mm x " + newCar.getCarWidth() + "mm";
        var carId = carRepository.insertCar(newCar.getModel(), newCar.getYear(), newCar.getPrice(), newCar.getBodyTypeId(), newCar.getTransmissionTypeId(), newCar.getDriveTypeId(), newCar.getNumberOfDoors(), newCar.getCapacity(), sizes, newCar.getWheelbase(), newCar.getPower(), newCar.getColor());
        for (Integer element : newCar.getFuelTypeId()) {
            System.out.println(element);
            carRepository.insertFuelTypes(carId, element);
        }
    }

    public CarResponse getCarById(int id) {
        var result = carRepository.getCarInformationByCarId(id);
        var fuelTypes = result.stream().map(CarDTO::getFuelType).toArray();
        var fuelTypeString = Arrays.toString(fuelTypes).replace("[", "").replace("]", "");
        var sizes = Arrays.stream(result.get(0).getDimensions().split("x")).map(String::strip).toList();

        return new CarResponse()
                .setImage(result.get(0).getImage())
                .setModel(result.get(0).getModel())
                .setYear(result.get(0).getYear())
                .setPrice(result.get(0).getPrice())
                .setBodyType(result.get(0).getBodyType())
                .setFuelType(fuelTypeString)
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
