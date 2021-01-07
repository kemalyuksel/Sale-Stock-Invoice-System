package com.salesystem.demo.service;

import com.salesystem.demo.configuration.MyUserPrincipal;
import com.salesystem.demo.model.User;
import com.salesystem.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class MyUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
            User user = userRepository.getUserByUsername(username);

            if (user == null) {
                throw new UsernameNotFoundException("Could not find user");
            }

            return new MyUserPrincipal(user);
        }

}
