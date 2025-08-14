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
@Table(name = "product_processor")
public class ProductProcessor {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    private String cpuTechnology; // Công nghệ CPU

    @NotNull
    private String coreCount; // Số nhân CPU (dùng String)

    @NotNull
    private String threadCount; // Số luồng CPU (dùng String)

    @NotNull
    private String baseClockSpeed; // Tốc độ CPU cơ bản

    @NotNull
    private String maxClockSpeed; // Tốc độ tối đa của CPU

    @OneToOne
    @JoinColumn(name = "product_id", nullable = false)
    private Product product; // Liên kết với sản phẩm

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCpuTechnology() {
        return cpuTechnology;
    }

    public void setCpuTechnology(String cpuTechnology) {
        this.cpuTechnology = cpuTechnology;
    }

    public String getCoreCount() {
        return coreCount;
    }

    public void setCoreCount(String coreCount) {
        this.coreCount = coreCount;
    }

    public String getThreadCount() {
        return threadCount;
    }

    public void setThreadCount(String threadCount) {
        this.threadCount = threadCount;
    }

    public String getBaseClockSpeed() {
        return baseClockSpeed;
    }

    public void setBaseClockSpeed(String baseClockSpeed) {
        this.baseClockSpeed = baseClockSpeed;
    }

    public String getMaxClockSpeed() {
        return maxClockSpeed;
    }

    public void setMaxClockSpeed(String maxClockSpeed) {
        this.maxClockSpeed = maxClockSpeed;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    
}
