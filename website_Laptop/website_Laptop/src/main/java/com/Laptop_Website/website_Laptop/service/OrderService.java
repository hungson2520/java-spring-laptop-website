package com.Laptop_Website.website_Laptop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.Laptop_Website.website_Laptop.domain.Order;
import com.Laptop_Website.website_Laptop.domain.User;
import com.Laptop_Website.website_Laptop.repository.OrderDetailRepository;
import com.Laptop_Website.website_Laptop.repository.OrderRepository;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;
    public OrderService(OrderRepository orderRepository1, OrderDetailRepository orderDetailRepository1)
    {
        this.orderRepository=orderRepository1;
        this.orderDetailRepository= orderDetailRepository1;

    }

    public List<Order> getAllOrder()
    {
      return  this.orderRepository.findAll();
    }


    public Optional<Order> get1Order(long id)
    {
        return this.orderRepository.findById(id);
    }

    public List<Order> getOrderByUser(User user)
    {
        return this.orderRepository.findByUser(user);
    }

      public void updateOrderStatus(Long orderId, String status) {
        Order order = orderRepository.findById(orderId)
                .orElseThrow(() -> new RuntimeException("Order not found"));
        order.setStatus(status);
        orderRepository.save(order);
    }


    public void cancelOrder(Long orderId) {
        Order order = orderRepository.findById(orderId)
                .orElseThrow(() -> new RuntimeException("Không tìm thấy đơn hàng!"));
        order.setStatus("CANCELLED"); // Cập nhật trạng thái thành "Đã hủy"
        orderRepository.save(order);
    }
}
