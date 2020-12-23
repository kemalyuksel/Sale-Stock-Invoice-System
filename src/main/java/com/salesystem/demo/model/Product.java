package com.salesystem.demo.model;

import org.springframework.format.annotation.NumberFormat;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.List;

@Entity
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty(message = "This field is required.")
    @NotNull
    private String name;

    @NotEmpty(message = "This field is required.")
    @NotNull
    private String code;

    @NotEmpty(message = "This field is required.")
    @NotNull
    private String brand;

    @NotNull
    @Min(value = 1,message = "Price must be greater than or equal to 1.")
    private Float price;

    @NotEmpty(message = "This field is required.")
    @NotNull
    private String description;

    @NotEmpty(message = "This field is required.")
    @NotNull
    private String photoUrl;

    private int quantity = 0;


    @ManyToMany(mappedBy = "products")
    private List<Bill> bills;

    public Product() {
    }


    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public String getPhotoUrl() {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl) {
        this.photoUrl = photoUrl;
    }

    public List<Bill> getBills() {
        return bills;
    }

    public void setBills(List<Bill> bills) {
        this.bills = bills;
    }
}
