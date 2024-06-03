package com.example.dbcardealership.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
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
}
