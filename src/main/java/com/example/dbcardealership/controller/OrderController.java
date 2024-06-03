package com.example.dbcardealership.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.dbcardealership.service.OrderService;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/order")
public class OrderController {
    private final OrderService orderService;

    @PostMapping("/new")
    public String newOrder(@RequestParam List<Integer> selectedOptions, @RequestParam Integer carId,Authentication authentication) {
        orderService.createOrder(selectedOptions, carId, authentication);
        return "redirect:/order";
    }

    @GetMapping
    public String getClientOrders(Authentication authentication, Model model) {
        var data = orderService.getOrder(authentication);
        model.addAttribute("userOrders", data);
        return "orders";
    }
}
