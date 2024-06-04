package com.example.dbcardealership.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.example.dbcardealership.model.NewCarDTO;
import com.example.dbcardealership.repository.AdditionalOptionRepository;
import com.example.dbcardealership.service.CarService;

@Controller
@RequiredArgsConstructor
@RequestMapping("/car")
public class CarController {
    private final CarService carService;
    private final AdditionalOptionRepository additionalOptionRepository;

    @GetMapping
    public String getCarList(Model model) {
        model.addAttribute("carList", carService.getAllCars());
        return "home";
    }

    @GetMapping("/{car_id}")
    public String getCarInformationById(@PathVariable("car_id") int car_id, Model model) {
        System.out.println(car_id);
        var data = carService.getCarById(car_id);
        model.addAttribute("carData", data);
        model.addAttribute("options", additionalOptionRepository.getOptionList());

        return "car";
    }

    @PostMapping("/new")
    public String newCar(@RequestParam String model,
                         @RequestParam Integer year,
                         @RequestParam Double price,
                         @RequestParam String color,
                         @RequestParam Integer numberOfDoors,
                         @RequestParam Integer capacity,

                         @RequestParam Integer carWidth,
                         @RequestParam Integer carLength,
                         @RequestParam Integer carHeight,

                         @RequestParam Integer wheelbase,
                         @RequestParam Double power,

                         @RequestParam Integer bodyTypeId,
                         @RequestParam Integer transmissionTypeId,
                         @RequestParam Integer[] fuelTypeId,
                         @RequestParam Integer driveTypeId
    ) {
        carService.addNewCar(new NewCarDTO(model, year, price, color, numberOfDoors, capacity, carWidth, carLength, carHeight, wheelbase, power, bodyTypeId, transmissionTypeId, fuelTypeId, driveTypeId));
        return "redirect:/car";
    }
}
