package com.Laptop_Website.website_Laptop.service;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.Laptop_Website.website_Laptop.domain.Role;
import com.Laptop_Website.website_Laptop.domain.User;
import com.Laptop_Website.website_Laptop.domain.DTO.RegisterDTO;
import com.Laptop_Website.website_Laptop.repository.OrderRepository;
import com.Laptop_Website.website_Laptop.repository.ProductRepository;
import com.Laptop_Website.website_Laptop.repository.RoleRepository;
import com.Laptop_Website.website_Laptop.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepo;
    private final ProductRepository productService;
    private final OrderRepository orderService;
    
    
    public UserService(UserRepository userRepository, RoleRepository roleRepo1, ProductRepository productService1, OrderRepository orderService1) {
        this.userRepository = userRepository;
        this.roleRepo=roleRepo1;
        this.productService=productService1;
        this.orderService=orderService1;
    }
    public String handleHello()
    {
        return "Hello from handleHello(userService)";
    }
    public void handleSaveUser(User newUser)
    {
        this.userRepository.save(newUser);
    }

    public void handleUpdateUser(User user)
    {
        
    }
    public Page<User> getAllUsers(Pageable page) {
        return userRepository.findAll(page);
    }
    public Optional<User> getUserById(long id)
    {
         return userRepository.findById(id);
    }
    public Role getRoleByName(String name)
    {
        return roleRepo.findByName(name);
    }
    public User RegisterDTOtoUser(RegisterDTO dto)
    {

        User user = new User();
        user.setFullName(dto.getFullName());
        user.setEmail(dto.getEmail());
        user.setPassword(dto.getPassword());

        return user;
        

    } 
    public boolean CheckEmailExists(String email)
    {

        return userRepository.existsByEmail(email);
    }
    public User getUserByEmail(String email)
    {
        return this.userRepository.findByEmail(email);
    }
    

    public long CountUser()
    {
        return this.userRepository.count();
    }
    public long countProduct()
    {
        return this.productService.count();
    }
    public long countOrder()
    {
        return this.orderService.count();
    }

    public void saveAndFlush(User user)
    {
        this.userRepository.saveAndFlush(user);
    }



    public Optional<Long> handleFindIdByEmail(String email)
    { 
        return this.userRepository.findIdByEmail(email);

    }


}
