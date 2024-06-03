package com.example.dbcardealership.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.example.dbcardealership.model.CarDashboardDTO;
import com.example.dbcardealership.model.ManagerSalesDTO;
import com.example.dbcardealership.repository.OrderRepository;
import com.example.dbcardealership.repository.UserRepository;

@Controller
@RequestMapping("/dashboard")
@RequiredArgsConstructor
public class DashboardController {
    private final OrderRepository orderRepository;
    private final UserRepository userRepository;

    @GetMapping
    public String getDashboard(Model model) {
        model.addAttribute("lastYear", orderRepository.getEarnedForLastYear().getSum());

        var topManagers = orderRepository.getManagersTop3Rating();
        model.addAttribute("managersNames", topManagers.stream().map(ManagerSalesDTO::getFullName).toArray());
        model.addAttribute("managersSales", topManagers.stream().map(ManagerSalesDTO::getSum).toArray());

        var topCars = orderRepository.getCarsTop3Rating();
        model.addAttribute("carsModels", topCars.stream().map(CarDashboardDTO::getModel).toArray());
        model.addAttribute("carsCounts", topCars.stream().map(CarDashboardDTO::getOrdersCount).toArray());

        model.addAttribute("users", userRepository.getClientsList(1));
        model.addAttribute("managers", userRepository.getManagersList(1));

        return "dashboard";
    }
}
