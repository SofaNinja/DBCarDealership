package com.example.dbcardealership.service;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.example.dbcardealership.model.OrderDTO;
import com.example.dbcardealership.model.UserPrincipal;
import com.example.dbcardealership.repository.CarRepository;
import com.example.dbcardealership.repository.OrderRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderService {
    private final OrderRepository orderRepository;
    private final CarRepository carRepository;

    public List<OrderDTO> getOrder(Authentication authentication) {
        var principal = (UserPrincipal) authentication.getPrincipal();
        return orderRepository.getAllClientOrders(principal.getUserId());
    }
    @Transactional
    public void createOrder(List<Integer> selectedOptions, Integer carId, Authentication authentication) {
        var principal = (UserPrincipal) authentication.getPrincipal();

        var carPrice = carRepository.getCarInformationByCarId(carId).get(0).getPrice();
        var additionalOptionsPrice = orderRepository.calculateOptionsPrice(selectedOptions);
        var orderId = orderRepository.addOrder(principal.getUserId(), 1, carPrice + additionalOptionsPrice);
        orderRepository.addOrderCar(orderId, carId);

        for (Integer option : selectedOptions) {
            orderRepository.addOrderOption(orderId, option);
        }
    }
}
