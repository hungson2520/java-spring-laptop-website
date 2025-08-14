package com.Laptop_Website.website_Laptop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Laptop_Website.website_Laptop.domain.Order;
import com.Laptop_Website.website_Laptop.domain.User;

@Repository
public interface  OrderRepository extends JpaRepository<Order,Long> {

     public List<Order>  findByUser(User user);
   
} 
