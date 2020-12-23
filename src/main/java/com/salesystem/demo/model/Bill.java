package com.salesystem.demo.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Entity
public class Bill {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Float totalPrice;

    private String billNo;

    @DateTimeFormat(pattern="dd.MM.yyyy hh:mm")
    private Date created ;

    @ManyToMany
    @JoinTable(name = "product_bills",joinColumns =  @JoinColumn(name = "bill_id"),inverseJoinColumns = @JoinColumn(name="product_id"))
    private List<Product> products;

    @ManyToOne
    @JoinColumn(name="user_id")
    private User user;


    public Bill() {
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getBillNo() {
        return billNo;
    }

    public void setBillNo(String billNo) {
        this.billNo = billNo;
    }
}
