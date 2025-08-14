package com.Laptop_Website.website_Laptop.domain;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "products")
public class Product {
      @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Tự động tạo ID cho sản phẩm
    private Long id;


    @NotNull
    @Size(min = 2, message = " name must have at least 2 characters")

    private String name; // Tên sản phẩm

     @NotNull
         @Min(value = 1, message = "Price cannot be negative")

    private double price; // Giá sản phẩm


    @NotNull
    @Min(value = 1, message = "Quantity must be greater than 0")

    private int quantity; // Số lượng sản phẩm có sẵn

    private String image; // Hình ảnh của sản phẩm

    private int sold; // Số lượng sản phẩm đã bán
    @NotNull
    @Size(min = 1, message = " factory must have at least 1 characters")
   private String factory; // Nhà máy sản xuất
    @NotNull
    @Size(min = 1, message = " target must have at least 1 characters")
    private String target; // Đối tượng mục tiêu

    private String shortDesc; // Mô tả ngắn
  @Column(columnDefinition="MEDIUMTEXT")
    private String detailDesc; // Mô tả chi tiết
   //1 product - thuộc về - n chi tiết đơn hàng 
    // @OneToMany(mappedBy = "product")
    // private List<OrderDetail> orderDetails;


    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true)
private List<Comment> comments = new ArrayList<>();
    private int totalRating=0;
    private double averageRating=0.0;


    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ProductImage> images = new ArrayList<>();

    @OneToOne(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true)
    private ProductArticle article;



    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    public String getFactory() {
        return factory;
    }

    public void setFactory(String factory) {
        this.factory = factory;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public String getShortDesc() {
        return shortDesc;
    }

    public void setShortDesc(String shortDesc) {
        this.shortDesc = shortDesc;
    }

    public String getDetailDesc() {
        return detailDesc;
    }

    public void setDetailDesc(String detailDesc) {
        this.detailDesc = detailDesc;
    }

    public int getTotalRating() {
        return totalRating;
    }

    public void setTotalRating(int totalRating) {
        this.totalRating = totalRating;
    }

    public double getAverageRating() {
        return averageRating;
    }

    public void setAverageRating(double averageRating) {
        this.averageRating = averageRating;
    }

    


    

}
