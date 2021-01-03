package com.salesystem.demo.service;

import com.salesystem.demo.model.Role;
import com.salesystem.demo.model.User;
import com.salesystem.demo.repository.RoleRepository;
import com.salesystem.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserService {

    @Autowired
    private BCryptPasswordEncoder encoder;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private UserRepository userRepository;


    public void save(User user){
        user.setPassword(encoder.encode(user.getPassword()));

        Role userRole = roleRepository.findByName("USER");
        user.setRole(userRole);

        user.setPhotoUrl("user3.png");

        userRepository.save(user);
    }

    public List<User> listAllUser(){
        Role role =  roleRepository.findByName("USER");
        return userRepository.findAll().stream().filter(user -> user.getRole().equals(role) ).collect(Collectors.toList());
    }

    public User getById(Long id){
        return userRepository.getOne(id);
    }

    public  User getByUsername(String name){
        return userRepository.getUserByUsername(name);
    }


}
