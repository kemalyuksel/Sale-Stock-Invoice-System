package com.salesystem.demo.repository;

import com.salesystem.demo.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User,Long> {

    public User getUserByUsername(String username);

}
