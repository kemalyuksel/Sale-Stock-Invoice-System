package com.salesystem.demo.dto;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

public class loginDto {

    @NotEmpty(message = "Please enter a username")
    private String username;
    @NotEmpty(message = " Please enter a password")
    private String password;

    public loginDto() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
