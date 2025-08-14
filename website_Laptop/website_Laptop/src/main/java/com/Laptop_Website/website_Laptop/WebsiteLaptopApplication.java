package com.Laptop_Website.website_Laptop;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


@SpringBootApplication
//@SpringBootApplication(exclude = org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class)
public class WebsiteLaptopApplication {

	public static void main(String[] args) {
		
		SpringApplication.run(WebsiteLaptopApplication.class, args);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		System.out.println("đây là mật khẩu được mã hoá :"+encoder.encode("1234"));
		
	}

}
