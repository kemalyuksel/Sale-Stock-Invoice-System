package com.salesystem.demo.service;

import com.salesystem.demo.dto.productSellDto;
import com.salesystem.demo.model.Bill;
import com.salesystem.demo.model.Product;
import com.salesystem.demo.model.User;
import com.salesystem.demo.repository.BillRepository;
import com.salesystem.demo.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Service
public class BillService {

    @Autowired
    private BillRepository billRepository;

    @Autowired
    ProductService productService;

    public List<Bill> listAllBill(){
        return billRepository.findAll();
    }


    public List<Bill> findUserBills(User user){
        return user.getBills();
    }

    public void saveBill (productSellDto sellDto){

        Bill bill = new Bill();

        bill.setUser(sellDto.getUser());
        bill.setProducts(sellDto.getProducts());

        float totalPrice = 0;

        for (Product product : bill.getProducts()){
            totalPrice +=product.getPrice();
            productService.delete(product.getId());
        }
        bill.setTotalPrice(totalPrice);

        String random =  Long.toHexString(Double.doubleToLongBits(Math.random()));
        bill.setBillNo(random);

        SimpleDateFormat formatter = new SimpleDateFormat("dd.MM.yyyy hh:mm");
        Date date = new Date();
        bill.setCreated(date);

        billRepository.save(bill);
    }

    public Bill findById(Long id){

        return billRepository.getOne(id);
    }

}
