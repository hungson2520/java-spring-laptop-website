package com.Laptop_Website.website_Laptop.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;


@Entity
@Table(name = "product_config")
public class ProductConfig {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

   @NotNull
    private String operatingSystem; // Hệ điều hành

    @NotNull
    private String cpu; // Chip xử lý (CPU)

    @NotNull
    private String cpuSpeed; // Tốc độ CPU

    @NotNull
    private String gpu; // Chip đồ họa (GPU)

    @NotNull
    private String ram; // RAM

    @NotNull
    private String storage; // Dung lượng lưu trữ

    @NotNull
    private String availableStorage; // Dung lượng còn lại (khả dụng)

  

   

    @NotNull
    private String screenSize; // Kích thước màn hình

    @NotNull
    private String resolution; // Độ phân giải màn hình

    @NotNull
    private String battery; // Dung lượng pin

  

    @NotNull
    private String cameraInfo; // Thông tin camera

    @OneToOne
    @JoinColumn(name = "product_id", nullable = false)
    private Product product;
    
}
