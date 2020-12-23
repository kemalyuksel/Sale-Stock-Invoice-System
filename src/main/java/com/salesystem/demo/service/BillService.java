package com.salesystem.demo.service;

import com.salesystem.demo.model.Bill;
import com.salesystem.demo.repository.BillRepository;
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

    public List<Bill> listAllBill(){
        return billRepository.findAll();
    }

    public void saveBill (Bill bill){

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
