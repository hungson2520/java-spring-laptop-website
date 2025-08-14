package com.Laptop_Website.website_Laptop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;

import com.Laptop_Website.website_Laptop.domain.Order;
import com.Laptop_Website.website_Laptop.service.OrderService;


@Controller
public class OrderController {
    private final OrderService orderService;

    public OrderController(OrderService orderService1)
    {
        this.orderService=orderService1;

    }
    @GetMapping("/admin/order")
     public String getDashBoard(Model model)
    {
          List<Order> orders = this.orderService.getAllOrder();
        // System.out.println("danh sach users là:"+ users);
         model.addAttribute("orders", orders);
        return "admin/order/showorder";
        //return "admin/user/create";
    }


    @GetMapping("/admin/order/{id}")
    public String get1OrderDetail(@PathVariable long id, Model model) {

         Optional< Order> orderOptional =    this.orderService.get1Order(id);
       if (orderOptional.isPresent()) {
        model.addAttribute("order", orderOptional.get());  // Lấy User từ Optional
        model.addAttribute("id", id);
        model.addAttribute("orderDetails",orderOptional.get().getOrderDetails() );
        return "admin/order/view";  // Trả về trang chi tiết
    } else {
        // Nếu không tìm thấy user, trả về trang lỗi hoặc thông báo
        model.addAttribute("error", "User not found");
        return "errorPage";  // Trang lỗi
    }
       
    }


     @GetMapping("/admin/order/edit/{id}")
    public String showEditOrderForm(@PathVariable("id") Long id, Model model) {
        Order order = orderService.get1Order(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Order not found"));
      model.addAttribute("id", id);
        model.addAttribute("order", order);
       // model.addAttribute("statuses", OrderStatus.values()); // Truyền danh sách status cho dropdown
        model.addAttribute("oderEdit", order);

        return "admin/order/edit"; // Trả về trang JSP/Thymeleaf tương ứng
    }


     @PostMapping("/admin/order/updateStatus")
    public String updateOrderStatus(@RequestParam Long id, @RequestParam String status) {
        System.out.println(id);
        System.out.println(status);
        orderService.updateOrderStatus(id, status);
        return "redirect:/admin/order";
    }
    
}
