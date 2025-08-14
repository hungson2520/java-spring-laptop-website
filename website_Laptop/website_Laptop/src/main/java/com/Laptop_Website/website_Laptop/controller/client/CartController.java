package com.Laptop_Website.website_Laptop.controller.client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.Laptop_Website.website_Laptop.service.ProductService;

@RestController
@RequestMapping("/cart")
public class CartController {
     @Autowired
    private final ProductService productService;

    public CartController(ProductService productService1)
    {
        this.productService= productService1;
    }

    // @PostMapping("/add")
    // public ResponseEntity<?> addToCart(@RequestBody Map<String, Long> request, HttpServletRequest httpRequest) {
    //     System.out.println("vô /add");
    //     String email = httpRequest.getUserPrincipal().getName(); // Lấy email từ user hiện tại
    //     long productId = request.get("productId");
    //     this.productService.handleAddProductToCart(email, productId, httpRequest);

    //     HttpSession session = httpRequest.getSession(false);
    //     int totalQuantity = (int) session.getAttribute("totalQuantity");
    //     int sum = (int) session.getAttribute("sum");

    //     Map<String, Object> response = new HashMap<>();
    //     response.put("totalQuantity", totalQuantity);
    //     response.put("sum", sum);

    //     return ResponseEntity.ok(response);
    // }

    // @PostMapping("/remove")
    // public ResponseEntity<?> removeFromCart(@RequestBody Map<String, Long> request, HttpSession session) {
    //     System.out.println("vô /remove");

    //     long cartDetailId = request.get("productId"); // Trong trường hợp giảm sản phẩm
    //     this.productService.handleRemoveCartDetail(cartDetailId, session);

    //     int totalQuantity = (int) session.getAttribute("totalQuantity");
    //     int sum = (int) session.getAttribute("sum");

    //     Map<String, Object> response = new HashMap<>();
    //     response.put("totalQuantity", totalQuantity);
    //     response.put("sum", sum);

    //     return ResponseEntity.ok(response);
    // }
}
