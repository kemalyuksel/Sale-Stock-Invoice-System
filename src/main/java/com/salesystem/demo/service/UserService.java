package com.salesystem.demo.service;

import com.salesystem.demo.model.Product;
import com.salesystem.demo.model.User;
import com.salesystem.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public List<User> listAllUser(){
        return userRepository.findAll();
    }

    public User getById(Long id){
        return userRepository.getOne(id);
    }

    public  User getByUsername(String name){
        return userRepository.getUserByUsername(name);
    }


}
