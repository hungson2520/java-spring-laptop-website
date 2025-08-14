package com.Laptop_Website.website_Laptop.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.Laptop_Website.website_Laptop.domain.Cart;
import com.Laptop_Website.website_Laptop.domain.CartDetail;
import com.Laptop_Website.website_Laptop.domain.Order;
import com.Laptop_Website.website_Laptop.domain.OrderDetail;
import com.Laptop_Website.website_Laptop.domain.Product;
import com.Laptop_Website.website_Laptop.domain.ProductArticle;
import com.Laptop_Website.website_Laptop.domain.ProductImage;
import com.Laptop_Website.website_Laptop.domain.ProductProcessor;
import com.Laptop_Website.website_Laptop.domain.User;
import com.Laptop_Website.website_Laptop.domain.DTO.ProductCriteriaDTO;
import com.Laptop_Website.website_Laptop.repository.CartDetailRepository;
import com.Laptop_Website.website_Laptop.repository.CartRepository;
import com.Laptop_Website.website_Laptop.repository.OrderDetailRepository;
import com.Laptop_Website.website_Laptop.repository.OrderRepository;
import com.Laptop_Website.website_Laptop.repository.ProductArticleRepository;
import com.Laptop_Website.website_Laptop.repository.ProductImageRepository;
import com.Laptop_Website.website_Laptop.repository.ProductProcessorRepository;
import com.Laptop_Website.website_Laptop.repository.ProductRepository;
import com.Laptop_Website.website_Laptop.service.specification.ProductSpec;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
public class ProductService {
      private final ProductRepository productRepository;
      private final CartRepository cartRepository;
      private final CartDetailRepository cartDetailRepository;
      private final UserService userService;
      private final OrderRepository orderRepository;
      private final OrderDetailRepository orderDetailRepository;


       @Autowired
    private ProductImageRepository productImageRepository;

    @Autowired
    private ProductProcessorRepository productProcessorrRepository1;


    @Autowired
    private ProductArticleRepository productArticleRepository1;
    public ProductService(ProductRepository userRepository, CartDetailRepository cartDetailRepository1, CartRepository cartRepository1, UserService userService1, OrderDetailRepository orderDetailRepository1, OrderRepository orderRepository1) {
        this.productRepository = userRepository;
        this.cartDetailRepository=cartDetailRepository1;
        this.cartRepository= cartRepository1;
        this.userService= userService1;
        this.orderDetailRepository=orderDetailRepository1;
        this.orderRepository= orderRepository1;
    }

     public void handleSaveProduct(Product newUser)
    {
        this.productRepository.save(newUser);
    }
    public List<Product> getAllProduct() {
        return productRepository.findAll();
    }
    public Optional<Product> getProductById(long id)
    {
         return productRepository.findById(id);
    
    }
    public void Delete1Product(long id)
    {
        productRepository.deleteById(id);
    }

   public void handleAddProductToCart1(String email,long productId)
    {
       User user1 = this.userService.getUserByEmail(email);
       if(user1!=null)
       {

        // check User đã có cart hay chưa , nếu chưa thì tạo mới
        Cart cart= this.cartRepository.findByUser(user1);
        if(cart==null)
        {
            // tức là chưa có cart
            // cần phải tạo mới 1 cart
            Cart newCart = new Cart();
           // newCart.setId(productId);
             newCart.setUser(user1);
            //
            newCart.setSum(0);
           cart= this.cartRepository.save(newCart);
        }
        CartDetail cd = new CartDetail();
        Product p = this.productRepository.findById(productId).get();
        this.cartDetailRepository.save(cd);
        cd.setCart(cart);
        cd.setId(p.getId());
        
        cd.setQuantity(1);
        cd.setPrice(p.getPrice());
       }
    }




public void handleAddProductToCart(String email, long productId , HttpServletRequest req, int quantity) {
    // Lấy thông tin user dựa trên email
            HttpSession session= req.getSession(false);

    User user1 = this.userService.getUserByEmail(email);

    if (user1 != null) {
        // Kiểm tra user đã có cart chưa, nếu chưa thì tạo mới
        Cart cart = this.cartRepository.findByUser(user1);
        if (cart == null) {
            // Chưa có cart, tạo mới
            Cart newCart = new Cart();
            newCart.setUser(user1);
            newCart.setSum(0); // Tổng tiền khởi tạo là 0
            newCart.setTotalQuantity(0); // tổng số lượng sản phẩm trong giỏ hàng 
            cart = this.cartRepository.save(newCart);
        }

        // Lấy thông tin sản phẩm
        Product product = this.productRepository.findById(productId).get();
        if (product == null) {
            throw new RuntimeException("Product not found with id: " + productId);
        }

        // Kiểm tra xem sản phẩm đã có trong giỏ hàng hay chưa
        CartDetail existingCartDetail = this.cartDetailRepository.findByCartAndProduct(cart, product);
        if (existingCartDetail != null) {
            // Sản phẩm đã có trong giỏ hàng, tăng số lượng
            existingCartDetail.setQuantity(existingCartDetail.getQuantity() + quantity);
      
            this.cartDetailRepository.save(existingCartDetail);
        } else {
            // Sản phẩm chưa có trong giỏ hàng, tạo mới CartDetail
            CartDetail newCartDetail = new CartDetail();
            newCartDetail.setCart(cart);
            newCartDetail.setProduct(product);
            newCartDetail.setQuantity(quantity);
            newCartDetail.setPrice(product.getPrice());
            cart.setTotalQuantity(cart.getTotalQuantity()+1); // tổng số lượng sản phẩm trong đơn hàng

            this.cartDetailRepository.save(newCartDetail);
        }

        // Cập nhật tổng tiền giỏ hàng
        if(cart.getCartDetails()!=null)
        {
        int totalSum = cart.getCartDetails().stream()
                .mapToInt(cd -> cd.getQuantity() * (int) cd.getPrice())
                .sum();
        cart.setSum(totalSum);
        this.cartRepository.save(cart);
        session.setAttribute("totalQuantity", cart.getTotalQuantity());
        session.setAttribute("sum",cart.getSum());
        }
       
    }
}


public void handleRemoveCartDetail(long CartDetailId , HttpSession session)



{

    System.out.println("cartDetailId là+++"+CartDetailId);

    Optional<CartDetail> cartDetailOptional = this.cartDetailRepository.findById(CartDetailId);
    if(cartDetailOptional.isPresent())
    {
        System.out.println("cartdetail optional có tồn tại");

        /// chuyển đổi từ cardDetailOptional sang CardDetail
        CartDetail cartDetail= cartDetailOptional.get();
        //từ cartDetail lấy ra cart hiện tại 
        Cart cartCurrent = cartDetail.getCart();
        this.cartDetailRepository.deleteById(CartDetailId);

        // update cartCurrent
        if(cartCurrent.getTotalQuantity()>1)

        {
            System.out.println("đã chui vô đây nhé: totalQuantity >1");
            // trong giỏ hàng có nhiều hơn là 1 món đang định xoá
            int total = cartCurrent.getTotalQuantity()-1;
            cartCurrent.setTotalQuantity(total);
            session.removeAttribute("totalQuantity"); 
            session.setAttribute("totalQuantity", cartCurrent.getTotalQuantity());
            this.cartRepository.save(cartCurrent);

        }
        else{
            // tức là trong giỏ hàng chỉ có món đang định xoá
            this.cartRepository.deleteById(cartCurrent.getId());
            session.removeAttribute("totalQuantity"); 
            session.setAttribute("totalQuantity", 0);
        }
    }
}


public void handleDecreaseCartDetailQuantity(long cartDetailId, HttpSession session) {
    // Lấy CartDetail từ database
    Optional<CartDetail> cartDetailOptional = this.cartDetailRepository.findById(cartDetailId);

    if (cartDetailOptional.isPresent()) {
        System.out.println("CartDetail tồn tại với ID: " + cartDetailId);

        CartDetail cartDetail = cartDetailOptional.get();
        Cart cart = cartDetail.getCart(); // Lấy Cart chứa CartDetail

        // Kiểm tra số lượng sản phẩm trong CartDetail
        if (cartDetail.getQuantity() > 1) {
            // Giảm số lượng xuống 1
            cartDetail.setQuantity(cartDetail.getQuantity() - 1);
            this.cartDetailRepository.save(cartDetail);

            // Cập nhật tổng số lượng và tổng tiền trong giỏ hàng
            cart.setTotalQuantity(cart.getTotalQuantity() - 1);
            int totalSum = cart.getCartDetails().stream()
                .mapToInt(cd -> cd.getQuantity() * (int) cd.getPrice())
                .sum();
            cart.setSum(totalSum);

            this.cartRepository.save(cart);

            // Cập nhật session
            session.setAttribute("totalQuantity", cart.getTotalQuantity());
            session.setAttribute("sum", cart.getSum());
        } else {
            // Số lượng sản phẩm là 1 -> Xóa CartDetail khỏi giỏ hàng
            this.cartDetailRepository.deleteById(cartDetailId);

            // Cập nhật giỏ hàng
            cart.setTotalQuantity(cart.getTotalQuantity() - 1);
            int totalSum = cart.getCartDetails().stream()
                .mapToInt(cd -> cd.getQuantity() * (int) cd.getPrice())
                .sum();
            cart.setSum(totalSum);

            if (cart.getTotalQuantity() > 0) {
                this.cartRepository.save(cart);
            } else {
                // Nếu không còn sản phẩm trong giỏ, xóa giỏ hàng
                this.cartRepository.deleteById(cart.getId());
            }

            // Cập nhật session
            session.setAttribute("totalQuantity", cart.getTotalQuantity());
            session.setAttribute("sum", cart.getSum());
           // this.handleRemoveCartDetail(cartDetailId, session);
        }
    } else {
        System.out.println("CartDetail không tồn tại với ID: " + cartDetailId);
        throw new RuntimeException("CartDetail not found with id: " + cartDetailId);
    }
}


public void handleUpdateCartBeforeCheckOut(List<CartDetail> listCartDetail1)
{
    for(CartDetail cartDetail1 : listCartDetail1)
    {
        Optional<CartDetail> cardDetailOptional = this.cartDetailRepository.findById(cartDetail1.getId());
        if(cardDetailOptional.isPresent())
        {
            CartDetail currentCartDetail = cardDetailOptional.get();
            currentCartDetail.setQuantity(cartDetail1.getQuantity());
            currentCartDetail.setPrice(cartDetail1.getPrice());
            currentCartDetail.setProduct(cartDetail1.getProduct());
            this.cartDetailRepository.save(currentCartDetail);

        }
    }

}

public void handlePlaceOrder(User user, HttpSession session, String recieverName , String recieverAddress, String recieverPhone)
{


    // CREATE ORDER NÈ
    Order order1= new Order();
    order1.setUser(user);
    order1.setRecieverAddress(recieverAddress);
    order1.setRecieverName(recieverName);
    order1.setRecieverPhone(recieverPhone);
   order1= this.orderRepository.save(order1);
   // sau khi lưu như trên ta sẽ lấy được id của order1 nhé

   double TotalPrice=0;

   // get cart by user :::
   Cart cart1= this.cartRepository.findByUser(user);
   List<OrderDetail> listOrderDetails= new ArrayList<OrderDetail>();
   if(cart1!=null)
   {
    List<CartDetail> listCartDetails = cart1.getCartDetails();
    if(listCartDetails!=null)
    {
        for(CartDetail cd:listCartDetails)
        {
            OrderDetail orderDetail1= new OrderDetail();
            orderDetail1.setOrder(order1);
            orderDetail1.setPrice(cd.getProduct().getPrice());
            orderDetail1.setQuantity(cd.getQuantity());
            orderDetail1.setProduct(cd.getProduct());
            TotalPrice=TotalPrice+(cd.getQuantity()*cd.getProduct().getPrice());
            listOrderDetails.add(orderDetail1);
            this.orderDetailRepository.save(orderDetail1);
            
            

        }


         //   order1.setOrderDetails(listOrderDetails);
    // delete cartDetail and Cart nha
    for(CartDetail cd:listCartDetails)
    { this.cartDetailRepository.deleteById(cd.getId());

    }
    order1.setTotalPrice(TotalPrice);
    order1.setStatus("PENDING");

    // delete cart
    this.cartRepository.deleteById(cart1.getId());

    // update session nha
    session.setAttribute("totalQuantity", 0);
    System.out.println("ĐÃ ĐẶT HÀNG THÀNH CÔNG NHÉ!!!!");



    }


   }
    

}

 public List<ProductImage> getImagesByProductId(Long productId) {
        return productImageRepository.findByProductId(productId);
    }


    public void handleSaveManyImages(ProductImage p)
    {
        this.productImageRepository.save(p);
    }



// private Specification<Product> nameLike(String name)
// {

//     // name này là name của product
//     return (root, query,criteriaBuilder)-> criteriaBuilder.like(root.get("name"),"%"+name+"%" );
// }

public Page<Product> getAllProductWithSpecName(String name , Pageable page) {
    return productRepository.findAll(ProductSpec.nameLike(name), page);
}

public Page<Product> getAllProductWithSpecMinPrice(int price , Pageable page) {
    return productRepository.findAll(ProductSpec.minPrice(price), page);
}

public Page<Product> getAllProductWithSpecMaxPrice(int price , Pageable page) {
    return productRepository.findAll(ProductSpec.maxPrice(price), page);
}

public Page<Product> getAllProductWithSpecFactory(String name , Pageable page) {
    return productRepository.findAll(ProductSpec.findFactory(name), page);
}

public Page<Product> getAllProductWithSpecManyFactory(List<String> name , Pageable page) {
    return productRepository.findAll(ProductSpec.findManyFactory(name), page);
}


public Page<Product> fetchDataWithAllSpecification(ProductCriteriaDTO productDTO , Pageable page)
{
  if(productDTO.getFactory()==null && productDTO.getPrice()==null && productDTO.getTarget()==null)
  {
    return productRepository.findAll(page);
  }
    Specification<Product> combinedSpecification =Specification.where(null);
    if(productDTO.getTarget()!=null && productDTO.getTarget().isPresent())
    { System.out.println("chui vô getTarget");
        // kiểm tra xem người dùng có truyền target lên hay không
        // nếu vô trong này là có truyền target
        Specification<Product> spec= ProductSpec.findManyTarget(productDTO.getTarget().get());
    combinedSpecification=  combinedSpecification.and(spec);
    System.out.println( "combined"+combinedSpecification);

    }

    if( productDTO.getFactory()!=null && productDTO.getFactory().isPresent())
    {
        // kiểm tra xem người dùng có truyền target lên hay không
        // nếu vô trong này là có truyền target
        Specification<Product> spec= ProductSpec.findManyFactory(productDTO.getFactory().get());
    System.out.println("chui vô getFactory");

    combinedSpecification= combinedSpecification.and(spec);
    System.out.println( "combined"+combinedSpecification);

    }
    Specification<Product> priceSpecification = Specification.where(null);

    if(productDTO.getPrice() !=null && productDTO.getPrice().isPresent())
    {    List<String> listprice= productDTO.getPrice().get();
        for (String price : listprice) {
            Specification<Product> priceSpec = null;
            switch (price) {
                case "0-toi-250-USD":
                    priceSpec = ProductSpec.find1RangePrice(1, 250);
                    break;
                case "250-toi-500-USD":
                    priceSpec = ProductSpec.find1RangePrice(250, 500);
                    break;
                case "500-toi-700-USD":
                    priceSpec = ProductSpec.find1RangePrice(500, 700);
                    break;
                case "700-toi-1000-USD":
                    priceSpec = ProductSpec.find1RangePrice(700, 1000);
                    break;
                case "1000-toi-1500-USD":
                    priceSpec = ProductSpec.find1RangePrice(1000, 1500);
                    break;
                case "1500-toi-2000-USD":
                    priceSpec = ProductSpec.find1RangePrice(1500, 2000);
                    break;
                case "lon-hon-2000-USD":
                    priceSpec = ProductSpec.minPrice(2000);
                    break;
                default:
                    break;
            }

            // Kết hợp các điều kiện Price bằng OR
            if (priceSpec != null) {
                priceSpecification = (priceSpecification == null) ? priceSpec : priceSpecification.or(priceSpec);
            }
        }
    }

    // Kết hợp điều kiện AND của factory, target với OR của price
    if (priceSpecification != null) {
        combinedSpecification = combinedSpecification.and(priceSpecification);


    }
   return productRepository.findAll(combinedSpecification, page);
   
}

public Page<Product> getAllProductWith1RangePrice(String price , Pageable page)
{  if(price.equals("0-toi-250-USD"))
{
    int minPrice=1;
    int maxPrice=250;
    return  this.productRepository.findAll(ProductSpec.find1RangePrice(minPrice,maxPrice), page);
} 
else if (price.equals("250-toi-500-USD"))
{
    int minPrice=250;
    int maxPrice=500;
    return  this.productRepository.findAll(ProductSpec.find1RangePrice(minPrice,maxPrice), page);
} 
else if (price.equals("500-toi-700-USD"))
{
    int minPrice=500;
    int maxPrice=700;
    return  this.productRepository.findAll(ProductSpec.find1RangePrice(minPrice,maxPrice), page);
} 
else if (price.equals("700-toi-1000-USD"))
{
    int minPrice=700;
    int maxPrice=1000;
    return  this.productRepository.findAll(ProductSpec.find1RangePrice(minPrice,maxPrice), page);
} 
else if (price.equals("1000-toi-1500-USD"))
{
    int minPrice=1000;
    int maxPrice=1500;
    return  this.productRepository.findAll(ProductSpec.find1RangePrice(minPrice,maxPrice), page);
} 
else if (price.equals("1500-toi-2000-USD"))
{
    int minPrice=1500;
    int maxPrice=2000;
    return  this.productRepository.findAll(ProductSpec.find1RangePrice(minPrice,maxPrice), page);
} 
else if (price.equals("lon-hon-2000-USD"))
{
    int minPrice=2000;
    return  this.productRepository.findAll(ProductSpec.minPrice(minPrice), page);
} 
else{
return null;
}

}



public Page<Product> getAllProductWithSpecManyPrice(List<String> price , Pageable page) {

  Specification<Product> combinedSpec= (root, query, builder) ->builder.disjunction();
  int count=0;
  for(String p:price)
  { 

    int min=0;
    int max=0;
    switch (p) {
        case "0-toi-250-USD":
         min=1;
         max=250;
        count++;
            
            break;

            case "250-toi-500-USD":
             min=250;
            max=500;
            count++;
                
                break;

                case "500-toi-700-USD":
                min=500;
               max=700;
               count++;
                   

               case "700-toi-1000-USD":
               min=700;
              max=1000;
              count++;
                  
                  break;
                   

                  case "1000-toi-1500-USD":
                  min=1000;
                 max=1500;
                 count++;
                     
                 break;

                 case "1500-toi-2000-USD":
                  min=1500;
                 max=2000;
                 count++;
                     
                 break;


                 case "lon-hon-2000-USD":
                  min=2000;
                  max=999999999;
                
                 count++;
                     
                 break;
    
      
    }
    if(min!=0 && max!=0)
    {
        Specification<Product> rangeSpec= ProductSpec.findManyPrice(min, max);
        combinedSpec= combinedSpec.or(rangeSpec);

    }
  }
  

if(count==0)
{
    return this.productRepository.findAll(page);
}
return this.productRepository.findAll(combinedSpec, page);

}


public void updateRating(Product product, int newRating) {
    int totalRating = product.getTotalRating();
    double currentAverage = product.getAverageRating();

    // Tính toán averageRating mới
 //   double newAverage = (currentAverage * totalRating + newRating) / (totalRating + 1);
 double newAverage = (currentAverage * totalRating + newRating) / (totalRating + 1);

 // Làm tròn đến 1 chữ số thập phân
 newAverage = Math.round(newAverage * 10.0) / 10.0;

    // Cập nhật vào product
    product.setTotalRating(totalRating + 1);
    product.setAverageRating(newAverage);
}


// @SuppressWarnings("rawtypes")
// public Specification queryByName(String name)
// {
//     return (root, query, builder)->{
//             return builder.equal(root.get("name"), name);
//     };
    
// }

public List<Product> getProductsByIds(List<Long> wishlist) {
    return productRepository.findAllById(wishlist);
}


public void handleSaveProductProcessor(ProductProcessor p)
{
    productProcessorrRepository1.save(p);

}


public ProductProcessor getProductProcessorByProductId(Long productId)
{
 return   productProcessorrRepository1.findProductProcessorByProductId(productId);


}


public ProductArticle getProductArticleByProductId(Long productId)
{
    return productArticleRepository1.findProductArticleByProductId(productId);

}

}
