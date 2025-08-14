package com.Laptop_Website.website_Laptop.controller.client;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Laptop_Website.website_Laptop.domain.Order;
import com.Laptop_Website.website_Laptop.domain.Product;
import com.Laptop_Website.website_Laptop.domain.User;
import com.Laptop_Website.website_Laptop.domain.DTO.RegisterDTO;
import com.Laptop_Website.website_Laptop.service.OrderService;
import com.Laptop_Website.website_Laptop.service.ProductService;
import com.Laptop_Website.website_Laptop.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;





@Controller
public class HomePageController {
    private final ProductService productService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final OrderService orderService;

    
       public HomePageController(ProductService productService1, UserService userService1, PasswordEncoder passwordEncoder1, OrderService orderService1)
        {
            this.productService=productService1;
            this.userService=userService1;
            this.passwordEncoder=passwordEncoder1;
            this.orderService=orderService1;
        }

        @GetMapping("/login")
        public String getLoginPage() {
            return "client/auth/login";
        }

        @GetMapping("/product1")
        public String getLoginPage1(Model model1,@RequestParam("name") Optional<String> nameOptional ,@RequestParam("min-price") Optional<Integer> minPriceOptional
        , @RequestParam("max-price") Optional<Integer> maxPriceOptional , @RequestParam("factory") Optional<String> factoryOptional, @RequestParam("price") Optional<String> priceOptional) {
            List<Product>  products= this.productService.getAllProduct();
            int page=1;
            int length=100;
             Pageable pageable= PageRequest.of(
        page-1,
        length
         );
            if(nameOptional.isPresent())
            { 
                String name=nameOptional.get();
                
                Page<Product> listProduct= this.productService.getAllProductWithSpecName(name,pageable);
                List<Product> list= listProduct.getContent();
                model1.addAttribute("products", list);
            }
            if(minPriceOptional.isPresent())
            {     
                Integer minPrice= minPriceOptional.get();
                Page<Product> listProduct= this.productService.getAllProductWithSpecMinPrice(minPrice,pageable);
                List<Product> list= listProduct.getContent();
                model1.addAttribute("products", list);



            }


            if(maxPriceOptional.isPresent())
            {     
                Integer maxPrice= maxPriceOptional.get();
                Page<Product> listProduct= this.productService.getAllProductWithSpecMaxPrice(maxPrice,pageable);
                List<Product> list= listProduct.getContent();
                model1.addAttribute("products", list);



            }

            if(factoryOptional.isPresent())
            {     
                String factory=factoryOptional.get();
                List<String> listFactory=Arrays.asList( factoryOptional.get().split(","));
                if(listFactory.size()>1)
                {
                    // tìm từ 2 factory trở lên nè
                    Page<Product> listProduct= this.productService.getAllProductWithSpecManyFactory(listFactory,pageable);
                    List<Product> list= listProduct.getContent();
                    model1.addAttribute("products", list);


                }
                else {
                    // chỉ tìm bằng 1 factory
                Page<Product> listProduct= this.productService.getAllProductWithSpecFactory(factory,pageable);
                List<Product> list= listProduct.getContent();
                model1.addAttribute("products", list);
                }



            }
            if(priceOptional.isPresent())
            {
               String price= priceOptional.get();
                   
               List<String> listPrice=Arrays.asList( priceOptional.get().split(","));
               if(listPrice.size()>1)
               {
                Page<Product> listProduct= this.productService.getAllProductWithSpecManyPrice(listPrice,pageable);
                List<Product> list= listProduct.getContent();
                model1.addAttribute("products", list);

               }
               else {
               Page<Product> listProduct= this.productService.getAllProductWith1RangePrice(price,pageable);
               List<Product> list= listProduct.getContent();
               model1.addAttribute("products", list);
               }
            }
        

            if(!nameOptional.isPresent()&& !minPriceOptional.isPresent() &&!maxPriceOptional.isPresent() &&!factoryOptional.isPresent() && !priceOptional.isPresent()) {
                model1.addAttribute("products", products);
            }
           
            return "client/product/productpage";
        }

        @GetMapping("/access-denied")
        public String getDenyPage() {
            return "client/auth/access-denied";
        }
        
       
        
        
        @GetMapping("/")
        public String getMethodName(Model model1)
        {

    
    
            List<Product>  products= this.productService.getAllProduct();
            model1.addAttribute("products", products);
            return "client/homepage/show";
        }
          @GetMapping("/register")
        public String showUserForm(Model model) {
            model.addAttribute("user", new RegisterDTO()); // Tạo đối tượng User rỗng để hiển thị form
         //   model.addAttribute("registerUser", new RegisterDTO());
            return "client/auth/register"; // Tên file JSP
        }
        @PostMapping("/register")
        public String showUserForm1(@ModelAttribute("user") @Valid RegisterDTO dto, BindingResult userBindingResult) {
         //   model.addAttribute("user", new User()); // Tạo đối tượng User rỗng để hiển thị form
         List<FieldError> errors = userBindingResult.getFieldErrors();

         for (FieldError error : errors ) {
             System.out.println (">>>>>>>>>>>>>"+error.getField() + " - " + error.getDefaultMessage());
         }
         if(userBindingResult.hasErrors())
         {
           return "/client/auth/register";
         }
    
         User user = this.userService.RegisterDTOtoUser(dto);
          // cần phải validate dữ liệu thôi nào
    
         String hashPassword= this.passwordEncoder.encode(user.getPassword());
         user.setPassword(hashPassword);
         user.setRole(this.userService.getRoleByName("user"));
         this.userService.handleSaveUser(user);
         return "redirect:/login"; // Tên file JSP
    }


    @GetMapping("/orderhistory")
    public String getOrderHistory(Model model,  HttpServletRequest httpRequest) {
        // lấy ra user hiện tại đang đăng nhập
        User currentUser= new User();
        // lấy ra phiên đăng nhập hiện tại 
        HttpSession session= httpRequest.getSession(false);
        // lấy ra id đăng nhập của user hiện tại 
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        List<Order> orders= this.orderService.getOrderByUser(currentUser);

        model.addAttribute("orders", orders);
        
        return "client/homepage/orderhistory";
    }
    

    // @GetMapping("/login")
    // public String loginPage() {
    //     return "/client/auth/login";
    // }
    
}
