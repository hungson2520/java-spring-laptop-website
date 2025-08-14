package com.Laptop_Website.website_Laptop.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.Laptop_Website.website_Laptop.domain.Cart;
import com.Laptop_Website.website_Laptop.domain.CartDetail;
import com.Laptop_Website.website_Laptop.repository.CartDetailRepository;
import com.Laptop_Website.website_Laptop.repository.CartRepository;

@Service
public class CartService {
    

    private final CartRepository cartRepository;

    private final CartDetailRepository cartDetailRepository;


    public CartService(CartRepository cartRepo, CartDetailRepository cartDetailRepo)
    {
        this.cartDetailRepository=cartDetailRepo;
        this.cartRepository=cartRepo;
    }

    /**
     * Lấy danh sách CartDetail theo email người dùng
     */
    public List<CartDetail> getCartDetailsByUser(String email) {
        // Tìm giỏ hàng của người dùng dựa trên email
        Cart cart = cartRepository.findByUserEmail(email);
        if (cart == null) {
            return new ArrayList<>(); // Nếu không có giỏ hàng, trả về danh sách trống
        }
        return cartDetailRepository.findByCart(cart); // Trả về chi tiết giỏ hàng
    }

    public Cart findByUserEmail(String email) {
        return this.cartRepository.findByUserEmail(email);
    }




}
