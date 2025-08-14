package com.Laptop_Website.website_Laptop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Laptop_Website.website_Laptop.domain.Cart;
import com.Laptop_Website.website_Laptop.domain.CartDetail;
import com.Laptop_Website.website_Laptop.domain.Product;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail,Long> {

     CartDetail findByCartAndProduct(Cart cart, Product product);
     List<CartDetail>  findByCart(Cart cart);
} 


