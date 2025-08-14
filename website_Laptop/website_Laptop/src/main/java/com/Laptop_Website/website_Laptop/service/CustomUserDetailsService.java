package com.Laptop_Website.website_Laptop.service;

import java.util.Collections;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;


@Service
public class CustomUserDetailsService implements UserDetailsService {


    private final UserService userService;
    public CustomUserDetailsService(UserService userService1)
    {
        this.userService=userService1;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // TODO Auto-generated method stub
        com.Laptop_Website.website_Laptop.domain.User    user = this.userService.getUserByEmail(username);
        if(user==null)
        {
            throw new UsernameNotFoundException("đã nhập sai username rồi nhé");

        }
          return new User(user.getEmail(), user.getPassword(), Collections.singletonList(new SimpleGrantedAuthority("ROLE_"+ user.getRole().getName())));
    
}
}
