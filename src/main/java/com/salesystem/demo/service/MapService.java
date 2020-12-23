package com.salesystem.demo.service;

import com.salesystem.demo.dto.statsDto;
import com.salesystem.demo.model.Bill;
import com.salesystem.demo.model.Product;
import com.salesystem.demo.repository.BillRepository;
import com.salesystem.demo.repository.ProductRepository;
import com.salesystem.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class MapService {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BillRepository billRepository;

    public long getProductCount(){

        return productRepository.count();
    }

    public long getBillCount(){

        return billRepository.count();
    }

    public long getCustomerCount(){

        return userRepository.findAll().stream().count();
    }

    public float getTotalPrice(){

        List<Bill> bills = billRepository.findAll();
        float totalPrice = 0;

        for (Bill bill: bills) {
            totalPrice += bill.getTotalPrice();
        }

        return totalPrice;
    }

    public List<Product> getCriticalProducts(){

        List<Product> products = productRepository.findAll();

        products = products.stream().filter(product -> product.getQuantity() < 10).limit(8).collect(Collectors.toList());

        return products;
    }

    public statsDto getAllStats(){

        statsDto stats = new statsDto();

        stats.setTotalCustomers(getCustomerCount());
        stats.setTotalPrice(getTotalPrice());
        stats.setTotalOrders(getBillCount());
        stats.setTotalProducts(getProductCount());
        stats.setCriticalProducts(getCriticalProducts());

        return stats;
    }

}
