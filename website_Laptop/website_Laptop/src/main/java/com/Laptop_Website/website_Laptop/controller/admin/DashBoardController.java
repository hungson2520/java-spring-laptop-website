package com.Laptop_Website.website_Laptop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.Laptop_Website.website_Laptop.service.UserService;


@Controller
public class DashBoardController {

    private final UserService userService;


    public DashBoardController(UserService userService1)
    {
        this.userService=userService1;
    }
  
    @GetMapping("/admin")
     public String getDashBoard(Model model)
    {

        model.addAttribute("countUser", this.userService.CountUser());
        model.addAttribute("countOrder", this.userService.countOrder());
        model.addAttribute("countProduct", this.userService.countProduct());
        return "admin/dashboard/show";
        //return "admin/user/create";
    }
   
}
